<?php


namespace Admin\Controller;

class MovieHallsController extends BaseController
{
    public function index()
    {
        $res = D($this->CINEMAS_TABLE)->relation(true)->select();
        $this->assign($this->default_list, $res);
        $this->display();
    }

    public function getCinemaList()
    {
        $res = M($this->CINEMAS_TABLE)->select();
        $this->jsonReturn($res);
    }

    public function addMovieHall()
    {
        $data['cinema_id'] = I('post.cinema');
        $data['hall'] = I('post.add_movie_hall_name');
        $data = $this->addCreateTime($data);
        $res = M($this->MOVIE_HALLS_TABLE)->add($data);
        $this->addData($res);
    }

    public function isValidMovieHall()
    {
        $data['id'] = I('post.id');
        $res = M($this->MOVIE_HALLS_TABLE)->where($data)->find();
        if ($res) {
            $res['isValidCinema'] = 1;
        } else {
            $res['isValidCinema'] = 0;
        }
        $this->jsonReturn($res);
    }

    public function updateMovieHall()
    {
        $data['id'] = I('post.movie_hall_id');
        $data['hall'] = I('post.update_movie_hall_name');
        $data = $this->addCreateTime($data);
        $res = M($this->MOVIE_HALLS_TABLE)->save($data);
        $this->updateData($res);
    }

    public function del()
    {
        $id = I('get.id');
        $r = M($this->MOVIE_HALLS_TABLE)->where(array('id' => $id))->delete();
        $this->delData($r);
    }
}
