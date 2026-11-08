drop database if exists atividade_12;

create database atividade_12;

use atividade_12;

create table tb_departamento (
    id_departamento int primary key auto_increment,
    nome varchar (100) not null
);

create table tb_empregado (
    id_empregado int primary key auto_increment,
    nome varchar(50) not null,
    sexo int,
    salario decimal(11,2),
    data_nascimento date,
    departamento_id int,
    CONSTRAINT FK_Departamento_Empregado FOREIGN KEY (departamento_id) REFERENCES tb_departamento(id_departamento)
);

create table tb_projeto(
    id_projeto int primary key auto_increment,
    nome varchar (30) not null
);

create table tb_projeto_empregado (
    id_projeto_empregado int primary key auto_increment,
    empregado_id int,
    projeto_id int,
    data_inicial date,
    data_final date,
    CONSTRAINT FK_Projeto_Empregado FOREIGN KEY (projeto_id) REFERENCES tb_projeto(id_projeto),
    CONSTRAINT FK_Empregado_Projeto FOREIGN KEY (empregado_id) REFERENCES tb_empregado(id_empregado)
);

# INSERINDO DADOS NA TABELA DE DEPARTAMENTOS
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


# INSERINDO DADOS NA TABELA DE EMPREGADOS
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
    ('Rita de Castro Campos', null, 3800, '1975-01-7',null),
    ('Neymar Jr', null, null, '2000-06-25',null),
    ('Cristiano Ronaldo', null, 5000, '1990-12-25',null),
    ('Lionel Messi', null, 8800, '1993-01-01',null);


INSERT INTO tb_projeto
    (nome)
VALUES
    ("Redução de Custos"),
    ("Orçamentos"),
    ("Plano de Vendas"),
    ("Atualização Servidor"),
    ("Migração de Sistema"),
    ("Churrasco da Firma"),
    ("Festa de fim de ano"),
    ("Futebol da turma"),
    ("Happy hour"),
    ("Balanço Patrimonial");


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
    (15, 5, '2021-03-01', '2021-03-31'),
    (1, 6, '2022-01-01', '2022-01-31'),
    (1, 6, '2022-02-01', '2022-02-28'),
    (2, 6, '2022-03-01', '2022-03-31'),
    (3, 6, '2022-04-01', '2022-04-30'),
    (3, 7, '2023-05-01', '2023-05-31'),
    (4, 7, '2023-06-01', '2023-06-30'),
    (4, 7, '2023-07-01', '2023-07-31'),
    (5, 7, '2023-08-01', '2023-08-31'),
    (1, 2, '2025-02-01', '2025-02-28'),
    (2, 3, '2025-03-01', '2025-04-15'),
    (3, 4, '2025-04-01', '2025-04-30'),
    (4, 5, '2025-05-01', '2025-05-31'),
    (5, 6, '2025-06-01', '2025-06-30'),
    (6, 7, '2025-07-01', '2025-07-31'),
    (7, 1, '2025-08-01', '2025-08-31'),
    (8, 2, '2025-09-01', '2025-09-30'),
    (9, 3, '2025-10-01', '2025-10-31'),
    (10, 4, '2025-11-01', '2025-11-30'),
    (11, 5, '2025-12-01', '2025-12-31');
	
	#Exercício 1
SELECT
    CASE
        WHEN sexo = 1 THEN 'Masculino'
        WHEN sexo = 2 THEN 'Feminino'
        ELSE 'N/A'
    END AS Genero,
    COUNT(*) AS Qtde_funcionarios
FROM tb_empregado
GROUP BY sexo
ORDER BY COUNT(*) DESC;

	#Exercício 2
SELECT
    d.nome AS Departamento,
    COUNT(e.id_empregado) AS Qtde_funcionarios
FROM tb_departamento d
LEFT JOIN tb_empregado e
    ON d.id_departamento = e.departamento_id
GROUP BY
    d.id_departamento,
    d.nome
ORDER BY Qtde_funcionarios DESC;

	#Exercício 3
SELECT
    p.nome AS Projeto,
    COUNT(DISTINCT pe.empregado_id) AS Qtde_Funcionarios
FROM tb_projeto p
LEFT JOIN tb_projeto_empregado pe
    ON p.id_projeto = pe.projeto_id
GROUP BY
    p.id_projeto,
    p.nome
ORDER BY Qtde_Funcionarios DESC;

	#Exercício 4
SELECT
    d.nome AS Departamento,
    SUM(e.salario) AS Total_Salarios
FROM tb_departamento d
INNER JOIN tb_empregado e
    ON d.id_departamento = e.departamento_id
GROUP BY
    d.id_departamento,
    d.nome
ORDER BY Total_Salarios DESC
LIMIT 1;

	#Exercício 5 (usei subqueries já que não fiz antes e já aprendemos)
SELECT
    participacoes.Projeto,
    AVG(participacoes.Salario) AS Media_Salarial
FROM (
    SELECT DISTINCT
        p.id_projeto,
        p.nome AS Projeto,
        e.id_empregado,
        e.salario AS Salario
    FROM tb_empregado e
    INNER JOIN tb_projeto_empregado pe
        ON e.id_empregado = pe.empregado_id
    INNER JOIN tb_projeto p
        ON p.id_projeto = pe.projeto_id
) AS participacoes
GROUP BY
    participacoes.id_projeto,
    participacoes.Projeto
ORDER BY Media_Salarial DESC
LIMIT 1;

 #Exercício 6
SELECT
    p.nome AS Projeto
FROM tb_empregado e
INNER JOIN tb_projeto_empregado pe
    ON e.id_empregado = pe.empregado_id
INNER JOIN tb_projeto p
    ON p.id_projeto = pe.projeto_id
GROUP BY
    p.id_projeto,
    p.nome
HAVING COUNT(*) = SUM(
    CASE
        WHEN e.sexo = 2 THEN 1
        ELSE 0
    END
);