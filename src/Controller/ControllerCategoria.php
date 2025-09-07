<?php
    require_once __DIR__ . "/src/Models/Categoria.php";

    class AlunoController {
        private $model;

        public function __construct() {
            $this->model = new Aluno();
        }

        public function getAllCategories() {
            return $this->model->getAllCategories();
        }

        public function getCategoryById($id) {
            return $this->model->getCategoryById($id);
        }

        public function createCategory($nome, $descricao) {
            return $this->model->createCategory($nome, $descricao);
        }

        public function updateCategory($id, $nome, $descricao) {
            return $this->model->updateCategory($id, $nome, $descricao);
        }

        public function deleteCategory($id) {
            return $this->model->deleteCategory($id);
        }

        public function toggleExcludeCategory($id, $excluir) {
            return $this->model->toggleExcludeCategory($id, $excluir);
        }
    }
?>