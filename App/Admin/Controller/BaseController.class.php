<?php


namespace Admin\Controller;

use Think\Controller;

class BaseController extends Controller
{
    public $CINEMAS_TABLE = "cinemas";
    public $ADMINS_TABLE = "admins";
    public $MOVIE_HALLS_TABLE = "movie_halls";
    public $MOVIES_TABLE = "movies";


    public $default_list = 'list';


    public function getCreateTime()
    {
        return date('Y-m-d H:i:s');
    }

    public function addCreateTime($data)
    {
        $data['create_time'] = $this->getCreateTime();
        return $data;
    }

    public function checkAndReturn($result, $successMsg, $errorMsg, $successRedirect = '', $errorRedirect = '')
    {
        if ($result) {
            $this->success($successMsg, $successRedirect);
        } else {
            $this->error($errorMsg, $errorRedirect);
        }
    }

    public function addData($result)
    {
        $this->checkAndReturn($result, "添加成功", "添加失败");
    }

    public function updateData($result)
    {
        $this->checkAndReturn($result, "更新成功", "更新失败");
    }

    public function delData($result)
    {
        $this->checkAndReturn($result, "删除成功", "删除失败");
    }

    public function jsonReturn($data)
    {
        echo json_encode($data, JSON_UNESCAPED_UNICODE);;
    }
}
