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

    public function addMovie()
    {
        $this->display();
    }

    public function add()
    {
        $path = './Public/movies/';
        $fileInfo = uploadImage($_FILES['pic'], $path);
        $data['name'] = I('post.name');
        $data['play_time'] = I('post.play_time');
        $data['release_time'] = I('post.release_time');
        $data['is_hot'] = I('post.is_hot');
        $data['info'] = I('post.info');
        $data['name'] = I('post.name');
        $data['url'] = $fileInfo['savepath'] . $fileInfo['savename'];
        $data = $this->addCreateTime($data);
        $res = M($this->MOVIES_TABLE)->add($data);
        $this->checkAndReturn($res, "添加成功", "添加失败", U("index"));
    }

    public function del()
    {
        $id = I('get.id');
        $r = M($this->MOVIES_TABLE)->where(array('id' => $id))->delete();
        $this->delData($r);
    }
}
