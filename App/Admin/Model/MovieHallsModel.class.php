<?php

namespace Admin\Model;
class MovieHallsModel extends BaseModel
{
    protected $tableName = 'movie_halls';
    protected $_link = array(
        'cinemas' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'cinema',
        )
    );

}