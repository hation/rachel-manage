<?php

namespace Api\Controller;

use Admin\Controller\BaseController;

class CommentsController extends BaseController
{
    /**
     *
     */
    public function movieComments()
    {

        $data = C('DATA');
        $where['movies_id'] = I('request.movie_id');
        $where['cinemas_id'] = I('request.cinema_id');
        $data['result']['list'] = D($this->COMMENTS)->where($where)->relation("users")->select();
        $this->jsonReturn($data);
    }

    public function userComments()
    {

        $data = C('DATA');
        $where['users_id'] = I('request.id');
        $data['result']['list'] = D($this->COMMENTS)->where($where)->relation(array("movies", "cinemas"))->select();
        $this->jsonReturn($data);
    }

    public function addComment()
    {
        $data = C('DATA');
        $where['users_id'] = I('request.user_id');
        $where['movies_id'] = I('request.movie_id');
        $where['cinemas_id'] = I('request.cinema_id');
        $where['content'] = I('request.content');
        $where = $this->addCreateTime($where);
        if (!$this->saveData($this->COMMENTS, $where)) {
            $data['msg'] = "评论失败";
            $data['code'] = 0;
        } else {
            $data['msg'] = "评论成功";
        }
        $this->jsonReturn($data);
    }
}