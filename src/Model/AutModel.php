<?php


namespace App\Model;


use W1020\Table as ORMTable;

class AutModel extends ORMTable
{
    /**
     * @param string $login
     * @param string $pass
     * @return array
     * @throws \Exception
     */
    public function checkUser(string $login, string $pass): array
    {
        return $this->query("SELECT * FROM `$this->tableName` WHERE login='$login' AND pass='$pass'");
//        if (empty($row)) {
//            return false;
//        } else {
//            return $row[0]['user_group'];
//        }
        //print_r($this->query("SELECT * FROM `users` WHERE login='$login' AND pass='$pass'")[0]['user_group']);
    }

    /**
     * @param string $login
     * @return bool
     * @throws \Exception
     */
    public function checkUserExists(string $login): bool
    {
        return $this->query("SELECT COUNT(*) AS 'C' FROM `$this->tableName` WHERE `login`='$login'")[0]['C'];
    }

    public function addNewUser(string $login, string $pass, string $name, string $user_group): void
    {
        $this->runSQL("INSERT INTO `users`(`login`, `pass`, `name`, `user_group`) " .
                         "VALUES ('$login','$pass','$name','$user_group')");
    }
}