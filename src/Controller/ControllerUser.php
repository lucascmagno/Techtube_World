<?php
    require_once __DIR__ . "/../Models/Usuarios.php";

    class UserController{
        private $db;

        public function __construct() {
            $this->db = Database::getConnection();
        }

        public function login($email, $senha){
            $usuariosModel = new Usuarios();
            $resultData = $usuariosModel->login($email, $senha);
            return $resultData;
        }

        public function adicionarCadastro($nome, $matricula, $email, $telefone, $sexo, $senha, $tipoUsuario, $cep, $rua, $numero, $bairro, $cidade, $uf) {
            $usuariosModel = new Usuarios();
            return $usuariosModel->adicionarCadastro($nome, $email, $matricula, $senha, $telefone, $sexo, $tipoUsuario, $cep, $rua, $numero, $bairro, $cidade, $uf);
        }

        public function getUserByEmail($email) {
            $usuariosModel = new Usuarios();
            return $usuariosModel->getUserByEmail($email);
        }


    }
?>