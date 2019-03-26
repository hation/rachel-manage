<?php

namespace Api\Controller;

use Admin\Controller\BaseController;

class OrderController extends BaseController
{

    public function purchase()
    {
        $data = C('DATA');
        $where['users_id'] = I('request.user_id');
        $where['pay_password'] = I('request.pay_password');
        $userRes = M($this->USERS)->where($where)->find();
        if ($userRes) {
            $publish['movie_halls_id'] = I('request.movie_halls_id');
            $publish['movies_id'] = I('request.movies_id');
            $publish['cinemas_id'] = I('request.cinemas_id');
            $publishRes['publish_id'] = M($this->PUBLISH)->where($publish)->find();
            if (!empty($publishRes)) {
                $publishRes['users_id'] = $where['users_id'];
                $publishRes['order_number'] = createdOrderNumber();
                $publishRes['cdkey'] = genRandCode(6);
                $publishRes['pau_status'] = 1;
                $publishRes['price'] = I('request.price');
                $publishRes = $this->addCreateTime($publishRes);
                $orderRes = M($this->ORDERS)->add($publishRes);
                $seat = json_decode(I('request.seats'));
                if (count($seat) == 0) {
                    $data['msg'] = "没选座位";
                    $data['code'] = 0;
                } else {
                    for ($i = 0; $i < count($seat); $i++) {
                        $seats[$i]['order_number'] = $publishRes['order_number'];
                        $seats[$i]['publish_id'] = $publishRes['publish_id'];
                        $seats[$i]['seatX'] = $seat[$i]['seatX'];
                        $seats[$i]['seatY'] = $seat[$i]['seatY'];
                        $seats[$i]['create_time'] = $this->getCreateTime();;
                        $seatsRes = M($this->SELECTED_SEATS)->addAll($seats);
                        if ($orderRes && $seatsRes) {
                            $data['msg'] = "购买成功";
                        } else {
                            $data['msg'] = "购买失败";
                            $data['code'] = 0;
                        }
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
}