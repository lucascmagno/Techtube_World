<?php
require_once __DIR__ . "/../Config/conn.php";

class Curso {
    private $db;
    private $table = "cursos";

    public function __construct() {
        $this->db = Database::getConnection();
    }

    // Buscar todos os cursos
    public function getAll() {
        $stmt = $this->db->query("SELECT * FROM $this->table ORDER BY criado_em DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Buscar curso por ID
    public function getById($id) {
        $stmt = $this->db->prepare("SELECT * FROM $this->table WHERE id = :id");
        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Criar novo curso
    public function create($nome, $descricao, $categoria, $video, $imagem) {
        $stmt = $this->db->prepare("INSERT INTO $this->table (nome, descricao, categoria, video, imagem) 
                                    VALUES (:nome, :descricao, :categoria, :video, :imagem)");
        $stmt->bindValue(":nome", $nome);
        $stmt->bindValue(":descricao", $descricao);
        $stmt->bindValue(":categoria", $categoria);
        $stmt->bindValue(":video", $video);
        $stmt->bindValue(":imagem", $imagem);
        return $stmt->execute();
    }

    // Atualizar curso
    public function update($id, $nome, $descricao, $categoria, $video, $imagem) {
        $stmt = $this->db->prepare("UPDATE $this->table 
                                    SET nome = :nome, descricao = :descricao, categoria = :categoria, video = :video, imagem = :imagem, atualizado_em = NOW()
                                    WHERE id = :id");
        $stmt->bindValue(":id", $id);
        $stmt->bindValue(":nome", $nome);
        $stmt->bindValue(":descricao", $descricao);
        $stmt->bindValue(":categoria", $categoria);
        $stmt->bindValue(":video", $video);
        $stmt->bindValue(":imagem", $imagem);
        return $stmt->execute();
    }

    // Deletar curso
    public function delete($id) {
        $stmt = $this->db->prepare("DELETE FROM $this->table WHERE id = :id");
        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        return $stmt->execute();
    }
}
