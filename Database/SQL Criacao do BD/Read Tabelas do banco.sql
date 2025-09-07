USE techtube;

-- ===========================================
-- View: Alunos com suas pontuações
-- ===========================================
CREATE OR REPLACE VIEW vw_aluno_pontuacao AS
SELECT a.idaluno, u.nome AS aluno, h.pontuacao, u.email, u.telefone
FROM aluno a
JOIN tb_cadastro u ON a.tb_cadastro_idtb_cadastro = u.idtb_cadastro
JOIN his_pontuacao h ON a.his_pontuacao_idhis_pontuacao = h.idhis_pontuacao
WHERE a.excluido = 0 AND u.excluido = 0 AND h.excluido = 0;

-- ===========================================
-- View: Professores e suas turmas
-- ===========================================
CREATE OR REPLACE VIEW vw_professor_turma AS
SELECT p.idprofessor, u.nome AS professor, p.siape, t.idturma, c.nome_curso
FROM professor p
JOIN tb_cadastro u ON p.tb_cadastro_idtb_cadastro = u.idtb_cadastro
JOIN turma t ON p.idprofessor = t.professor_idprofessor
JOIN curso c ON t.curso_idcurso = c.idcurso
WHERE p.excluido = 0 AND u.excluido = 0 AND c.excluido = 0 AND t.excluido = 0;

-- ===========================================
-- View: Alunos e os cursos que frequentam
-- ===========================================
CREATE OR REPLACE VIEW vw_aluno_curso AS
SELECT u.nome AS aluno, u.email, cu.nome_curso, t.idturma
FROM aluno a
JOIN tb_cadastro u ON a.tb_cadastro_idtb_cadastro = u.idtb_cadastro
JOIN turma_aluno ta ON ta.aluno_idaluno = a.idaluno
JOIN turma t ON ta.turma_idturma = t.idturma
JOIN curso cu ON t.curso_idcurso = cu.idcurso
WHERE a.excluido = 0 AND u.excluido = 0 AND cu.excluido = 0 AND t.excluido = 0 AND ta.excluido = 0;

-- ===========================================
-- View: Cursos e suas categorias
-- ===========================================
CREATE OR REPLACE VIEW vw_curso_categoria AS
SELECT cu.idcurso, cu.nome_curso, cu.carga_horaria, cat.nome_categoria
FROM curso cu
JOIN categoria cat ON cu.categoria_idcategoria = cat.idcategoria
WHERE cu.excluido = 0 AND cat.excluido = 0;

-- ===========================================
-- View: Cursos e suas atividades
-- ===========================================
CREATE OR REPLACE VIEW vw_curso_atividade AS
SELECT cu.nome_curso, a.idatividade, a.nome_atividade, a.conteudo_atividade
FROM curso cu
JOIN atividade a ON a.curso_idcurso = cu.idcurso
WHERE cu.excluido = 0 AND a.excluido = 0;

-- ===========================================
-- View: Usuários com suas imagens de perfil
-- ===========================================
CREATE OR REPLACE VIEW vw_usuario_perfil AS
SELECT u.idtb_cadastro, u.nome, u.tipo_usuario, i.url_imagem, i.tipo_imagem
FROM tb_cadastro u
LEFT JOIN url_imagem_perfil i ON i.tb_cadastro_idtb_cadastro = u.idtb_cadastro AND i.excluido = 0
WHERE u.excluido = 0;

-- ===========================================
-- View: Cursos com imagens e vídeos
-- ===========================================
CREATE OR REPLACE VIEW vw_curso_midia AS
SELECT cu.idcurso, cu.nome_curso, img.url_imagem, vid.url_video
FROM curso cu
LEFT JOIN url_imagem_curso img ON img.curso_idcurso = cu.idcurso AND img.excluido = 0
LEFT JOIN url_video_curso vid ON vid.curso_idcurso = cu.idcurso AND vid.excluido = 0
WHERE cu.excluido = 0;

-- ===========================================
-- View: Turma completa (professor + alunos)
-- ===========================================
CREATE OR REPLACE VIEW vw_turma_completa AS
SELECT t.idturma, cu.nome_curso, prof.nome AS professor, al.nome AS aluno
FROM turma t
JOIN curso cu ON t.curso_idcurso = cu.idcurso
JOIN professor p ON t.professor_idprofessor = p.idprofessor
JOIN tb_cadastro prof ON p.tb_cadastro_idtb_cadastro = prof.idtb_cadastro
JOIN turma_aluno ta ON t.idturma = ta.turma_idturma
JOIN aluno a ON ta.aluno_idaluno = a.idaluno
JOIN tb_cadastro al ON a.tb_cadastro_idtb_cadastro = al.idtb_cadastro
WHERE t.excluido = 0 AND cu.excluido = 0 AND prof.excluido = 0 AND al.excluido = 0 AND ta.excluido = 0;
