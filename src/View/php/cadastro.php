<?php
    include_once '../../Controller/ControllerUser.php';
    $userController = new UserController();

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $senha = $_POST['senha'];
        $confirmaSenha = $_POST['confirmaSenha'];
        $tipoUsuario = $_POST['tipo_usuario'];
        $cep = $_POST['CEP'] ?? null;
        $rua = $_POST['rua'] ?? null;
        $numero = $_POST['numero'] ?? null;
        $bairro = $_POST['bairro'] ?? null;
        $cidade = $_POST['cidade'] ?? null;
        $uf = $_POST['uf'] ?? null;

        if($senha !== $confirmaSenha){
            $error = "As senhas não coincidem.";
        } else {
            // Aqui você pode adicionar a lógica para salvar o usuário no banco de dados
            // Por exemplo, você pode chamar um método do controlador para criar o usuário
            // Exemplo: $userController->createUser($nome, $email, $senha, $tipoUsuario, $cep, $rua, $numero, $bairro, $cidade, $uf);
            
            // Após o cadastro, redirecionar para a página de login ou outra página apropriada
            header("Location: /index.php");
            exit();
        }
    }
?>