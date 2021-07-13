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

}