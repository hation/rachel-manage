<?php


namespace Admin\Controller;

use Think\Controller;

class BaseController extends Controller
{
    public $CINEMA_TABLE = "cinema";
    public $ADMINS_TABLE = "admins";
    public $MOVIE_HALL_TABLE = "movie_hall";

    public $default_list = 'list';


    public function getCreateTime()
    {
        return date('Y-m-d H:i:s');
    }

    public function checkAndReturn($result, $successMsg, $errorMsg)
    {
        if ($result) {
            $this->success($successMsg);
        } else {
            $this->error($errorMsg);
        }
    }

    public function jsonReturn($data)
    {
        return json_encode($data, JSON_UNESCAPED_UNICODE);;
    }
}
