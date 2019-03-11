<?php

namespace Admin\Model;
class PublishModel extends BaseModel
{
    protected $tableName = 'publish';
    protected $_link = array(
        'movie_halls' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'movie_halls',
            'foreign_key' => 'movie_halls_id',
        ),
        'movies' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'movies',
            'foreign_key' => 'movies_id',
        ),
        'cinemas' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'cinemas',
            'foreign_key' => 'cinemas_id',
        )
    );

}