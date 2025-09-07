# 📚 TechTube World

Um sistema completo de ensino online, com **painel administrativo**,
**painel de professores** e **painel de alunos**.\
O projeto foi desenvolvido com foco em **responsividade (mobile first)**
e gestão eficiente de **cursos, turmas, alunos, professores e
atividades**.

------------------------------------------------------------------------

## 🚀 Funcionalidades

### 🔑 Autenticação

-   Login e cadastro de usuários (Aluno / Professor / Admin).\
-   Recuperação de senha.

### 👨‍🎓 Painel do Aluno

-   Inscrição em cursos.\
-   Acesso às turmas e atividades.\
-   Sistema de **pódio com ranking** dos alunos.\
-   Ferramentas de estudo:
    -   Flashcards interativos.\
    -   Anotações visuais.\
    -   Resumos.\
    -   Mapa mental.\
    -   **Técnica Pomodoro** totalmente configurável (tempo de estudo,
        pausas curtas/longas, ciclos, histórico).

### 👨‍🏫 Painel do Professor

-   Criação e edição de cursos com **editor avançado (texto, imagens,
    vídeos e anexos)**.\
-   Upload de imagem de capa do curso.\
-   Gerenciamento de turmas (criar, editar, excluir e visualizar
    alunos).\
-   Criação e acompanhamento de atividades (texto, imagem e vídeo).\
-   Dashboard com indicadores:
    -   Cursos criados.\
    -   Alunos inscritos.\
    -   Avaliação dos cursos.

### 🛠 Painel do Administrador

-   Gerenciar **alunos, professores, cursos, turmas, categorias e
    atividades**.\
-   Listagem com filtros avançados (nome, turma, data de cadastro,
    etc.).\
-   Modais de **adicionar, editar e excluir registros**.\
-   Relatórios e estatísticas.

------------------------------------------------------------------------

## 🗂 Estrutura do Banco de Dados

### Principais Tabelas:

-   **usuarios** → nome, matrícula, email, telefone, sexo, senha,
    tipo_usuario.\
-   **professores** → informações dos professores vinculados aos
    cursos.\
-   **alunos** → dados completos dos alunos e vínculo com turmas.\
-   **cursos** → nome, descrição, categoria, professor, imagem, vídeo,
    data criação/modificação.\
-   **turmas** → vínculo entre cursos e alunos.\
-   **atividades** → nome, conteúdo (texto, imagem, vídeo) e curso
    associado.\
-   **categorias** → classificação dos cursos.

------------------------------------------------------------------------

## 🖥 Tecnologias Utilizadas

-   **Frontend**:
    -   HTML5, CSS3 (Bootstrap 5, mobile first).\
    -   JavaScript (ES6+).\
    -   TinyMCE (Editor WYSIWYG sem API).
-   **Backend**:
    -   PHP.
    -   Integração com MySQL.
-   **Banco de Dados**:
    -   MySQL.

------------------------------------------------------------------------

## 📲 Responsividade

-   Todo o projeto segue a estratégia **Mobile First**.\
-   Sidebar adaptável (offcanvas em mobile).\
-   Layout fluído para tablets e desktops.

------------------------------------------------------------------------

## ⚡ Como Rodar o Projeto

1.  Clone este repositório:

    ``` bash
    git clone https://github.com/seu-usuario/techtube-world.git
    ```

2.  Configure o banco de dados MySQL importando o script:

    ``` sql
    source criacao_do_banco_de_dados.sql;
    ```

3.  Abra os arquivos HTML em seu navegador para visualizar o frontend.

4.  (Opcional) Configure o backend (PHP/Node) para autenticação e
    persistência dos dados.

------------------------------------------------------------------------

## 🎯 Diferenciais

-   Sistema de **gestão educacional completo**.\
-   **Ferramentas de estudo inovadoras** (Pomodoro, flashcards, mapas
    mentais).\
-   Interface moderna com **Bootstrap 5** e **design intuitivo**.\
-   Estrutura de banco escalável.\
-   Pensado para **professores, alunos e administradores** em uma única
    aplicação.

------------------------------------------------------------------------

✍️ **Autores:**
