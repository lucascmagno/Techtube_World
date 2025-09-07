<?php
    require_once __DIR__ . "/../Models/Endereco.php";

    class AlunoController {
        private $model;

        public function __construct() {
            $this->model = new Aluno();
        }
    }
?>