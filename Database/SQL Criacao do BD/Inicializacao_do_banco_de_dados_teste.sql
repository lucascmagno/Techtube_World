USE techtube;

-- ===========================================
-- 1. Usuários (tb_cadastro)
-- ===========================================
INSERT INTO tb_cadastro (nome, matricula, email, telefone, sexo, senha, tipo_usuario)
VALUES
('João Silva','2025001','joao@email.com','11999999999','M','hash_senha1','aluno'),
('Maria Souza','2025002','maria@email.com','11988888888','F','hash_senha2','professor'),
('Carlos Admin','admin01','admin@email.com','11977777777','M','hash_admin','admin');

-- ===========================================
-- 2. Endereços (endereco)
-- ===========================================
INSERT INTO endereco (rua, numero, bairro, cidade, uf, tb_cadastro_idtb_cadastro)
VALUES
('Rua A','123','Centro','São Paulo','SP',1),
('Rua B','456','Jardim','Campinas','SP',2);

-- ===========================================
-- 3. Categorias
-- ===========================================
INSERT INTO categoria (nome_categoria)
VALUES
('Programação'),
('Banco de Dados'),
('DevOps');

-- ===========================================
-- 4. Cursos
-- ===========================================
INSERT INTO curso (nome_curso, carga_horaria, descricao_curso, url_perfil_curso, categoria_idcategoria)
VALUES
('Curso SQL Básico',40,'Introdução ao SQL','http://img.com/sql.png',2),
('Curso Java Iniciante',60,'Java para iniciantes','http://img.com/java.png',1),
('Curso Docker e Kubernetes',30,'Introdução a containers','http://img.com/docker.png',3);

-- ===========================================
-- 5. Histórico de Pontuação
-- ===========================================
INSERT INTO his_pontuacao (pontuacao)
VALUES (100),(150),(200);

-- ===========================================
-- 6. Alunos
-- ===========================================
INSERT INTO aluno (tb_cadastro_idtb_cadastro, his_pontuacao_idhis_pontuacao)
VALUES
(1,1);

-- ===========================================
-- 7. Professores
-- ===========================================
INSERT INTO professor (siape, tb_cadastro_idtb_cadastro)
VALUES
('12345',2);

-- ===========================================
-- 8. Turmas
-- ===========================================
INSERT INTO turma (curso_idcurso, professor_idprofessor)
VALUES
(1,1), -- turma SQL com Maria
(2,1); -- turma Java com Maria

-- ===========================================
-- 9. Atividades
-- ===========================================
INSERT INTO atividade (nome_atividade, conteudo_atividade, curso_idcurso)
VALUES
('Exercício SELECT Básico','Crie consultas simples usando SELECT',1),
('Exercício JOIN','Monte consultas usando JOINs',1),
('Exercício Hello World Java','Faça seu primeiro programa em Java',2);

-- ===========================================
-- 10. Imagens de Curso
-- ===========================================
INSERT INTO url_imagem_curso (nome_imagem, url_imagem, tipo_imagem, curso_idcurso)
VALUES
('Thumb SQL','http://img.com/thumb_sql.png','P',1),
('Thumb Java','http://img.com/thumb_java.png','P',2);

-- ===========================================
-- 11. Imagens de Atividade
-- ===========================================
INSERT INTO url_imagem_atividade (atividade_idatividade, nome_imagem, url_imagem)
VALUES
(1,'Exemplo Exercício SQL','http://img.com/ex1.png'),
(3,'Exemplo Exercício Java','http://img.com/ex_java.png');

-- ===========================================
-- 12. Imagens de Perfil
-- ===========================================
INSERT INTO url_imagem_perfil (nome_imagem, url_imagem, tipo_imagem, tb_cadastro_idtb_cadastro)
VALUES
('Foto João','http://img.com/joao.png','P',1),
('Foto Maria','http://img.com/maria.png','P',2);

-- ===========================================
-- 13. Vídeos de Curso
-- ===========================================
INSERT INTO url_video_curso (nome_video, url_video, curso_idcurso)
VALUES
('Aula 1 SQL','http://video.com/sql1.mp4',1),
('Aula 1 Java','http://video.com/java1.mp4',2);

-- ===========================================
-- 14. Turma x Aluno (N:N)
-- ===========================================
INSERT INTO turma_aluno (turma_idturma, aluno_idaluno)
VALUES
(1,1), -- João na turma de SQL
(2,1); -- João também na turma de Java
