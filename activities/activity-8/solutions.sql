-- WARNING: This setup deletes and recreates the activity_8_db exercise database.
DROP DATABASE IF EXISTS atividade_8_db;
CREATE DATABASE atividade_8_db;
USE atividade_8_db;

CREATE TABLE tb_departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao_depto VARCHAR(50) NOT NULL
);

CREATE TABLE tb_projetos (
    id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_projeto VARCHAR(50) NOT NULL
);

CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    departamento_id INT
);

CREATE TABLE tb_projeto_empregado (
    id_projeto_empregado INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    funcionario_id INT,
    projeto_id INT
);

ALTER TABLE tb_funcionarios
ADD CONSTRAINT fk_funcionario_depto FOREIGN KEY (departamento_id) REFERENCES tb_departamento(id_departamento);

ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT fk_projeto_empregado_funcionario FOREIGN KEY (funcionario_id) REFERENCES tb_funcionarios(id_funcionario);

ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT fk_projeto_empregado_projeto FOREIGN KEY (projeto_id) REFERENCES tb_projetos(id_projeto);

ALTER TABLE tb_funcionarios 
ADD COLUMN comissao DECIMAL(11,2) NOT NULL,
ADD COLUMN documento VARCHAR(50) NOT NULL,
DROP COLUMN cpf,
MODIFY COLUMN nome VARCHAR(50) NOT NULL,
ADD COLUMN genero INT NULL,
ADD COLUMN salario DECIMAL(11,2) NOT NULL;

ALTER TABLE tb_departamento
RENAME COLUMN descricao_depto TO nome_depto;

INSERT INTO tb_departamento (nome_depto) VALUES
('Recursos Humanos'),
('Informatica'),
('Administrativo'),
('Executivo'),
('Vendas');

INSERT INTO tb_funcionarios (nome, documento, genero, comissao, salario, departamento_id) VALUES
('Joao', '12345', 1, 0.00, 2500.00, 1),
('Carlos', '12346', 1, 0.00, 3500.00, 1),
('Paula', '12347', 2, 0.00, 5500.00, 1),
('Marta', '12344', 2, 0.00, 3200.00, 1),
('Lucas', '22564', 1, 0.00, 1500.00, 2),
('Pedro', '13869', 1, 0.00, 1600.00, 2),
('Camila', '22564', 2, 0.00, 2760.33, 2),
('Fernanda', '28484', 2, 0.00, 1920.55, 2),
('Marcos', '38784', 1, 0.00, 2920.00, 3),
('Juliana', '78534', 2, 0.00, 2550.21, 3),
('Rafael', '98324', 1, 0.00, 1550.55, 3),
('Patricia', '95624', 2, 0.00, 2550.21, 3),
('Roberto', '18624', 1, 0.00, 1734.11, 4),
('Ana', '28924', 2, 0.00, 2664.00, 4),
('Fernanda', '26434', 2, 0.00, 5421.00, 4),
('Beatriz', '19514', 2, 0.00, 1734.11, 4),
('Diego', '28234', 1, 100.89, 2734.00, 5),
('Leticia', '82312', 2, 342.00, 4224.00, 5),
('Bruno', '68319', 1, 111.07, 2434.00, 5),
('Amanda', '53588', 2, 324.69, 1656.19, 5);

INSERT INTO tb_projetos (descricao_projeto) VALUES
('Migracao de Servidores'),
('Atualizacao do ERP'),
('Desenvolvimento de API'),
('Auditoria de Seguranca'),
('Implementacao de Banco de Dados');

INSERT INTO tb_projeto_empregado (funcionario_id, projeto_id, data_inicio, data_fim) VALUES
(1, 1, '2026-07-19', '2026-09-12'),
(5, 1, '2026-07-19', '2026-09-12'),
(9, 1, '2026-07-19', '2026-09-12'),
(2, 2, '2026-05-11', '2026-11-22'),
(6, 2, '2026-05-11', '2026-11-22'),
(10, 2, '2026-05-11', '2026-11-22'),
(3, 3, '2026-10-28', '2027-03-15'),
(7, 3, '2026-10-28', '2027-03-15'),
(11, 3, '2026-10-28', '2027-03-15'),
(4, 4, '2026-11-18', '2027-05-12'),
(8, 4, '2026-11-18', '2027-05-12'),
(12, 4, '2026-11-18', '2027-05-12'),
(9, 5, '2026-12-25', '2027-01-01'),
(13, 5, '2026-12-25', '2027-01-01'),
(14, 5, '2026-12-25', '2027-01-01');

UPDATE tb_funcionarios
SET salario = salario + (salario * 0.15)
WHERE departamento_id = 1;

DELETE FROM tb_projeto_empregado WHERE projeto_id = 2;

DELETE FROM tb_projetos WHERE id_projeto = 2;