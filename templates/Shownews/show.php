<?php

use W1020\HTML\Pagination;
use W1020\HTML\Table;

echo "<table>";
foreach ($this->data["table"] as $row) {
    echo "<tr><td><a href='?type={$this->data['controllerName']}&action=showNews&id=$row[id]'><b>$row[caption]</b><br>";
    echo "<img class='news_image' src='public/images/news/$row[id]_$row[picture]'><br>";
    echo mb_substr($row['text'], 0, 10) . "...</a></td>";
    echo "</tr>";

}
echo "</table>";

echo (new Pagination())
    ->setUrlPrefix("?type={$this->data['controllerName']}&action=show&page=")
    ->setPageCount($this->data["pageCount"])
    ->setActivePage($this->data["activePage"])
    ->html();


