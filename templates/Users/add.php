<form action="?type=<?= $this->data['controllerName'] ?>&action=add" method="post">
    <?php
    //    print_r($this->data);
    foreach ($this->data['comments'] as $field => $comment) {
        if ($field == "user_groups_id") {
            echo $this->data["comments"][$field] . "<br>";
            echo "<select name='$field'>";
            foreach ($this->data["groupList"] as $id => $name) {
                echo "<option value='$id' " .
                    (($this->data["row"]['user_groups_id'] == $id) ? "selected" : "") .
                    ">$name</option>";
            }
            echo "</select><br>";
        } else {
            echo "<input name='$field' placeholder='$comment'><br>";
        }
    }
    ?>
    <input type="submit" value="ok" class="btn btn-primary">
</form>