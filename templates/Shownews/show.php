<?php

use W1020\HTML\Pagination;
use W1020\HTML\Table;

echo "<table>";
foreach ($this->data["table"] as $row) {
    echo "<tr><td><b>$row[caption]</b></td></tr>";
    echo "<tr><td><img class='news_image' src='public/images/news/$row[id]_$row[picture]'></td></tr>";
    echo "<tr>";
    echo "<td>" . mb_substr($row['text'], 0, 10) . "...</td>";
    echo "</tr>";

}
echo "</table>";

echo (new Pagination())
    ->setUrlPrefix("?type={$this->data['controllerName']}&action=show&page=")
    ->setPageCount($this->data["pageCount"])
    ->setActivePage($this->data["activePage"])
    ->html();


