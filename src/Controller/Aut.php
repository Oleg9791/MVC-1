<?php


namespace App\Controller;


use App\Model\AutModel;

class Aut extends AbstractController
{
    /**
     * @var AutModel
     */
    protected AutModel $model;

    public function __construct()
    {
        parent::__construct();
        $config = include __DIR__ . "/../../config.php";
        $config["table"] = "users";
        $this->model = new AutModel($config);
    }

    public function actionShow()
    {
        $this->view->setTemplate("Aut/login")->view();
    }

    /**
     * @throws \Exception
     */
    public function actionLogin()
    {
        //print_r($_POST);
        //$_SESSION['user']
        $user = $this->model->checkUser($_POST['login'], $_POST['pass']);
        if (empty($user)) {
            $this->redirect("?type=Aut&action=show");
        } else {
            $_SESSION['user'] = $user[0];
            $this->redirect("?");
        }

    }

    public function actionLogout(): void
    {
        unset($_SESSION['user']);
        $this->redirect("?type=Aut&action=show");
    }
}