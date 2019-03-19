<?php

namespace Admin\Model;
class MovieHallsModel extends BaseModel
{
    protected $tableName = 'movie_halls';
    protected $_link = array(
        'cinemas' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'cinemas',
            'foreign_key' => 'cinemas_id',
        ),
        'movies' => array(
            'mapping_type' => self::MANY_TO_MANY,
            'class_name' => 'movies',
            'foreign_key' => 'movie_halls_id',
            'relation_foreign_key' => 'movies_id',
            'relation_table' => 'rachel_movie_halls_movies'
        )
    );

}