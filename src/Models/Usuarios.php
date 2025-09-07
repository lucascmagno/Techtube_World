<?php
    require_once __DIR__ . "/../Config/conn.php";

    class Usuarios extends Database{
        private $db;
        private $table = "tb_cadastro";

        public function __construct() {
            $this->db = Database::getConnection();
        }

         function login($email, $senha){
            try {
                $query = "SELECT * FROM $this->table WHERE email = :email AND senha = :senha";
                
                $stmt = $this->db->prepare($query);
    
                // Bind dos parâmetros
                $stmt->bindParam(':email', $email);
                $stmt->bindParam(':senha', $senha);
    
                // Execução da consulta
                $stmt->execute();
    
                // Retorna o resultado da consulta
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
                return true; // Retorna o nome do usuário ou null se não encontrado
            } catch (PDOException $e) {
                // Trate exceções aqui (log, exibição de mensagem, etc.)
                echo "Erro: " . $e->getMessage();
                return false;
            }
        }

        // Criar novo usuário
        public function create($nome, $email, $matricula, $senha) {
            $hashedPassword = password_hash($senha, PASSWORD_BCRYPT);
            $stmt = $this->db->prepare("INSERT INTO $this->table (nome, email, matricula, senha) 
                                        VALUES (:nome, :email, :matricula, :senha)");
            $stmt->bindValue(":nome", $nome);
            $stmt->bindValue(":email", $email);
            $stmt->bindValue(":matricula", $matricula);
            $stmt->bindValue(":senha", $hashedPassword);
            return $stmt->execute();
        }

        // Buscar usuário por ID
        public function getById($id) {
            $stmt = $this->db->prepare("SELECT * FROM $this->table WHERE id = :id");
            $stmt->bindValue(":id", $id, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }

        // Atualizar usuário
        public function update($id, $nome, $email, $matricula, $senha = null) {
            if ($senha) {
                $hashedPassword = password_hash($senha, PASSWORD_BCRYPT);
                $stmt = $this->db->prepare("UPDATE $this->table 
                                            SET nome = :nome, email = :email, matricula = :matricula, senha = :senha, atualizado_em = NOW()
                                            WHERE id = :id");
                $stmt->bindValue(":senha", $hashedPassword);
            } else {
                $stmt = $this->db->prepare("UPDATE $this->table 
                                            SET nome = :nome, email = :email, matricula = :matricula, atualizado_em = NOW()
                                            WHERE id = :id");
            }
            $stmt->bindValue(":id", $id);
            $stmt->bindValue(":nome", $nome);
            $stmt->bindValue(":email", $email);
            $stmt->bindValue(":matricula", $matricula);
            return $stmt->execute();
        }

        // Deletar usuário
        public function delete($id) {
            $stmt = $this->db->prepare("DELETE FROM $this->table WHERE id = :id");
            $stmt->bindValue(":id", $id, PDO::PARAM_INT);
            return $stmt->execute();
        }
    }