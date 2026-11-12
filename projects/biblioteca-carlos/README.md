# Biblioteca do Carlos — MySQL Database Project

**Português** | [English](#english)

## Português

Projeto acadêmico desenvolvido para a disciplina de Banco de Dados do curso de Sistemas de Informação. Adaptado do estudo de caso **Biblioteca do Zé**, utiliza **MySQL 8.0** e o schema `biblioteca_carlos`.

### Conteúdo

- [`biblioteca_carlos.sql`](biblioteca_carlos.sql) — script completo para criar o banco, as tabelas, as chaves estrangeiras e os dados de exemplo.
- [`consultas.sql`](consultas.sql) — as 14 consultas solicitadas no estudo de caso, incluindo JOIN, GROUP BY, HAVING, funções de agregação, subconsultas, CASE e WITH (CTE).
- **Diagrama EER (PNG)** — gerado no MySQL Workbench por engenharia reversa; adicionar o arquivo exportado à pasta do projeto.

### Estrutura

O banco possui 8 tabelas: `autores`, `editoras`, `livros`, `leitores`, `funcionarios`, `emprestimos`, `reservas` e `pagamentos`. São 9 relacionamentos por chaves estrangeiras.

### Como executar

1. Abra o MySQL Workbench conectado a um servidor MySQL 8.0.
2. Execute `biblioteca_carlos.sql` para criar e popular o banco.
3. Execute as consultas de `consultas.sql` individualmente para analisar os resultados.

> **Atenção:** o script começa com `DROP DATABASE IF EXISTS biblioteca_carlos;` e **apaga o banco existente** antes de recriá-lo. Use um ambiente de estudo, não um banco de produção.

As informações de autores, leitores, títulos, editoras e pagamentos neste projeto são dados de exemplo destinados ao aprendizado.

---

## English

Academic database project for an Information Systems course. Adapted from the **Biblioteca do Zé** case study, using **MySQL 8.0** and the `biblioteca_carlos` schema.

### Files

- [`biblioteca_carlos.sql`](biblioteca_carlos.sql) — complete schema definition, foreign keys, and sample data.
- [`consultas.sql`](consultas.sql) — 14 SQL queries covering JOIN, GROUP BY, HAVING, aggregate functions, subqueries, CASE, and WITH (CTEs).
- **EER diagram (PNG)** — exported using MySQL Workbench reverse engineering; the exported diagram should be added to this folder.

### Schema

The database has 8 tables: `autores`, `editoras`, `livros`, `leitores`, `funcionarios`, `emprestimos`, `reservas`, and `pagamentos`, connected through 9 foreign-key relationships.

### How to run

1. Connect MySQL Workbench to a MySQL 8.0 server.
2. Run `biblioteca_carlos.sql` to recreate and populate the database.
3. Run the statements from `consultas.sql` individually.

> **Warning:** the setup script starts with `DROP DATABASE IF EXISTS biblioteca_carlos;` and **deletes any existing database with that name** before rebuilding it. Use a disposable learning database.

All sample records are intended for educational use.
