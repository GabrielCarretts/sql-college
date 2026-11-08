DROP DATABASE IF EXISTS atividade_10;
CREATE DATABASE atividade_10;
USE atividade_10;


#CRIANDO AS TABELAS LIMPAS
CREATE TABLE tb_departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE tb_empregado (
    id_empregado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sexo INT,
    salario DECIMAL(11,2),
    data_nascimento DATE,
    departamento_id INT
);

CREATE TABLE tb_projeto (
    id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE tb_projeto_empregado (
    id_projeto_empregado INT PRIMARY KEY AUTO_INCREMENT,
    empregado_id INT,
    projeto_id INT,
    data_inicial DATE,
    data_final DATE
);


#ADICIONANDO AS CHAVES ESTRANGEIRAS
ALTER TABLE tb_empregado
ADD CONSTRAINT FK_Departamento_Empregado FOREIGN KEY (departamento_id) REFERENCES tb_departamento(id_departamento);

ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT FK_Projeto_Empregado FOREIGN KEY (projeto_id) REFERENCES tb_projeto(id_projeto);

ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT FK_Empregado_Projeto FOREIGN KEY (empregado_id) REFERENCES tb_empregado(id_empregado);


#INSERINDO DADOS NAS TABELAS
INSERT INTO tb_departamento
    (nome)
VALUES
    ('Desenvolvimento'),
    ('Financeiro'),
    ('Contabilidade'),
    ('Vendas'),
    ('Recursos Humanos'),
    ('Estoque'),
    ('Atendimento'),
    ('Almoxarifado');

INSERT INTO tb_empregado
    (nome, sexo, salario, data_nascimento, departamento_id)
VALUES
    ('João da Silva', 1, 1000, '2000-03-07', 1),
    ('Maria Silveira', 2, 1000,'2003-04-13', 1),
    ('Lidia Pereira', 2, 1200, '2000-05-20', 1),
    ('Victor Oliveira', 1, 1500, '1991-06-29', 1),
    ('Paulo Silva Campos', 1, 5000, '1992-05-31', 2),
    ('Pedro Campos', 1, 10000, '2001-02-10', 2),
    ('José da Silva Oliveira', 1, 9500, '2000-02-28', 2),
    ('João Carlos Pereira', 1, 15000, '1999-03-30', 2),
    ('Ana Paula Amorim', 2, 20000, '1998-07-19', 3),
    ('Antônia de Castro', 2, 2000, '1965-10-22', 3),
    ('Elisa Silveira Campos', 2, 3000, '1980-12-16', 3),
    ('Gilson Machado', 1, 1000, '1982-11-13', 3),
    ('Andreia Vitoria Silva', 2, 1200, '1990-11-17', 4),
    ('Vicente da Rosa Silva', 1, 2200, '1995-10-08', 4),
    ('Juliana Oliveira', 2, 3500, '1997-08-05', 4),
    ('Marlon da Silva', 1, 2400,'1996-09-03', 4),
    ('Silvio Luis Oliveira', 1, 1800, '2006-09-01', 5),
    ('Roberto Carlos Castro', NULL, 4300, '2002-02-11', 5),
    ('Maria Betânia Amorim', NULL, 5500, '1999-03-02', 5),
    ('Rita de Castro Campos', NULL, 3800, '1975-01-07', NULL),
    ('Neymar Jr', NULL, NULL, '2000-06-25', NULL),
    ('Cristiano Ronaldo', NULL, 5000, '1990-12-25', NULL),
    ('Lionel Messi', NULL, 8800, '1993-01-01', NULL);

INSERT INTO tb_projeto
    (nome)
VALUES
    ('Alfa'),
    ('Beta'),
    ('Gama'),
    ('Delta'),
    ('Omega'),
    ('Kappa'),
    ('Lambda');

INSERT INTO tb_projeto_empregado
    (empregado_id, projeto_id, data_inicial, data_final)
VALUES
    (1, 1, '2025-01-01', '2025-01-31'),
    (2, 1, '2025-01-10', '2025-02-28'),
    (3, 1, '2025-03-01', '2025-03-31'),
    (4, 2, '2025-04-01', '2025-04-30'),
    (5, 2, '2025-05-01', '2025-05-31'),
    (6, 2, '2025-06-01', '2025-06-30'),
    (7, 3, '2025-07-01', '2025-07-31'),
    (8, 3, '2025-08-01', '2025-08-31'),
    (9, 3, '2025-09-01', '2025-09-30'),
    (10, 4, '2025-10-01', '2025-10-31'),
    (11, 4, '2025-11-01', '2025-11-30'),
    (12, 4, '2025-12-01', '2025-12-31'),
    (13, 5, '2021-01-01', '2021-01-31'),
    (14, 5, '2021-02-01', '2021-02-28'),
    (15, 5, '2021-03-01', '2021-03-31');


# Exercício 1
SELECT CONCAT('Nome: ', emp.nome, ' (Departamento: ', depto.nome, ')') AS 'Empregado_Depto'
FROM tb_empregado AS emp
INNER JOIN tb_departamento AS depto ON emp.departamento_id = depto.id_departamento
ORDER BY depto.nome;

#Exercício 2
SELECT UPPER(nome) 
FROM tb_departamento
ORDER BY nome;

#Exercício 3
SELECT LEFT(nome, 3) AS 'Nome'
FROM tb_empregado
ORDER BY nome;

#Exercício 4
SELECT nome as 'Nome_Projeto', LENGTH(nome) AS 'Qtd_Caracteres'
FROM tb_projeto
ORDER BY nome;

#Exercício 5
SELECT * FROM tb_empregado
WHERE sexo IS NULL
ORDER BY nome;

#Exercício 6
SELECT REPLACE(REPLACE(nome, 'A', '4'), 'a', '4') as 'N0M3'
FROM tb_empregado
ORDER BY nome;

#Exercício 7
SELECT AVG(salario) AS 'Média salário'
FROM tb_empregado;

#Exercício 8
SELECT DATEDIFF(pe.data_final, pe.data_inicial) AS 'Total_Dias', p.nome AS 'Nome_Projeto'
FROM tb_projeto AS p
INNER JOIN tb_projeto_empregado AS pe ON p.id_projeto = pe.projeto_id
ORDER BY Total_Dias;

#Exercício 9
SELECT SUM(salario) AS 'Total_Salário_Masc'
FROM tb_empregado WHERE sexo = 1;

#Exercício 10
SELECT SUM(salario) AS 'Total_Salário_Fem'
FROM tb_empregado WHERE sexo = 2;

#Exercício 11
SELECT * FROM tb_empregado
ORDER BY salario DESC
LIMIT 1;

#Exercício 12
SELECT  p.nome AS 'Nome_Projeto', DATEDIFF(CURDATE(), pe.data_final) AS 'Dias_Desde_Fim'
FROM tb_projeto AS p
INNER JOIN tb_projeto_empregado AS pe ON p.id_projeto = pe.projeto_id
ORDER BY Dias_Desde_Fim;

#Exercício 13
SELECT p.nome AS 'Nome_Projeto', pe.data_inicial, WEEKDAY(pe.data_inicial) AS 'Dia_Semana'
FROM tb_projeto AS p
INNER JOIN tb_projeto_empregado AS pe ON p.id_projeto = pe.projeto_id
WHERE WEEKDAY(pe.data_inicial) = 0
ORDER BY pe.data_inicial;

#Exercício 14
SELECT nome AS 'Nome', data_nascimento AS 'Data_Nascimento',
YEAR(CURDATE()) - YEAR(data_nascimento) AS 'Idade'
FROM tb_empregado
WHERE YEAR(CURDATE()) - YEAR(data_nascimento) > 15
ORDER BY idade;