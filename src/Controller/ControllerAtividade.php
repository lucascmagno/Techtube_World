<?php
    require_once __DIR__ . "/../Models/Atividade.php";

    class AlunoController {
        private $model;

        public function __construct() {
            $this->model = new Aluno();
        }
    }
?>