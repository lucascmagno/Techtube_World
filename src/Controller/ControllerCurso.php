<?php
require_once __DIR__ . "/../Models/Curso.php";

class CursoController {
    private $model;

    public function __construct() {
        $this->model = new Curso();
    }

    // Listar cursos
    public function index() {
        $cursos = $this->model->getAll();
        include __DIR__ . "/../views/cursos/index.php";
    }

    // Visualizar curso
    public function show($id) {
        $curso = $this->model->getById($id);
        include __DIR__ . "/../views/cursos/show.php";
    }

    // Criar curso
    public function store($data) {
        $this->model->create(
            $data["nome"],
            $data["descricao"],
            $data["categoria"],
            $data["video"],
            $data["imagem"]
        );
        header("Location: /cursos");
    }

    // Atualizar curso
    public function update($id, $data) {
        $this->model->update(
            $id,
            $data["nome"],
            $data["descricao"],
            $data["categoria"],
            $data["video"],
            $data["imagem"]
        );
        header("Location: /cursos");
    }

    // Deletar curso
    public function destroy($id) {
        $this->model->delete($id);
        header("Location: /cursos");
    }
}
