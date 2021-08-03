<h1><?= $this->data['new']['caption'] ?></h1>
<img src="public/images/news/<?= $this->data['new']['id'] . '_' . $this->data['new']['picture'] ?>">
<div><?= $this->data['new']['text'] ?></div>
<hr>
<?php
//print_r($this->data);
foreach ($this->data['comments'] as $row) {
    echo "<i>$row[text]</i><b>$row[name]</b><br>";
}
?>
<hr>
<?php
if (isset($_SESSION["user"]["code"]) and $_SESSION["user"]["code"] == "user") {
    ?>
    <form action="?type=shownews&action=addcomment" method="post">
        <input type="hidden" name="news_id" value="<?= $this->data['new']['id'] ?>">
        <textarea name="text" class="form-control" placeholder="Leave your comment"></textarea>
        <input type="submit" value="ok" class="btn btn-primary">
    </form>
    <?php
}
//print_r($_SESSION);
