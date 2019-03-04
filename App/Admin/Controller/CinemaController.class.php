<?php


namespace Admin\Controller;

class CinemaController extends BaseController
{
    public function index()
    {
        $res = M($this->CINEMA_TABLE)->select();
        $this->assign($this->default_list, $res);
        $this->display();
    }

    public function cinemaIsValid()
    {
        $name = I('post.add_cinema_name');
        $ex = M($this->CINEMA_TABLE)->where(array('name' => $name))->find();
        if ($ex)
            $ex['flag'] = 1;
        else {
            $ex['flag'] = 0;
        }
        echo json_encode($ex, JSON_UNESCAPED_UNICODE);
    }

    public function addCinema()
    {
        $data['name'] = I('post.add_cinema_name');
        $data['address'] = I("add_cinema_address");
        $data['create_time'] = $this->getCreateTime();
        $res = M($this->CINEMA_TABLE)->add($data);
        $this->checkAndReturn($res, "添加成功", '添加失败');
    }

    public function del()
    {
        $id = I('get.id');
        $r = M($this->CINEMA_TABLE)->where(array('id' => $id))->delete();
        if ($r) {
            $this->success('删除成功！');
        } else {
            $this->error('删除失败！');
        }
    }
}
