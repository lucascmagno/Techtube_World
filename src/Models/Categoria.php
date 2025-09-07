<?php
    require_once __DIR__ . "/../Config/conn.php";
    class Categoria extends Database{
        private $db;
        private $table_categoria = "categoria";

        public function __construct() {
            $this->db = Database::getConnection();
        }

    public function getAllCategories() {
        $stmt = $this->db->query("SELECT * FROM $this->table_categoria
                                    ORDER BY nome_categoria ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllCategoriesNotExcluded() {
        $stmt = $this->db->query("SELECT * FROM $this->table_categoria
                                    WHERE excluido = 0
                                    ORDER BY nome_categoria ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllCategoriesExcluded() {
        $stmt = $this->db->query("SELECT * FROM $this->table_categoria
                                    WHERE excluido = 1
                                    ORDER BY nome_categoria ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCategoryById($id) {
        $stmt = $this->db->prepare("SELECT * FROM $this->table_categoria WHERE id_categoria = :id");
        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function createCategory($nome_categoria) {
        $stmt = $this->db->prepare("INSERT INTO $this->table_categoria (nome_categoria) 
                                    VALUES (:nome_categoria)");
        $stmt->bindValue(":nome_categoria", $nome_categoria);
        return $stmt->execute();
    }

    public function updateCategory($id, $nome_categoria) {
        $stmt = $this->db->prepare("UPDATE $this->table_categoria 
                                    SET nome_categoria = :nome_categoria 
                                    WHERE id_categoria = :id");
        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        $stmt->bindValue(":nome_categoria", $nome_categoria);
        return $stmt->execute();
    }

    public function deleteCategory($id) {
        $stmt = $this->db->prepare("DELETE FROM $this->table_categoria WHERE id_categoria = :id");
        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function toggleExcludeCategory($id, $excluir) {
        $stmt = $this->db->prepare("UPDATE $this->table_categoria 
                                    SET excluido = :excluir 
                                    WHERE id_categoria = :id");
        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        $stmt->bindValue(":excluir", $excluir, PDO::PARAM_INT);
        return $stmt->execute();
    }

}
    

?>