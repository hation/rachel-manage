<?php

namespace Admin\Model;
class OrdersModel extends BaseModel
{
    protected $tableName = 'orders';
    protected $_link = array(
        'users' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name' => 'users',
            'foreign_key' => 'users_id',
        )
    );

}