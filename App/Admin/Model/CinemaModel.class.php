<?php

namespace Admin\Model;
class CinemaModel extends BaseModel
{
    protected $tableName = "cinema";
    protected $_link = array(
        'movie_hall' => array(
            'mapping_type' => self::HAS_MANY,
            'class_name' => 'movieHall',
            'foreign_key' => 'cinema_id'
        )
    );

}