<?php
    require_once __DIR__ . "/../Models/Curso.php";

    class AlunoController {
        private $model;

        public function __construct() {
            $this->model = new Aluno();
        }
    }
?>