<?php

namespace Api\Controller;

use Admin\Controller\BaseController;

class MoviesController extends BaseController
{

    /**
     * 轮播图
     */
    public function banners()
    {
        $data = C('DATA');
        $res = $this->getList($this->BANNERS);
        $data = $this->setList($data, $res);
        $this->jsonReturn($data);
    }

    /**
     * 热门电影
     */
    public function hotMovies()
    {
        $data = C('DATA');
        $where['is_hot'] = "1";
        $res = $this->getList($this->MOVIES_TABLE, $where);
        $data = $this->setList($data, $res);
        $this->jsonReturn($data);
    }

    /**
     * 全部电影
     */
    public function allMovies()
    {
        $data = C('DATA');
        $res = $this->getList($this->MOVIES_TABLE);
        $data = $this->setList($data, $res);
        $this->jsonReturn($data);
    }

    /**
     * 电影信息
     */
    public function movieInfo()
    {
        $data = C('DATA');
        $where['id'] = I('request.id');
        $res = $this->getItem($this->MOVIES_TABLE, $where);
        $data = $this->setItem($data, $res);
        $this->jsonReturn($data);
    }
}