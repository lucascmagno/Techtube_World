#1. tb_cadastro
-- CREATE
INSERT INTO tb_cadastro (nome, matricula, email, telefone, sexo, senha, tipo_usuario)
VALUES ('João Silva','2025001','joao@email.com','11999999999','M','hash_senha','aluno');

-- READ
SELECT * FROM tb_cadastro WHERE excluido = 0;

-- UPDATE
UPDATE tb_cadastro SET telefone='1188888888', atualizado=NOW() WHERE idtb_cadastro=1;

-- DELETE (lógico)
UPDATE tb_cadastro SET excluido=1, atualizado=NOW() WHERE idtb_cadastro=1;

#2. endereco
-- CREATE
INSERT INTO endereco (rua, numero, bairro, cidade, uf, tb_cadastro_idtb_cadastro)
VALUES ('Rua A','123','Centro','São Paulo','SP',1);

-- READ
SELECT e.*, u.nome FROM endereco e
JOIN tb_cadastro u ON e.tb_cadastro_idtb_cadastro = u.idtb_cadastro
WHERE e.excluido=0;

-- UPDATE
UPDATE endereco SET cidade='Campinas', atualizado=NOW() WHERE idendereco=1;

-- DELETE
UPDATE endereco SET excluido=1, atualizado=NOW() WHERE idendereco=1;

#3. categoria
-- CREATE
INSERT INTO categoria (nome_categoria) VALUES ('Programação');

-- READ
SELECT * FROM categoria WHERE excluido=0;

-- UPDATE
UPDATE categoria SET nome_categoria='Banco de Dados', atualizado=NOW() WHERE idcategoria=1;

-- DELETE
UPDATE categoria SET excluido=1, atualizado=NOW() WHERE idcategoria=1;

#4. curso
-- CREATE
INSERT INTO curso (nome_curso, carga_horaria, descricao_curso, url_perfil_curso, categoria_idcategoria)
VALUES ('SQL Básico',40,'Curso introdutório de SQL','http://img.com/sql.png',1);

-- READ
SELECT c.*, cat.nome_categoria
FROM curso c
JOIN categoria cat ON c.categoria_idcategoria=cat.idcategoria
WHERE c.excluido=0;

-- UPDATE
UPDATE curso SET descricao_curso='Curso SQL atualizado', atualizado=NOW() WHERE idcurso=1;

-- DELETE
UPDATE curso SET excluido=1, atualizado=NOW() WHERE idcurso=1;

#5. his_pontuacao
-- CREATE
INSERT INTO his_pontuacao (pontuacao) VALUES (100);

-- READ
SELECT * FROM his_pontuacao WHERE excluido=0;

-- UPDATE
UPDATE his_pontuacao SET pontuacao=150, atualizado=NOW() WHERE idhis_pontuacao=1;

-- DELETE
UPDATE his_pontuacao SET excluido=1, atualizado=NOW() WHERE idhis_pontuacao=1;

#6. aluno
-- CREATE
INSERT INTO aluno (tb_cadastro_idtb_cadastro, his_pontuacao_idhis_pontuacao)
VALUES (1,1);

-- READ
SELECT a.idaluno, u.nome, h.pontuacao
FROM aluno a
JOIN tb_cadastro u ON a.tb_cadastro_idtb_cadastro=u.idtb_cadastro
JOIN his_pontuacao h ON a.his_pontuacao_idhis_pontuacao=h.idhis_pontuacao
WHERE a.excluido=0;

-- UPDATE
UPDATE aluno SET atualizado=NOW() WHERE idaluno=1;

-- DELETE
UPDATE aluno SET excluido=1, atualizado=NOW() WHERE idaluno=1;

#7. professor
-- CREATE
INSERT INTO professor (siape, tb_cadastro_idtb_cadastro, criado) VALUES ('12345',2,NOW());

-- READ
SELECT p.idprofessor, u.nome, p.siape
FROM professor p
JOIN tb_cadastro u ON p.tb_cadastro_idtb_cadastro=u.idtb_cadastro
WHERE p.excluido=0;

-- UPDATE
UPDATE professor SET siape='54321', atualizado=NOW() WHERE idprofessor=1;

-- DELETE
UPDATE professor SET excluido=1, atualizado=NOW() WHERE idprofessor=1;

#8. turma
-- CREATE
INSERT INTO turma (curso_idcurso, professor_idprofessor) VALUES (1,1);

-- READ
SELECT t.idturma, cu.nome_curso, p.idprofessor, u.nome AS professor
FROM turma t
JOIN curso cu ON t.curso_idcurso=cu.idcurso
JOIN professor p ON t.professor_idprofessor=p.idprofessor
JOIN tb_cadastro u ON p.tb_cadastro_idtb_cadastro=u.idtb_cadastro
WHERE t.excluido=0;

-- UPDATE
UPDATE turma SET atualizado=NOW() WHERE idturma=1;

-- DELETE
UPDATE turma SET excluido=1, atualizado=NOW() WHERE idturma=1;

#9. atividade
-- CREATE
INSERT INTO atividade (nome_atividade, conteudo_atividade, curso_idcurso)
VALUES ('Exercício SQL','Crie consultas básicas',1);

-- READ
SELECT a.idatividade, a.nome_atividade, cu.nome_curso
FROM atividade a
JOIN curso cu ON a.curso_idcurso=cu.idcurso
WHERE a.excluido=0;

-- UPDATE
UPDATE atividade SET nome_atividade='Exercício SQL Avançado', atualizado=NOW() WHERE idatividade=1;

-- DELETE
UPDATE atividade SET excluido=1, atualizado=NOW() WHERE idatividade=1;

#10. url_imagem_curso
-- CREATE
INSERT INTO url_imagem_curso (nome_imagem, url_imagem, tipo_imagem, curso_idcurso)
VALUES ('Thumb SQL','http://img.com/sql.png','P',1);

-- READ
SELECT i.*, c.nome_curso
FROM url_imagem_curso i
JOIN curso c ON i.curso_idcurso=c.idcurso
WHERE i.excluido=0;

-- UPDATE
UPDATE url_imagem_curso SET url_imagem='http://img.com/sql2.png', atualizado=NOW() WHERE idurl_imagem=1;

-- DELETE
UPDATE url_imagem_curso SET excluido=1, atualizado=NOW() WHERE idurl_imagem=1;

11. url_imagem_atividade
-- CREATE
INSERT INTO url_imagem_atividade (atividade_idatividade, nome_imagem, url_imagem)
VALUES (1,'Exemplo Exercício','http://img.com/ex1.png');

-- READ
SELECT i.*, a.nome_atividade
FROM url_imagem_atividade i
JOIN atividade a ON i.atividade_idatividade=a.idatividade
WHERE i.excluido=0;

-- UPDATE
UPDATE url_imagem_atividade SET url_imagem='http://img.com/ex1_new.png', atualizado=NOW() WHERE idurl_imagem=1;

-- DELETE
UPDATE url_imagem_atividade SET excluido=1, atualizado=NOW() WHERE idurl_imagem=1;

#12. url_imagem_perfil
-- CREATE
INSERT INTO url_imagem_perfil (nome_imagem, url_imagem, tipo_imagem, tb_cadastro_idtb_cadastro)
VALUES ('Foto Perfil','http://img.com/user1.png','P',1);

-- READ
SELECT i.*, u.nome
FROM url_imagem_perfil i
JOIN tb_cadastro u ON i.tb_cadastro_idtb_cadastro=u.idtb_cadastro
WHERE i.excluido=0;

-- UPDATE
UPDATE url_imagem_perfil SET url_imagem='http://img.com/user1_new.png', atualizado=NOW() WHERE idurl_imagem=1;

-- DELETE
UPDATE url_imagem_perfil SET excluido=1, atualizado=NOW() WHERE idurl_imagem=1;

#13. url_video_curso
-- CREATE
INSERT INTO url_video_curso (nome_video, url_video, curso_idcurso)
VALUES ('Aula 1','http://video.com/aula1.mp4',1);

-- READ
SELECT v.*, c.nome_curso
FROM url_video_curso v
JOIN curso c ON v.curso_idcurso=c.idcurso
WHERE v.excluido=0;

-- UPDATE
UPDATE url_video_curso SET url_video='http://video.com/aula1_new.mp4', atualizado=NOW() WHERE idurl_video=1;

-- DELETE
UPDATE url_video_curso SET excluido=1, atualizado=NOW() WHERE idurl_video=1;

#14. turma_aluno (tabela N:N)
-- CREATE
INSERT INTO turma_aluno (turma_idturma, aluno_idaluno)
VALUES (1,1);

-- READ
SELECT ta.*, t.idturma, cu.nome_curso, u.nome AS aluno
FROM turma_aluno ta
JOIN turma t ON ta.turma_idturma=t.idturma
JOIN curso cu ON t.curso_idcurso=cu.idcurso
JOIN aluno a ON ta.aluno_idaluno=a.idaluno
JOIN tb_cadastro u ON a.tb_cadastro_idtb_cadastro=u.idtb_cadastro
WHERE ta.excluido=0;

-- UPDATE
UPDATE turma_aluno SET atualizado=NOW() WHERE turma_idturma=1 AND aluno_idaluno=1;

-- DELETE
UPDATE turma_aluno SET excluido=1, atualizado=NOW() WHERE turma_idturma=1 AND aluno_idaluno=1;

#📊 JUNÇÕES ÚTEIS

Alunos e seus cursos

SELECT u.nome AS aluno, cu.nome_curso
FROM aluno a
JOIN tb_cadastro u ON a.tb_cadastro_idtb_cadastro=u.idtb_cadastro
JOIN turma_aluno ta ON ta.aluno_idaluno=a.idaluno
JOIN turma t ON ta.turma_idturma=t.idturma
JOIN curso cu ON t.curso_idcurso=cu.idcurso
WHERE a.excluido=0 AND cu.excluido=0;


#Professores e suas turmas

SELECT u.nome AS professor, cu.nome_curso, t.idturma
FROM professor p
JOIN tb_cadastro u ON p.tb_cadastro_idtb_cadastro=u.idtb_cadastro
JOIN turma t ON t.professor_idprofessor=p.idprofessor
JOIN curso cu ON t.curso_idcurso=cu.idcurso
WHERE p.excluido=0;


#Cursos e suas atividades

SELECT cu.nome_curso, a.nome_atividade
FROM curso cu
JOIN atividade a ON a.curso_idcurso=cu.idcurso
WHERE cu.excluido=0 AND a.excluido=0;


#Usuários com suas imagens de perfil

SELECT u.nome, u.tipo_usuario, i.url_imagem
FROM tb_cadastro u
LEFT JOIN url_imagem_perfil i ON i.tb_cadastro_idtb_cadastro=u.idtb_cadastro AND i.excluido=0
WHERE u.excluido=0;


#Ranking de alunos por pontuação

SELECT u.nome, h.pontuacao
FROM aluno a
JOIN tb_cadastro u ON a.tb_cadastro_idtb_cadastro=u.idtb_cadastro
JOIN his_pontuacao h ON a.his_pontuacao_idhis_pontuacao=h.idhis_pontuacao
WHERE a.excluido=0
ORDER BY h.pontuacao DESC;