<?php

namespace Admin\Model;
class MovieHallModel extends BaseModel
{
    protected $tableName = 'movie_halls';
    protected $_link = array(
        'cinema' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'cinema',
        )
    );

}