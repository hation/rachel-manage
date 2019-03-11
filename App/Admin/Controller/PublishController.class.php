<?php

namespace Admin\Controller;

class PublishController extends BaseController
{
    public function index()
    {
        $res = D($this->PUBLISH)->relation(true)->select();
        $this->displayDefaultList($res);
    }

    public function del()
    {
        $data['id'] = I('get.id');
        $r = M($this->PUBLISH)->where($data)->delete();
        $this->delData($r);
    }

    public function publishMovie()
    {
        $this->display();
    }

    public function add()
    {
        $data['movies_id'] = I('post.movies_id');
        $data['cinemas_id'] = I('post.cinemas_id');
        $data['movie_halls_id'] = I('post.movie_halls_id');
        $data['price'] = I('post.price');
        $data['show_time'] = I('post.show_time');
        $data = $this->addCreateTime($data);
        $res = $this->saveData($this->PUBLISH, $data);
        $this->checkAndReturn($res, "添加成功", "添加失败", U("index"));
    }

    public function getAllMovies()
    {
        $res = M($this->MOVIES_TABLE)->select();
        $this->jsonReturn($res);
    }

    public function getAllCinemas()
    {
        $res = M($this->CINEMAS_TABLE)->select();
        $this->jsonReturn($res);
    }

    public function getAllMovieHalls()
    {
        $data['cinemas_id'] = I('get.id');
        $res = M($this->MOVIE_HALLS_TABLE)->where($data)->select();
        $this->jsonReturn($res);
    }
}