USE techtube;

-- ================================
-- Tabelas base
-- ================================
SELECT * FROM timestamps;

-- ================================
-- Usuários
-- ================================
SELECT * FROM tb_cadastro;
SELECT * FROM tb_cadastro WHERE excluido = 0;

-- ================================
-- Endereços
-- ================================
SELECT * FROM endereco;
SELECT * FROM endereco WHERE excluido = 0;

-- ================================
-- Categorias
-- ================================
SELECT * FROM categoria;
SELECT * FROM categoria WHERE excluido = 0;

-- ================================
-- Cursos
-- ================================
SELECT * FROM curso;
SELECT * FROM curso WHERE excluido = 0;

-- ================================
-- Histórico de Pontuação
-- ================================
SELECT * FROM his_pontuacao;
SELECT * FROM his_pontuacao WHERE excluido = 0;

-- ================================
-- Alunos
-- ================================
SELECT * FROM aluno;
SELECT * FROM aluno WHERE excluido = 0;

-- ================================
-- Professores
-- ================================
SELECT * FROM professor;
SELECT * FROM professor WHERE excluido = 0;

-- ================================
-- Turmas
-- ================================
SELECT * FROM turma;
SELECT * FROM turma WHERE excluido = 0;

-- ================================
-- Atividades
-- ================================
SELECT * FROM atividade;
SELECT * FROM atividade WHERE excluido = 0;

-- ================================
-- Imagens de Curso
-- ================================
SELECT * FROM url_imagem_curso;
SELECT * FROM url_imagem_curso WHERE excluido = 0;

-- ================================
-- Imagens de Atividade
-- ================================
SELECT * FROM url_imagem_atividade;
SELECT * FROM url_imagem_atividade WHERE excluido = 0;

-- ================================
-- Imagens de Perfil
-- ================================
SELECT * FROM url_imagem_perfil;
SELECT * FROM url_imagem_perfil WHERE excluido = 0;

-- ================================
-- Vídeos de Curso
-- ================================
SELECT * FROM url_video_curso;
SELECT * FROM url_video_curso WHERE excluido = 0;

-- ================================
-- Relação Turma x Aluno
-- ================================
SELECT * FROM turma_aluno;
SELECT * FROM turma_aluno WHERE excluido = 0;

-- ================================
-- VIEWS criadas
-- ================================
SELECT * FROM vw_aluno_curso;
SELECT * FROM vw_professor_turma;
SELECT * FROM vw_curso_categoria;
SELECT * FROM vw_usuario_perfil;
