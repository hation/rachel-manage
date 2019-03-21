<?php

namespace Api\Model;
class CommentsModel extends BaseModel
{
    protected $tableName = "comments";
    protected $_link = array(
        'users' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'users',
            'foreign_key' => 'users_id'
        ),
        'movies' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'movies',
            'foreign_key' => 'movies_id'
        ),
        'cinemas' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'cinemas',
            'foreign_key' => 'cinemas_id'
        )
    );
}