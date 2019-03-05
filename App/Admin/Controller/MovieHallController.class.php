<?php


namespace Admin\Controller;

class MovieHallController extends BaseController
{
    public function index()
    {
        $res = D($this->CINEMA_TABLE)->relation(true)->select();
        $this->assign($this->default_list, $res);
        $this->display();
    }
}
