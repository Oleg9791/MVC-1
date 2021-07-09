<?php

namespace App\Controller;

use W1020\Table as ORMTable;
use App\View\View;

/**
 * Class Table
 * @package App\Controller
 */
abstract class Table extends AbstractController
{
    /**
     * @var ORMTable
     */
    protected ORMTable $model;
    /**
     * @var string
     */
    protected string $tableName = "";
    /**
     * @var int
     */
    protected int $pageSize = 10;

    public function __construct()
    {
        parent::__construct();
        $config = include __DIR__ . "/../../config.php";
        $config["table"] = $this->tableName;
        $this->pageSize = $config["page_size"];
        $this->model = new ORMTable($config);
    }

    /**
     * Показывает таблицу
     * @throws \Exception
     */
    public function actionShow()
    {
        $page = $_GET["page"] ?? 1;
        $headers["id"] = "№";

        foreach ($this->model->columnComments() as $key => $value) {
            $headers[$key] = $value;
        }

        $headers["del"] = "Удалить";
        $headers["edit"] = "Редактировать";

        $this
            ->view
            ->setData([
                "table" => $this->model->setPageSize($this->pageSize)->getPage($page),
                "comments" => $headers,
                "controllerName" => $this->getCurrentClass(),
                "activePage" => $page,
                "pageCount" => $this->model->pageCount()
            ])
            ->setTemplate("Table/show")
            ->view();
    }

    /**
     * Удаляет строку из таблицы
     */
    public function actionDel()
    {
        $this->model->del($_GET["id"]);
        $this->redirect("?type={$this->getCurrentClass()}&action=show");
    }

    /**
     * Показывает страницу для добавления новой строки
     */
    public function actionShowAdd()
    {
        $this
            ->view
            ->setData([
                "comments" => $this->model->columnComments(),
                "controllerName" => $this->getCurrentClass()
            ])
            ->setTemplate("Table/add")
            ->view();
    }

    /**
     * Добавляет новую строку
     */
    public function actionAdd()
    {
        $this->model->ins($_POST);
        $this->redirect("?type={$this->getCurrentClass()}&action=show");
    }

    /**
     * Показывает страницу для редактирования строки
     */
    public function actionShowEdit()
    {
        $row = $this->model->getRow($_GET["id"]);
        unset($row["id"]);
        $this
            ->view
            ->setData([
                "comments" => $this->model->columnComments(),
                "row" => $row,
                "id" => $_GET["id"],
                "controllerName" => $this->getCurrentClass()
            ])
            ->setTemplate("Table/edit")
            ->view();
    }

    /**
     * Редактирует строку из таблицы
     */
    public function actionEdit()
    {
        $this->model->upd($_GET["id"], $_POST);
        $this->redirect("?type={$this->getCurrentClass()}&action=show");
    }

}