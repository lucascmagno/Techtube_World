<?php
    include_once '../../Controller/ControllerUser.php';
    $userController = new UserController();

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $email = $_POST['email'];
        $senha = $_POST['senha'];
        $resultado = $userController->login($email, $senha);
        
        if($resultado){
            header("Location: /src/View/pages/inicio.php?sucesso=true");
            exit();
        } else {
            header("Location: /index.php?sucesso=false");
            exit();
        }
    }
?>