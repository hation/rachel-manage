<?php

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller
{
    public function index()
    {
        return redirect(U('Admin/Index/index'));
    }
}