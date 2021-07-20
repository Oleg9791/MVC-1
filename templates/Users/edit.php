<?php
//print_r($this->data);
?>

<form action="?type=<?= $this->data['controllerName'] ?>&action=edit&id=<?= $this->data["id"] ?>" method="post">
    <?php
    foreach ($this->data["row"] as $field => $value) {
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
            echo $this->data["comments"][$field] . "<br>";
            echo "<input name='$field' value='$value'><br>";
        }
    }
    //    print_r($this->data["groupList"]);
    ?>
    <input type="submit" value="ok" class="btn btn-primary">
</form>

<!--123-->