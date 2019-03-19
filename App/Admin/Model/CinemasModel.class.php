<?php

namespace Admin\Model;
class CinemasModel extends BaseModel
{
    protected $tableName = "cinemas";
    protected $_link = array(
        'movie_hall' => array(
            'mapping_type' => self::HAS_MANY,
            'class_name' => 'movieHalls',
            'foreign_key' => 'cinemas_id'
        )
    );

}