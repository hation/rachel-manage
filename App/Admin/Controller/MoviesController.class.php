<?php


namespace Admin\Controller;

class MoviesController extends BaseController
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
        if (!$fileInfo) {// 上传错误提示错误信息
            $this->error("图片上传失败");
        }
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

    public function updateMovie()
    {
        $data['id'] = I('get.id');
        $res = M($this->MOVIES_TABLE)->where($data)->find();
        if (!empty($res['release_time'])) {
            $res['release_time'] = date("Y-m-d", strtotime($res['release_time']));
        }
        $this->assign($this->default_item, $res);
        $this->display();
    }

    public function update()
    {
        $data['name'] = I('post.name');
        $data['id'] = I('post.movie_id');
        $data['play_time'] = I('post.play_time');
        $data['release_time'] = I('post.release_time');
        $data['is_hot'] = I('post.is_hot');
        $data['info'] = I('post.info');
        if ($_FILES['pic']['error'] != 4) {
            $path = './Public/movies/';
            $fileInfo = uploadImage($_FILES['pic'], $path);
            $data['url'] = $fileInfo['savepath'] . $fileInfo['savename'];
        };
        $res = M($this->MOVIES_TABLE)->save($data);
        $this->checkAndReturn($res, "修改成功", "修改失败", U('index'));
    }
}
