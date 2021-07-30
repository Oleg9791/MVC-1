<?php

namespace App\Model;

use W1020\Table as ORMTable;

class ShowNewsModel extends ORMTable
{

    public function getNewsComments($newsId)
    {
        $sql = <<<SQL
SELECT
    `news`.id,
    `comments`.`text`,
    `users`.`name`
FROM
    `comments`,
    `news`,
    `users`
WHERE
    `comments`.news_id = `news`.id AND `users`.id = `comments`.users_id AND `news`.id = $newsId
SQL;

        return $this->query($sql);
    }
}
