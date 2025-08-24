#Script de incicialização do banco de dados para testes

USE techtube;

-- ===========================================
-- 1. Timestamps (base para todos os registros)
-- ===========================================
INSERT INTO timestamps (create_time) VALUES (NOW()); -- id = 1
INSERT INTO timestamps (create_time) VALUES (NOW()); -- id = 2
INSERT INTO timestamps (create_time) VALUES (NOW()); -- id = 3

-- ===========================================
-- 2. Cadastro de Usuários
-- ===========================================
INSERT INTO tb_cadastro (nome, matricula, email, telefone, sexo, senha, tipo_usuario, timestamps_id_timestamps)
VALUES 
('João Silva', '2025001', 'joao@email.com', '11999999999', 'M', 'hash_senha1', 'aluno', 1),
('Maria Souza', '2025002', 'maria@email.com', '11988888888', 'F', 'hash_senha2', 'professor', 2),
('Admin User', 'admin01', 'admin@email.com', '11977777777', 'M', 'hash_admin', 'admin', 3);

-- ===========================================
-- 3. Endereços
-- ===========================================
INSERT INTO endereco (rua, numero, bairro, cidade, uf, tb_cadastro_idtb_cadastro, timestamps_id_timestamps)
VALUES 
('Rua A', '100', 'Centro', 'São Paulo', 'SP', 1, 1),
('Rua B', '200', 'Jardim', 'Campinas', 'SP', 2, 2);

-- ===========================================
-- 4. Categorias
-- ===========================================
INSERT INTO categoria (nome_categoria, timestamps_id_timestamps) VALUES
('Programação', 1),
('Banco de Dados', 2);

-- ===========================================
-- 5. Cursos
-- ===========================================
INSERT INTO curso (nome_curso, carga_horaria, descricao_curso, url_perfil_curso, categoria_idcategoria, timestamps_id_timestamps)
VALUES 
('Curso de SQL', 40, 'Aprenda SQL do zero', 'http://img.com/sql.png', 2, 1),
('Curso de Java', 60, 'Java para iniciantes', 'http://img.com/java.png', 1, 2);

-- ===========================================
-- 6. Histórico de Pontuação
-- ===========================================
INSERT INTO his_pontuacao (pontuacao, timestamps_id_timestamps) VALUES
(100, 1),
(150, 2);

-- ===========================================
-- 7. Alunos
-- ===========================================
INSERT INTO aluno (tb_cadastro_idtb_cadastro, his_pontuacao_idhis_pontuacao, timestamps_id_timestamps)
VALUES 
(1, 1, 1);

-- ===========================================
-- 8. Professores
-- ===========================================
INSERT INTO professor (siape, tb_cadastro_idtb_cadastro, timestamps_id_timestamps)
VALUES 
('12345', 2, 2);

-- ===========================================
-- 9. Turmas
-- ===========================================
INSERT INTO turma (curso_idcurso, professor_idprofessor, timestamps_id_timestamps)
VALUES 
(1, 1, 1);

-- ===========================================
-- 10. Atividades
-- ===========================================
INSERT INTO atividade (nome_atividade, conteudo_atividade, curso_idcurso, timestamps_id_timestamps)
VALUES 
('Exercício SQL Básico', 'Crie SELECTs simples.', 1, 1),
('Exercício SQL Avançado', 'Crie JOINs entre tabelas.', 1, 2);

-- ===========================================
-- 11. Imagens de Curso
-- ===========================================
INSERT INTO url_imagem_curso (nome_imagem, url_imagem, tipo_imagem, curso_idcurso, timestamps_id_timestamps)
VALUES 
('Thumb SQL', 'http://img.com/thumb_sql.png', 'P', 1, 1);

-- ===========================================
-- 12. Imagens de Atividade
-- ===========================================
INSERT INTO url_imagem_atividade (atividade_idatividade, nome_imagem, url_imagem, timestamps_id_timestamps)
VALUES 
(1, 'Exemplo SQL', 'http://img.com/exemplo_sql.png', 1);

-- ===========================================
-- 13. Imagens de Perfil
-- ===========================================
INSERT INTO url_imagem_perfil (nome_imagem, url_imagem, tipo_imagem, tb_cadastro_idtb_cadastro, timestamps_id_timestamps)
VALUES 
('Foto João', 'http://img.com/joao.png', 'P', 1, 1),
('Foto Maria', 'http://img.com/maria.png', 'P', 2, 2);

-- ===========================================
-- 14. Vídeos de Curso
-- ===========================================
INSERT INTO url_video_curso (nome_video, url_video, curso_idcurso, timestamps_id_timestamps)
VALUES 
('Aula 1 SQL', 'http://video.com/sql_aula1.mp4', 1, 1),
('Aula 1 Java', 'http://video.com/java_aula1.mp4', 2, 2);

-- ===========================================
-- 15. Turma x Aluno
-- ===========================================
INSERT INTO turma_aluno (turma_idturma, aluno_idaluno, timestamps_id_timestamps)
VALUES 
(1, 1, 1);

-- =================================================
--                 CRIAÇÃO DE VIEWS
-- =================================================

-- View: Alunos com seus cursos
CREATE OR REPLACE VIEW vw_aluno_curso AS
SELECT a.idaluno, c.nome AS aluno, cu.nome_curso, cu.carga_horaria
FROM aluno a
JOIN tb_cadastro c ON a.tb_cadastro_idtb_cadastro = c.idtb_cadastro
JOIN turma_aluno ta ON ta.aluno_idaluno = a.idaluno
JOIN turma t ON t.idturma = ta.turma_idturma
JOIN curso cu ON cu.idcurso = t.curso_idcurso
WHERE a.excluido = 0 AND c.excluido = 0 AND cu.excluido = 0;

-- View: Professores com suas turmas
CREATE OR REPLACE VIEW vw_professor_turma AS
SELECT p.idprofessor, c.nome AS professor, cu.nome_curso
FROM professor p
JOIN tb_cadastro c ON p.tb_cadastro_idtb_cadastro = c.idtb_cadastro
JOIN turma t ON t.professor_idprofessor = p.idprofessor
JOIN curso cu ON cu.idcurso = t.curso_idcurso
WHERE p.excluido = 0 AND c.excluido = 0 AND cu.excluido = 0;

-- View: Cursos com suas categorias
CREATE OR REPLACE VIEW vw_curso_categoria AS
SELECT cu.idcurso, cu.nome_curso, cat.nome_categoria
FROM curso cu
JOIN categoria cat ON cu.categoria_idcategoria = cat.idcategoria
WHERE cu.excluido = 0 AND cat.excluido = 0;

-- View: Usuários com imagens de perfil
CREATE OR REPLACE VIEW vw_usuario_perfil AS
SELECT u.idtb_cadastro, u.nome, u.tipo_usuario, i.url_imagem
FROM tb_cadastro u
LEFT JOIN url_imagem_perfil i ON i.tb_cadastro_idtb_cadastro = u.idtb_cadastro
WHERE u.excluido = 0 AND (i.excluido = 0 OR i.excluido IS NULL);
