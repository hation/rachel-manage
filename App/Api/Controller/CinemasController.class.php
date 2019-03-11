<?php

namespace Api\Controller;

use Admin\Controller\BaseController;

class CinemasController extends BaseController
{

    /**
     * 所有影院
     */
    public function allCinemas()
    {
        $data = C('DATA');
        $res = $this->getList($this->CINEMAS_TABLE);
        $data = $this->setList($data, $res);
        $this->jsonReturn($data);
    }

    /**
     * 放映该电影的影院
     */
    public function hasMoviesCinemas()
    {
        $data = C('DATA');
        $prefix = C('DB_PREFIX');
        $where[$prefix . $this->PUBLISH . '.movies_id'] = I('request.id');
        $res = M($this->PUBLISH)
            ->join($prefix . $this->CINEMAS_TABLE . " on " . $prefix . $this->PUBLISH . ".cinemas_id = " . $prefix . $this->CINEMAS_TABLE . ".id")
            ->group($prefix . $this->PUBLISH . ".cinemas_id")
            ->where($where)
            ->select();
        $data = $this->setList($data, $res);
        $this->jsonReturn($data);
    }

    /**
     * 影厅列表
     */
    public function movieHalls()
    {
        $data = C('DATA');
        $prefix = C('DB_PREFIX');
        $where[$prefix . $this->PUBLISH . '.movies_id'] = I('request.movie_id');
        $where[$prefix . $this->PUBLISH . '.cinemas_id'] = I('request.cinema_id');
        $res = M($this->PUBLISH)
            ->join($prefix . $this->MOVIE_HALLS_TABLE . " on " . $prefix . $this->PUBLISH . ".movie_halls_id = " . $prefix . $this->MOVIE_HALLS_TABLE . ".id")
            ->group($prefix . $this->PUBLISH . ".movie_halls_id")
            ->where($where)
            ->select();
        $data = $this->setList($data, $res);
        $this->jsonReturn($data);
    }

    /**
     * 该影院的所有电影
     */
    public function cinemaHasMovies()
    {
        $data = C('DATA');
        $prefix = C('DB_PREFIX');
        $where[$prefix . $this->PUBLISH . '.cinemas_id'] = I('request.id');
        $res = M($this->PUBLISH)
            ->join($prefix . $this->CINEMAS_TABLE . " on " . $prefix . $this->PUBLISH . ".cinemas_id = " . $prefix . $this->CINEMAS_TABLE . ".id")
            ->join($prefix . $this->MOVIES_TABLE . " on " . $prefix . $this->PUBLISH . ".movies_id = " . $prefix . $this->MOVIES_TABLE . ".id")
            ->group($prefix . $this->PUBLISH . ".movies_id")
            ->where($where)
            ->select();
        $data = $this->setList($data, $res);
        $this->jsonReturn($data);
    }

    public function seats()
    {
        $data = C('DATA');
        $whereMovieHalls['id'] = I('request.id');
        $wherePublish['publish'] = I('request.id');
        $data['item'] = $this->getItem($this->MOVIE_HALLS_TABLE, $whereMovieHalls);
        $data['list'] = $this->getList($this->SELECTED_SEATS, $wherePublish);
        $data['msg'] = "查询成功";
        $this->jsonReturn($data);
    }
}