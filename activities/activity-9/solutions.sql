CREATE DATABASE atividade9;
USE atividade9;


#CRIANDO AS TABELAS LIMPAS
CREATE TABLE tb_departamento (
    id_departamento INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_departamento)
);

CREATE TABLE tb_empregado (
    id_empregado INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sexo INT,
    salario DECIMAL(11,2),
    data_nascimento DATE,
    departamento_id INT,
    PRIMARY KEY (id_empregado)
);

CREATE TABLE tb_projeto(
    id_projeto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_projeto)
);

CREATE TABLE tb_projeto_empregado (
    id_projeto_empregado INT NOT NULL AUTO_INCREMENT,
    empregado_id INT,
    projeto_id INT,
    data_inicial DATE,
    data_final DATE,
    PRIMARY KEY (id_projeto_empregado)
);


# ADICIONANDO AS CHAVES ESTRANGEIRAS
ALTER TABLE tb_empregado
ADD CONSTRAINT FK_departamentoempregado FOREIGN KEY (departamento_id) REFERENCES tb_departamento(id_departamento);

ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT FK_ProjetoEmpregado FOREIGN KEY (projeto_id) REFERENCES tb_projeto(id_projeto);

ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT FK_EmpregadoProjeto FOREIGN KEY (empregado_id) REFERENCES tb_empregado(id_empregado);


# INSERINDO DADOS NAS TABELAS
INSERT INTO tb_departamento
    (nome)
VALUES
    ('Desenvolvimento'),
    ('Financeiro'),
    ('Contabilidade'),
    ('Vendas'),
    ('Recursos Humanos');

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
    ('Gilson Machado', 1, 1000, '1982-11-13',3),
    ('Andreia Vitoria Silva', 2, 1200, '1990-11-17',4),
    ('Vicente da Rosa Silva', 1, 2200, '1995-10-08',4),
    ('Juliana Oliveira', 2, 3500, '1997-08-05',4),
    ('Marlon da Silva', 1, 2400,'1996-09-03',4),
    ('Silvio Luis Oliveira', 1, 1800, '2006-09-01',5),
    ('Roberto Carlos Castro', null, 4300, '2002-02-11',5),
    ('Maria Betânia Amorim', null, 5500, '1999-03-2',5),
    ('Rita de Castro Campos', null, 3800, '1975-01-7',5);

INSERT INTO tb_projeto
    (nome)
VALUES
    ("Alfa"),
    ("Beta"),
    ("Gama"),
    ("Delta"),
    ("Omega"),
    ("Lambda");

INSERT INTO tb_projeto_empregado
    (empregado_id, projeto_id, data_inicial, data_final)
VALUES
    (1, 1, '2022-01-01', '2022-01-31'),
    (2, 1, '2022-01-10', '2022-02-28'),
    (3, 1, '2022-03-01', '2022-03-31'),
    (4, 2, '2022-04-01', '2022-04-30'),
    (5, 2, '2022-05-01', '2022-05-31'),
    (6, 2, '2022-06-01', '2022-06-30'),
    (7, 3, '2022-07-01', '2022-07-31'),
    (8, 3, '2022-08-01', '2022-08-31'),
    (9, 3, '2022-09-01', '2022-09-30'),
    (10, 4, '2022-10-01', '2022-10-31'),
    (11, 4, '2022-11-01', '2022-11-30'),
    (12, 4, '2022-12-01', '2022-12-31'),
    (13, 5, '2021-01-01', '2021-01-31'),
    (14, 5, '2021-02-01', '2021-02-28'),
    (15, 5, '2021-03-01', '2021-03-31');

	
#Exercício 1
SELECT id_departamento, nome FROM tb_departamento;

#Exercício 2
SELECT id_empregado, nome, sexo, salario, data_nascimento, departamento_id FROM tb_empregado;

#Exercício 3
SELECT id_projeto, nome FROM tb_projeto;

#Exercício 4
SELECT id_empregado, nome, sexo, salario, data_nascimento, departamento_id FROM tb_empregado
WHERE nome LIKE 'J%';

#Exercício 5
SELECT id_empregado, nome, sexo, salario, data_nascimento, departamento_id FROM tb_empregado
WHERE nome LIKE '%O';

#Exercício 6
SELECT id_empregado, nome, sexo, salario, data_nascimento, departamento_id FROM tb_empregado
WHERE nome LIKE '%A%';

#Exercício 7
SELECT id_empregado, nome, sexo, salario, data_nascimento, departamento_id FROM tb_empregado
WHERE sexo = 2;

#Exercício 8
SELECT id_empregado, nome, sexo, salario, data_nascimento, departamento_id FROM tb_empregado
WHERE departamento_id = 2;

#Exercício 9
SELECT id_empregado, nome, sexo, salario, data_nascimento, departamento_id FROM tb_empregado
ORDER BY salario;

#Exercício 10
SELECT nome, salario, departamento_id FROM tb_empregado
WHERE salario > 10000 AND departamento_id = 1;

#Exercício 11
SELECT projeto_id, data_inicial, data_final FROM tb_projeto_empregado
WHERE data_inicial BETWEEN '2022-03-01' AND '2022-03-31';