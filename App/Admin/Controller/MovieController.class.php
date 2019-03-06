<?php


namespace Admin\Controller;

class MovieController extends BaseController
{
    public function index()
    {
        $res = M($this->MOVIES_TABLE)->select();
        $this->assign($this->default_list, $res);
        $this->display();
    }


}
