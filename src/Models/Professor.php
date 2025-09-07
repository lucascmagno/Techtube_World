<?php
    require_once __DIR__ . "/../Config/conn.php";
    class Aluno extends Database{
        private $db;
        private $table = "tb_aluno";

        public function __construct() {
            $this->db = Database::getConnection();
        }
    }
?>