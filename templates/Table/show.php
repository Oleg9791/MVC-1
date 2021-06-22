<?php

use W1020\HTML\Table;

echo (new Table())
    ->setData($this->data["table"])
    ->setHeaders($this->data["comments"])
    ->addColumn(fn($row) => "<a href='?type={$this->data['controllerName']}&action=del&id=$row[id]'>❌</a>")
    ->addColumn(fn($row) => "<a href='?type={$this->data['controllerName']}&action=showedit&id=$row[id]'>✏</a>")
    ->setClass("table table-striped table-hover")
    ->html();
?>

<a href="?type=<?=$this->data['controllerName']?>&action=showadd" class="btn btn-primary">Добавить</a>
