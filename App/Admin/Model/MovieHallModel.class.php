<?php

namespace Admin\Model;
class MovieHallModel extends BaseModel
{
    protected $tableName = 'movie_hall';
    protected $_link = array(
        'cinema' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'cinema',
        )
    );

}