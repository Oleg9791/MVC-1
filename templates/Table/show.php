<?php

use W1020\HTML\Table;

echo (new Table())->setData($this->data)->setClass("table table-striped table-hover")->html();

