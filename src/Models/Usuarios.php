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

        public function adicionarCadastro($nome, $matricula, $email, $telefone, $sexo, $senha, $tipoUsuario, $cep, $rua, $numero, $bairro, $cidade, $uf) {
        try {
            $this->db->beginTransaction();

            // 1. Criar registro em timestamps
            $stmtTs = $this->db->prepare("INSERT INTO timestamps (create_time) VALUES (NOW())");
            $stmtTs->execute();
            $timestampsId = $this->db->lastInsertId();

            // 2. Criar cadastro do usuário
            $stmtUser = $this->db->prepare("
                INSERT INTO tb_cadastro (nome, matricula, email, telefone, sexo, senha, tipo_usuario, timestamps_id_timestamps) 
                VALUES (:nome, :matricula, :email, :telefone, :sexo, :senha, :tipo_usuario, :timestamps_id)");
            
            $stmtUser->execute([
                ':nome' => $nome,
                ':matricula' => $matricula,
                ':email' => $email,
                ':telefone' => $telefone,
                ':sexo' => $sexo,
                ':senha' => $senha,
                ':tipo_usuario' => $tipoUsuario,
                ':timestamps_id' => $timestampsId
            ]);

            $userId = $this->db->lastInsertId();

            // 3. Endereço (opcional)
            if ($rua || $cidade || $cep) {
                $stmtEnd = $this->db->prepare("
                    INSERT INTO endereco (rua, numero, bairro, cidade, uf, tb_cadastro_idtb_cadastro, timestamps_id_timestamps) 
                    VALUES (:rua, :numero, :bairro, :cidade, :uf, :user_id, :timestamps_id)");
                $stmtEnd->execute([
                    ':rua' => $rua,
                    ':numero' => $numero,
                    ':bairro' => $bairro,
                    ':cidade' => $cidade,
                    ':uf' => $uf,
                    ':user_id' => $userId,
                    ':timestamps_id' => $timestampsId
                ]);
            }

            // 4. Criar relação em aluno/professor conforme tipo
            if (strtolower($tipoUsuario) === "aluno") {
                $stmtPont = $this->db->prepare("INSERT INTO his_pontuacao (pontuacao, timestamps_id_timestamps) VALUES (0, :timestamps_id)");
                $stmtPont->execute([':timestamps_id' => $timestampsId]);
                $pontId = $this->db->lastInsertId();

                $stmtAluno = $this->db->prepare("
                    INSERT INTO aluno (tb_cadastro_idtb_cadastro, his_pontuacao_idhis_pontuacao, timestamps_id_timestamps) 
                    VALUES (:user_id, :pont_id, :timestamps_id)");
                $stmtAluno->execute([
                    ':user_id' => $userId,
                    ':pont_id' => $pontId,
                    ':timestamps_id' => $timestampsId
                ]);
            } elseif (strtolower($tipoUsuario) === "professor") {
                $stmtProf = $this->db->prepare("
                    INSERT INTO professor (siape, tb_cadastro_idtb_cadastro, timestamps_id_timestamps) 
                    VALUES (:siape, :user_id, :timestamps_id)");
                $stmtProf->execute([
                    ':siape' => rand(10000, 99999), // pode mudar depois
                    ':user_id' => $userId,
                    ':timestamps_id' => $timestampsId
                ]);
            }

            $this->db->commit();
            return true;

        } catch (Exception $e) {
            $this->db->rollBack();
            error_log("Erro ao criar usuário: " . $e->getMessage());
            return false;
        }
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