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

    public function actionShow(): void
    {
        $this->view->setTemplate("Aut/login")->view();
    }

    public function actionShowReg(): void
    {
        $this->view->setTemplate("Aut/registration")->view();
    }

    public function actionReg(): void
    {
        $ok = true;

        if ($_POST['name'] == '') {
            $_SESSION['warnings'][] = 'Имя не может быть пустым!';
            $ok = false;
        }

        if ($_POST['pass1'] != $_POST['pass2']) {
            $_SESSION['warnings'][] = 'Пароли не совпадают!';
            $ok = false;
        } else if ($_POST['pass1'] == '') {
            $_SESSION['warnings'][] = 'Пароль не может быть пустым!';
            $ok = false;
        }

        if ($this->model->checkUserExists($_POST['login'])) {
            $_SESSION['warnings'][] = "Имя пользователя <b>{$_POST['login']}</b> занято!";
            $ok = false;
        } elseif ($_POST['login'] == '') {
            $_SESSION['warnings'][] = "Логин не может быть пустым!";
            $ok = false;
        }

        if ($ok) {
            if (!$this->model->checkUserExists($_POST['login'])) {
                $this->model->addNewUser($_POST['login'], $_POST['pass1'], $_POST['name'], 'guest');
            }
            $this->redirect("?");
        } else {
            $_SESSION['regData'] = $_POST;
            $this->redirect("?type=Aut&action=showreg");
        }

    }

    /**
     * @throws \Exception
     */
    public function actionLogin(): void
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