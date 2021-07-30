<h1><?= $this->data['new']['caption'] ?></h1>
<img src="public/images/news/<?= $this->data['new']['id'] . '_' . $this->data['new']['picture'] ?>">
<div><?= $this->data['new']['text'] ?></div>
<hr>
<?php
//print_r($this->data);
foreach ($this->data['comments'] as $row) {
    echo "<i>$row[text]</i><b>$row[name]</b><br>";
}
