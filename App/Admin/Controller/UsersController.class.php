<?php


namespace Admin\Controller;

class UsersController extends BaseController
{
    public function index()
    {
        $res = M($this->USERS)->select();
        $this->assign($this->default_list, $res);
        $this->display();
    }

    public function del()
    {
        $id = I('get.id');
        $r = M($this->USERS)->where(array('id' => $id))->find();
        if ($r['is_black'] == "1") {
            $r['is_black'] = "0";
        } else {
            $r['is_black'] = "1";
        }
        $re = M($this->USERS)->save($r);
        $this->updateData($re);
    }
}
