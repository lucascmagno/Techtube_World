<?php
    require_once __DIR__ . "/../Config/conn.php";

    class Aluno extends Database{
        private $db;
        private $table_aluno = "tb_aluno";
        private $table_endereco = "tb_endereco";
        private $table_cadastro = "tb_cadastro";

        public function __construct() {
            $this->db = Database::getConnection();
        }
    }
?>