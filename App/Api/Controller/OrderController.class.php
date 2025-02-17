<?php

namespace Api\Controller;

use Admin\Controller\BaseController;

class OrderController extends BaseController
{

    public function purchase()
    {
        $data = C('DATA');
        $where['id'] = I('request.user_id');
        $where['pay_password'] = I('request.pay_password');
        $userRes = M($this->USERS)->where($where)->find();
        if (!empty($userRes)) {
            $publish['movie_halls_id'] = I('request.movie_hall_id');
            $publish['movies_id'] = I('request.movie_id');
            $publish['cinemas_id'] = I('request.cinema_id');
            $publishData = M($this->PUBLISH)->where($publish)->find();
            $orderNumber = createdOrderNumber();
            if (!empty($publishData)) {
                $publishRes['users_id'] = $where['id'];
                $publishRes['order_number'] = $orderNumber;
                $publishRes['cdkey'] = genRandCode(6);
                $publishRes['pay_status'] = 1;
                $publishRes['price'] = I('request.price');
                $publishRes = $this->addCreateTime($publishRes);
                $orderRes = M($this->ORDERS)->add($publishRes);
                $seatX = explode(",", I('request.seatX'));
                $seatY = explode(",", I('request.seatY'));
                if (count($seatX) == 0) {
                    $data['msg'] = "没选座位";
                    $data['code'] = 0;
                } else {
                    $seats = array();
                    for ($i = 0; $i < count($seatX); $i++) {
                        $seats[$i]['publish_id'] = $publishData['id'];
                        $seats[$i]['order_number'] = $orderNumber;
                        $seats[$i]['x'] = $seatX[$i];
                        $seats[$i]['y'] = $seatY[$i];
                        $seats[$i]['create_time'] = $this->getCreateTime();
                    }
                    $seatsRes = M($this->SELECTED_SEATS)->addAll($seats);
                    $userRes['money'] = (double)$userRes['money'] - (double)$publishRes['price'];
                    $userRe = M($this->USERS)->save($userRes);
                    if ($orderRes && $seatsRes && $userRe) {
                        $data['msg'] = "购买成功";
                    } else {
                        $data['msg'] = "购买失败";
                        $data['code'] = 0;
                    }
                }
            } else {
                $data['msg'] = "数据错误";
                $data['code'] = 0;
            }
        } else {
            $data['msg'] = "密码错误";
            $data['code'] = 0;
        }
        $this->jsonReturn($data);
    }

    public function orderList()
    {
        $data = C('DATA');
        $where['users_id'] = I('request.user_id');
        $res = M($this->ORDERS)->where($where)->select();
        if (!empty($res)) {
            for ($i = 0, $size = count($res); $i < $size; $i++) {
                $publish = M($this->PUBLISH)->where(array("order_number" => $res[$i]['order_number']))->find();
                $movie = M($this->MOVIES_TABLE)->where(array("id" => $publish['movies_id']))->find();
                $res[$i]['movie_name'] = $movie['name'];
                $res[$i]['play_time'] = $movie['play_time'];
                $res[$i]['url'] = $movie['url'];
                $res[$i]['show_time'] = $publish['show_time'];
            }
            $data['result']['list'] = $res;
            $data['msg'] = "查询成功";
        } else {
            $data['msg'] = "暂无订单";
            $data['result']['list'] = array();
        }
        return $this->jsonReturn($data);
    }
}