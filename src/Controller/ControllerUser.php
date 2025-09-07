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
    }