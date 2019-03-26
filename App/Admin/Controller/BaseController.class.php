<?php


namespace Admin\Controller;

use Think\Controller;

class BaseController extends Controller
{
    public $CINEMAS_TABLE = "cinemas";
    public $ADMINS_TABLE = "admins";
    public $MOVIE_HALLS_TABLE = "movie_halls";
    public $MOVIES_TABLE = "movies";
    public $PUBLISH = "publish";
    public $SELECTED_SEATS = "selected_seats";
    public $BANNERS = "banners";
    public $COMMENTS = "comments";
    public $USERS = "users";
    public $ORDERS = "orders";


    public $default_list = 'list';
    public $default_item = 'data';


    public function getCreateTime()
    {
        return date('Y-m-d H:i:s');
    }

    public function addCreateTime($data)
    {
        $data['create_time'] = $this->getCreateTime();
        return $data;
    }

    public function displayDefaultList($res)
    {
        $this->assign($this->default_list, $res);
        $this->display();
    }

    public function getList($tableName, $where = '')
    {
        return M($tableName)->where($where)->select();
    }

    public function setList($data, $res)
    {
        $data['msg'] = "查询成功";
        $data['result']['list'] = $res;
        return $data;
    }

    public function getItem($tableName, $where = '')
    {
        return M($tableName)->where($where)->find();
    }

    public function setItem($data, $res)
    {
        if (empty($res)) {
            $data['msg'] = "查无结果";
            $data['code'] = 0;
        } else {
            $data['msg'] = "查询成功";
            $data['code'] = 1;
            $data['result']['item'] = $res;
        }
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

    public function saveData($tableName, $data)
    {
        return M($tableName)->add($data);
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
