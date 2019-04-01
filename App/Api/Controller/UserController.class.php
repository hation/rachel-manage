<?php

namespace Api\Controller;

use Admin\Controller\BaseController;

class UserController extends BaseController
{
    /**
     * 登录
     */
    public function login()
    {
        $data = C('DATA');
        $where['username'] = I('request.username');
        $where['password'] = I('request.password');
        $res = M($this->USERS)->where($where)->find();
        if (!empty($res)) {
            $data["msg"] = "登陆成功";
            $data["result"] = $res;
        } else {
            $data["msg"] = "登录失败";
            $data['code'] = 0;
            $data['result'] = new \stdClass();
        }
        $this->jsonReturn($data);
    }

    /**
     * 注册
     */
    public function register()
    {
        $data = C('DATA');
        $where['username'] = I('request.username');
        $where['password'] = I('request.password');
        $where['pay_password'] = I('request.pay_password');
        $where['phone'] = I('request.phone');
        $where['money'] = "10000";
        $where = $this->addCreateTime($where);
        $path = './Public/users/';
        $where['portrait'] = "default" . genRandCode(1) . ".jpg";
        $res = M($this->USERS)->add($where);
        if ($res) {
            $data["msg"] = "注册成功";
        } else {
            $data["msg"] = "注册失败";
            $data['code'] = 0;
        }
        $this->jsonReturn($data);
    }

}