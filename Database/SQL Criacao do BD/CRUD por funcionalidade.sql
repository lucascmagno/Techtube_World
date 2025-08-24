#CRUD POR FUNCIONALIDADE
#1. Timestamps
-- CREATE
INSERT INTO timestamps (create_time) VALUES (NOW());

-- READ
SELECT * FROM timestamps;

-- UPDATE
UPDATE timestamps SET update_time = NOW() WHERE id_timestamps = 1;

-- DELETE (lógico)
UPDATE timestamps SET excluido = 1 WHERE id_timestamps = 1;

#2. Cadastro de Usuários
-- CREATE
INSERT INTO tb_cadastro (nome, matricula, email, telefone, sexo, senha, tipo_usuario, timestamps_id_timestamps) 
VALUES ('João Silva', '2025001', 'joao@email.com', '99999999', 'M', 'senha_hash', 'aluno', 1);

-- READ
SELECT * FROM tb_cadastro WHERE excluido = 0;

-- UPDATE
UPDATE tb_cadastro SET email = 'novoemail@email.com' WHERE idtb_cadastro = 1;

-- DELETE (lógico)
UPDATE tb_cadastro SET excluido = 1 WHERE idtb_cadastro = 1;

#3. Endereço
-- CREATE
INSERT INTO endereco (rua, numero, bairro, cidade, uf, tb_cadastro_idtb_cadastro, timestamps_id_timestamps) 
VALUES ('Rua A', '123', 'Centro', 'São Paulo', 'SP', 1, 1);

-- READ
SELECT * FROM endereco WHERE excluido = 0;

-- UPDATE
UPDATE endereco SET cidade = 'Rio de Janeiro' WHERE idendereco = 1;

-- DELETE (lógico)
UPDATE endereco SET excluido = 1 WHERE idendereco = 1;

#4. Categoria
-- CREATE
INSERT INTO categoria (nome_categoria, timestamps_id_timestamps) VALUES ('Programação', 1);

-- READ
SELECT * FROM categoria WHERE excluido = 0;

-- UPDATE
UPDATE categoria SET nome_categoria = 'Banco de Dados' WHERE idcategoria = 1;

-- DELETE (lógico)
UPDATE categoria SET excluido = 1 WHERE idcategoria = 1;

#5. Curso
-- CREATE
INSERT INTO curso (nome_curso, carga_horaria, descricao_curso, url_perfil_curso, categoria_idcategoria, timestamps_id_timestamps) 
VALUES ('Curso de SQL', 40, 'Aprenda SQL do zero', 'http://imagem.com/sql.png', 1, 1);

-- READ
SELECT * FROM curso WHERE excluido = 0;

-- UPDATE
UPDATE curso SET descricao_curso = 'Curso avançado de SQL' WHERE idcurso = 1;

-- DELETE (lógico)
UPDATE curso SET excluido = 1 WHERE idcurso = 1;

#6. Histórico de Pontuação
-- CREATE
INSERT INTO his_pontuacao (pontuacao, timestamps_id_timestamps) VALUES (100, 1);

-- READ
SELECT * FROM his_pontuacao WHERE excluido = 0;

-- UPDATE
UPDATE his_pontuacao SET pontuacao = 150 WHERE idhis_pontuacao = 1;

-- DELETE (lógico)
UPDATE his_pontuacao SET excluido = 1 WHERE idhis_pontuacao = 1;

#7. Aluno
-- CREATE
INSERT INTO aluno (tb_cadastro_idtb_cadastro, his_pontuacao_idhis_pontuacao, timestamps_id_timestamps) 
VALUES (1, 1, 1);

-- READ
SELECT * FROM aluno WHERE excluido = 0;

-- UPDATE
UPDATE aluno SET his_pontuacao_idhis_pontuacao = 2 WHERE idaluno = 1;

-- DELETE (lógico)
UPDATE aluno SET excluido = 1 WHERE idaluno = 1;

#8. Professor
-- CREATE
INSERT INTO professor (siape, tb_cadastro_idtb_cadastro, timestamps_id_timestamps) 
VALUES ('12345', 2, 1);

-- READ
SELECT * FROM professor WHERE excluido = 0;

-- UPDATE
UPDATE professor SET siape = '54321' WHERE idprofessor = 1;

-- DELETE (lógico)
UPDATE professor SET excluido = 1 WHERE idprofessor = 1;

#9. Turma
-- CREATE
INSERT INTO turma (curso_idcurso, professor_idprofessor, timestamps_id_timestamps) 
VALUES (1, 1, 1);

-- READ
SELECT * FROM turma WHERE excluido = 0;

-- UPDATE
UPDATE turma SET curso_idcurso = 2 WHERE idturma = 1;

-- DELETE (lógico)
UPDATE turma SET excluido = 1 WHERE idturma = 1;

#10. Atividade
-- CREATE
INSERT INTO atividade (nome_atividade, conteudo_atividade, curso_idcurso, timestamps_id_timestamps) 
VALUES ('Exercício 1', 'Resolva consultas SQL', 1, 1);

-- READ
SELECT * FROM atividade WHERE excluido = 0;

-- UPDATE
UPDATE atividade SET nome_atividade = 'Exercício Avançado' WHERE idatividade = 1;

-- DELETE (lógico)
UPDATE atividade SET excluido = 1 WHERE idatividade = 1;

#11. Imagens de Curso
-- CREATE
INSERT INTO url_imagem_curso (nome_imagem, url_imagem, tipo_imagem, curso_idcurso, timestamps_id_timestamps) 
VALUES ('Thumb Curso SQL', 'http://img.com/sql.png', 'P', 1, 1);

-- READ
SELECT * FROM url_imagem_curso WHERE excluido = 0;

-- UPDATE
UPDATE url_imagem_curso SET url_imagem = 'http://img.com/sql_new.png' WHERE idurl_imagem = 1;

-- DELETE (lógico)
UPDATE url_imagem_curso SET excluido = 1 WHERE idurl_imagem = 1;

#12. Imagens de Atividade
-- CREATE
INSERT INTO url_imagem_atividade (atividade_idatividade, nome_imagem, url_imagem, timestamps_id_timestamps) 
VALUES (1, 'Exemplo Exercício', 'http://img.com/ex1.png', 1);

-- READ
SELECT * FROM url_imagem_atividade WHERE excluido = 0;

-- UPDATE
UPDATE url_imagem_atividade SET url_imagem = 'http://img.com/ex1_new.png' WHERE idurl_imagem = 1;

-- DELETE (lógico)
UPDATE url_imagem_atividade SET excluido = 1 WHERE idurl_imagem = 1;

#13. Imagens de Perfil
-- CREATE
INSERT INTO url_imagem_perfil (nome_imagem, url_imagem, tipo_imagem, tb_cadastro_idtb_cadastro, timestamps_id_timestamps) 
VALUES ('Foto Perfil', 'http://img.com/perfil.png', 'P', 1, 1);

-- READ
SELECT * FROM url_imagem_perfil WHERE excluido = 0;

-- UPDATE
UPDATE url_imagem_perfil SET url_imagem = 'http://img.com/perfil_new.png' WHERE idurl_imagem = 1;

-- DELETE (lógico)
UPDATE url_imagem_perfil SET excluido = 1 WHERE idurl_imagem = 1;

#14. Vídeos de Curso
-- CREATE
INSERT INTO url_video_curso (nome_video, url_video, curso_idcurso, timestamps_id_timestamps) 
VALUES ('Aula 1', 'http://video.com/aula1.mp4', 1, 1);

-- READ
SELECT * FROM url_video_curso WHERE excluido = 0;

-- UPDATE
UPDATE url_video_curso SET url_video = 'http://video.com/aula1_new.mp4' WHERE idurl_video = 1;

-- DELETE (lógico)
UPDATE url_video_curso SET excluido = 1 WHERE idurl_video = 1;

#15. Turma x Aluno (relação N:N)
-- CREATE
INSERT INTO turma_aluno (turma_idturma, aluno_idaluno, timestamps_id_timestamps) 
VALUES (1, 1, 1);

-- READ
SELECT * FROM turma_aluno WHERE excluido = 0;

-- UPDATE
UPDATE turma_aluno SET turma_idturma = 2 WHERE aluno_idaluno = 1 AND turma_idturma = 1;

-- DELETE (lógico)
UPDATE turma_aluno SET excluido = 1 WHERE aluno_idaluno = 1 AND turma_idturma = 1;

#Views Usadas
#1. Listar alunos com seus cursos
CREATE VIEW vw_aluno_curso AS
SELECT a.idaluno, c.nome, c.email, cu.nome_curso, cu.carga_horaria
FROM aluno a
JOIN tb_cadastro c ON a.tb_cadastro_idtb_cadastro = c.idtb_cadastro
JOIN turma_aluno ta ON ta.aluno_idaluno = a.idaluno
JOIN turma t ON t.idturma = ta.turma_idturma
JOIN curso cu ON cu.idcurso = t.curso_idcurso
WHERE a.excluido = 0 AND c.excluido = 0 AND cu.excluido = 0;

#2. Listar professores e suas turmas
CREATE VIEW vw_professor_turma AS
SELECT p.idprofessor, c.nome, cu.nome_curso
FROM professor p
JOIN tb_cadastro c ON p.tb_cadastro_idtb_cadastro = c.idtb_cadastro
JOIN turma t ON t.professor_idprofessor = p.idprofessor
JOIN curso cu ON cu.idcurso = t.curso_idcurso
WHERE p.excluido = 0 AND c.excluido = 0 AND cu.excluido = 0;