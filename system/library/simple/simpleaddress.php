<?php
/*
@author Dmitriy Kubarev
@link   http://www.simpleopencart.com
*/

include_once(DIR_SYSTEM . 'library/simple/simple.php');

class SimpleAddress extends Simple {
    protected static $_instance;

    protected function __construct($registry) {
        $this->setPage('address');
        parent::__construct($registry);
    }

    public static function getInstance($registry) {
        if (self::$_instance === null) {
            self::$_instance = new self($registry);
        }

        return self::$_instance;
    }
}