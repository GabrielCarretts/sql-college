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