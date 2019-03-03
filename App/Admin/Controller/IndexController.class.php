<?php

namespace Admin\Controller;

class IndexController extends BaseController
{
    public function index()
    {
        $this->display();
    }

    public function login()
    {
        // var_dump($_POST);
        $username = trim(I('post.username'));
        $password = trim(I('post.pwd'));
        $re = I('post.re');
        //echo $re;
        // echo $password;
        $result = M('admins')->where(array('name' => $username, 'password' => md5($password)))->find();
        if (!empty($_COOKIE['password'])) {
            cookie('password', null);
        }
        if (!$result) {
            $this->error('密码输入错误');
        } else {
            session('aid', $result['aid']);
            if ($re) {
                cookie('admin', $username, 3600 * 24 * 7);//记住我
                cookie('password', trim(I('post.pwd')), 3600 * 24 * 7);//记住我
            } else {
                cookie('admin', $username, 3600 * 24 * 7);
            }
            $url = U('Admin/index');
            session('pica', $result['pic']);
            session('aname', $result['name']);
            header("Location: $url");
        }
    }

    public function logout()
    {
        session(null);
        $url = U('Home/Index/index');
        header("Location: $url");
    }
}