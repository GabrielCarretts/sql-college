# =================================================================
# BANCO DE DADOS: BIBLIOTECA DO CARLOS
# Exemplo didático para a disciplina de Banco de Dados
# SGBD: MySQL
# =================================================================

# =================================================================
# 1. CRIAÇÃO DO BANCO DE DADOS
# =================================================================

DROP DATABASE IF EXISTS biblioteca_carlos;
CREATE DATABASE biblioteca_carlos;
USE biblioteca_carlos;

# =================================================================
# 2. CRIAÇÃO DAS TABELAS
# =================================================================

CREATE TABLE autores (
    id_autor INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE,
    genero TINYINT UNSIGNED,
    email VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE livros (
    id_livro INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT UNSIGNED,
    genero VARCHAR(50),
    preco DECIMAL(11,2),
    numero_paginas INT UNSIGNED,
    quantidade_estoque INT UNSIGNED,
    autor_id INT UNSIGNED NOT NULL,
    editora_id INT UNSIGNED
);

CREATE TABLE leitores (
    id_leitor INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    cidade VARCHAR(80),
    data_cadastro DATE,
    idade TINYINT UNSIGNED,
    telefone VARCHAR(50),
    genero TINYINT UNSIGNED
);

CREATE TABLE funcionarios (
    id_funcionario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(11,2)
);

CREATE TABLE emprestimos (
    id_emprestimo INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    livro_id INT UNSIGNED NOT NULL,
    leitor_id INT UNSIGNED NOT NULL,
    funcionario_id INT UNSIGNED NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20)
);

CREATE TABLE pagamentos (
    id_pagamento INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    valor_cobrado DECIMAL(11,2) NOT NULL,
    desconto DECIMAL(5,2),
    forma_pagamento VARCHAR(20),
    data_pagamento DATE,
    emprestimo_id INT UNSIGNED NOT NULL
);

CREATE TABLE editoras (
    id_editora INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE reservas (
    id_reserva INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    leitor_id INT UNSIGNED NOT NULL,
    livro_id INT UNSIGNED NOT NULL,
    funcionario_id INT UNSIGNED NOT NULL,
    data_reserva DATE NOT NULL,
    data_validade DATE,
    data_atendimento DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente'
);

# =================================================================
# 3. CRIAÇÃO DAS CHAVES ESTRANGEIRAS
# =================================================================

ALTER TABLE livros
    ADD CONSTRAINT fk_livros_autores
        FOREIGN KEY (autor_id)
        REFERENCES autores(id_autor);

ALTER TABLE emprestimos
    ADD CONSTRAINT fk_emprestimos_livros
        FOREIGN KEY (livro_id)
        REFERENCES livros(id_livro);

ALTER TABLE emprestimos
    ADD CONSTRAINT fk_emprestimos_leitores
        FOREIGN KEY (leitor_id)
        REFERENCES leitores(id_leitor);

ALTER TABLE emprestimos
    ADD CONSTRAINT fk_emprestimos_funcionarios
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionarios(id_funcionario);

ALTER TABLE pagamentos
    ADD CONSTRAINT fk_pagamentos_emprestimos
        FOREIGN KEY (emprestimo_id)
        REFERENCES emprestimos(id_emprestimo);

ALTER TABLE livros
    ADD CONSTRAINT fk_livros_editoras
        FOREIGN KEY (editora_id)
        REFERENCES editoras(id_editora);

ALTER TABLE reservas
    ADD CONSTRAINT fk_reservas_leitores
        FOREIGN KEY (leitor_id)
        REFERENCES leitores(id_leitor),
    ADD CONSTRAINT fk_reservas_livros
        FOREIGN KEY (livro_id)
        REFERENCES livros(id_livro),
    ADD CONSTRAINT fk_reservas_funcionarios
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionarios(id_funcionario);

# =================================================================
# 4. INSERTS
# =================================================================

USE biblioteca_carlos;


# 4.1 AUTORES

INSERT INTO autores (
    nome,
    nacionalidade,
    data_nascimento,
    genero,
    email,
    cidade
)
VALUES
    ('Rafael Gattino', 'Brasileira', '1999-03-15', 1, 'rafael.gattino@cronicasdopixel.example', 'Lages'),
    ('Angela Arruda', 'Brasileira', '1977-08-22', 2, 'angela.arruda@cronicasdopixel.example', 'Florianópolis'),
    ('Athos Branco', 'Brasileira', '1985-01-10', 1, 'athos.branco@cronicasdopixel.example', 'Curitiba'),
    ('Cristian dos Santos', 'Brasileira', '1980-11-05', 1, 'cristian.dos.santos@cronicasdopixel.example', 'São Paulo'),
    ('Fernanda Forbici', 'Brasileira', '1988-06-18', 2, 'fernanda.forbici@cronicasdopixel.example', 'Joinville'),
    ('Giovani Letti', 'Brasileira', '1979-09-27', 1, 'giovani.letti@cronicasdopixel.example', 'Porto Alegre'),
    ('Juliana Branco', 'Brasileira', '1986-02-14', 2, 'juliana.branco@cronicasdopixel.example', 'Blumenau'),
    ('Kassiano Ramos', 'Brasileira', '1983-12-03', 1, 'kassiano.ramos@cronicasdopixel.example', 'Chapecó'),
    ('Rafael Pellizzoni', 'Brasileira', '1981-07-30', 1, 'rafael.pellizzoni@cronicasdopixel.example', 'Criciúma'),
    ('Luciano Coelho', 'Brasileira', '1975-04-11', 1, 'luciano.coelho@cronicasdopixel.example', 'Rio de Janeiro'),
    ('Patrick Naufel', 'Brasileira', '1989-10-19', 1, 'patrick.naufel@cronicasdopixel.example', 'Brasília'),
    ('Sabrina Bet', 'Brasileira', '1987-05-25', 2, 'sabrina.bet@cronicasdopixel.example', 'Balneário Camboriú'),
    ('Lara Croft', 'Britânica', '1992-02-14', 2, 'lara.croft@cronicasdopixel.example', 'Londres'),
    ('Jill Valentine', 'Estadunidense', '1990-11-21', 2, 'jill.valentine@cronicasdopixel.example', 'Raccoon City'),
    ('Ada Wong', 'Fictícia', '1988-05-12', 2, 'ada.wong@cronicasdopixel.example', 'Raccoon City'),
    ('Aloy', 'Fictícia', '1998-04-04', 2, 'aloy@cronicasdopixel.example', 'Meridian'),
    ('Ellie Williams', 'Estadunidense', '2001-07-09', 2, 'ellie.williams@cronicasdopixel.example', 'Jackson'),
    ('Yennefer de Vengerberg', 'Fictícia', '1985-03-18', 2, 'yennefer.de.vengerberg@cronicasdopixel.example', 'Vengerberg'),
    ('Arthur Morgan', 'Estadunidense', '1980-06-22', 1, 'arthur.morgan@cronicasdopixel.example', 'Saint Denis'),
    ('Geralt de Rívia', 'Fictícia', '1983-09-15', 1, 'geralt.de.rivia@cronicasdopixel.example', 'Rívia'),
    ('Leon Kennedy', 'Estadunidense', '1994-08-10', 1, 'leon.kennedy@cronicasdopixel.example', 'Raccoon City'),
    ('Solid Snake', 'Fictícia', '1987-12-02', 1, 'solid.snake@cronicasdopixel.example', 'Shadow Moses');


# 4.2 EDITORAS

INSERT INTO editoras (
    nome,
    cidade,
    pais
)
VALUES
    ('Konami', 'Tokio', 'Japão'),
    ('Capcom', 'Osaka', 'Japão'),
    ('Santa Monica', 'Los Angeles', 'Estados Unidos'),
    ('Nintendo', 'Kyoto', 'Japão'),
    ('Sega', 'Tóquio', 'Japão'),
    ('Square Enix', 'Tóquio', 'Japão'),
    ('Bandai Namco', 'Tóquio', 'Japão'),
    ('FromSoftware', 'Tóquio', 'Japão'),
    ('Game Freak', 'Tóquio', 'Japão'),
    ('Atlus', 'Tóquio', 'Japão'),
    ('Naughty Dog', 'Santa Monica', 'Estados Unidos'),
    ('Insomniac Games', 'Burbank', 'Estados Unidos'),
    ('Rockstar Games', 'Nova York', 'Estados Unidos'),
    ('Bethesda Game Studios', 'Rockville', 'Estados Unidos'),
    ('id Software', 'Richardson', 'Estados Unidos'),
    ('Valve', 'Bellevue', 'Estados Unidos'),
    ('CD Projekt RED', 'Varsóvia', 'Polônia'),
    ('Ubisoft Montreal', 'Montreal', 'Canadá'),
    ('Remedy Entertainment', 'Espoo', 'Finlândia'),
    ('Larian Studios', 'Gante', 'Bélgica');


# 4.3 LIVROS

INSERT INTO livros (
    titulo,
    ano_publicacao,
    genero,
    preco,
    numero_paginas,
    quantidade_estoque,
    autor_id,
    editora_id
)
VALUES
    # Rafael Gattino - 9 livros
    ('Fundamentos de Banco de Dados', 2021, 'Banco de Dados', 89.90, 217, 6, 1, 4),
    ('SQL na Pratica', 2022, 'Banco de Dados', 95.00, 254, 11, 1, 4),
    ('Modelagem de Dados Moderna', 2020, 'Banco de Dados', 78.50, 291, 16, 1, 4),
    ('MySQL do Basico ao Avancado', 2023, 'Banco de Dados', 110.00, 328, 3, 1, 4),
    ('Administracao de Bancos de Dados', 2019, 'Banco de Dados', 86.90, 365, 8, 1, 4),
    ('Consultas SQL Profissionais', 2024, 'Banco de Dados', 105.50, 402, 13, 1, 4),
    ('Data Warehouse Essencial', 2022, 'Dados', 120.00, 439, 18, 1, 4),
    ('Introducao a Engenharia de Dados', 2025, 'Dados', 135.00, 476, 5, 1, 4),
    ('Projeto de Bancos Relacionais', 2021, 'Banco de Dados', 92.00, 513, 10, 1, 4),

    # Angela Arruda - 6 livros
    ('Inteligencia Artificial Aplicada', 2024, 'Inteligencia Artificial', 139.90, 550, 15, 2, 5),
    ('Machine Learning para Iniciantes', 2023, 'Inteligencia Artificial', 128.00, 587, 2, 2, 5),
    ('Redes Neurais na Pratica', 2025, 'Inteligencia Artificial', 149.90, 204, 7, 2, 5),
    ('Fundamentos de Ciencia de Dados', 2022, 'Dados', 118.00, 241, 12, 2, 5),
    ('Python para Ciencia de Dados', 2024, 'Programacao', 125.50, 278, 17, 2, 5),
    ('IA Generativa nos Negocios', 2025, 'Inteligencia Artificial', 155.00, 315, 4, 2, 5),

    # Athos Branco - 5 livros
    ('Redes de Computadores Essencial', 2020, 'Redes', 86.00, 352, 9, 3, 6),
    ('Administracao de Redes Linux', 2022, 'Redes', 92.50, 389, 14, 3, 6),
    ('Protocolos TCP IP', 2019, 'Redes', 75.00, 426, 1, 3, 6),
    ('Seguranca em Redes Corporativas', 2023, 'Seguranca', 119.90, 463, 6, 3, 6),
    ('Infraestrutura de Redes Moderna', 2024, 'Redes', 129.00, 500, 11, 3, 6),

    # Cristian dos Santos - 5 livros
    ('Programacao Java para Iniciantes', 2020, 'Programacao', 82.50, 537, 16, 4, 7),
    ('Java Orientado a Objetos', 2021, 'Programacao', 94.90, 574, 3, 4, 7),
    ('APIs REST com Java', 2023, 'Programacao', 115.00, 191, 8, 4, 7),
    ('Arquitetura de Software com Java', 2024, 'Engenharia de Software', 138.00, 228, 13, 4, 7),
    ('Padroes de Projeto em Java', 2022, 'Engenharia de Software', 107.50, 265, 18, 4, 7),

    # Fernanda Forbici - 4 livros
    ('UX Design para Sistemas', 2022, 'Design', 86.90, 302, 5, 5, 8),
    ('Interfaces Digitais Modernas', 2023, 'Design', 99.00, 339, 10, 5, 8),
    ('Experiencia do Usuario na Pratica', 2024, 'Design', 112.00, 376, 15, 5, 8),
    ('Acessibilidade em Sistemas Web', 2025, 'Acessibilidade', 124.90, 413, 2, 5, 8),

    # Giovani Letti - 4 livros
    ('Linux para Administradores', 2021, 'Sistemas Operacionais', 92.00, 450, 7, 6, 9),
    ('Servidores Linux na Pratica', 2022, 'Sistemas Operacionais', 108.00, 487, 12, 6, 9),
    ('Shell Script Essencial', 2020, 'Programacao', 74.90, 524, 17, 6, 9),
    ('Docker e Containers', 2024, 'DevOps', 129.90, 561, 4, 6, 9),

    # Juliana Branco - 4 livros
    ('Engenharia de Software Moderna', 2021, 'Engenharia de Software', 99.00, 598, 9, 7, 10),
    ('Metodologias Ageis', 2020, 'Engenharia de Software', 78.00, 215, 14, 7, 10),
    ('Scrum para Equipes de Tecnologia', 2022, 'Gestao de TI', 89.90, 252, 1, 7, 10),
    ('Qualidade e Testes de Software', 2023, 'Engenharia de Software', 109.00, 289, 6, 7, 10),

    # Kassiano Ramos - 3 livros
    ('Ciberseguranca Essencial', 2023, 'Seguranca', 122.00, 326, 11, 8, 11),
    ('Ethical Hacking na Pratica', 2024, 'Seguranca', 145.00, 363, 16, 8, 11),
    ('Fundamentos de Criptografia', 2022, 'Seguranca', 118.50, 400, 3, 8, 11),

    # Rafael Pellizzoni - 3 livros
    ('Computacao em Nuvem', 2022, 'Cloud Computing', 115.00, 437, 8, 9, 12),
    ('AWS para Iniciantes', 2023, 'Cloud Computing', 128.00, 474, 13, 9, 12),
    ('Arquitetura Cloud Moderna', 2025, 'Cloud Computing', 151.00, 511, 18, 9, 12),

    # Luciano Coelho - 3 livros
    ('Algoritmos e Logica de Programacao', 2019, 'Programacao', 72.00, 548, 5, 10, 13),
    ('Estruturas de Dados', 2020, 'Programacao', 88.50, 585, 10, 10, 13),
    ('Algoritmos Avancados', 2023, 'Programacao', 119.90, 202, 15, 10, 13),

    # Patrick Naufel - 2 livros
    ('Desenvolvimento Web Completo', 2022, 'Desenvolvimento Web', 102.00, 239, 2, 11, 14),
    ('JavaScript Moderno', 2024, 'Desenvolvimento Web', 116.00, 276, 7, 11, 14),

    # Sabrina Bet - 2 livros
    ('Gestao de Projetos de TI', 2021, 'Gestao de TI', 96.50, 313, 12, 12, 15),
    ('Governanca de Tecnologia da Informacao', 2023, 'Gestao de TI', 127.00, 350, 17, 12, 15),

    # Lara Croft - 2 livros
    ('Arqueologia de Civilizacoes Perdidas', 2024, 'Arqueologia', 129.90, 428, 12, 13, 18),
    ('Cartografia e Exploracao de Ruinas', 2025, 'Aventura', 115.50, 356, 8, 13, 18),

    # Jill Valentine - 2 livros
    ('Protocolos de Seguranca Biologica', 2023, 'Seguranca', 98.90, 312, 15, 14, 16),
    ('Manual de Sobrevivencia Urbana', 2024, 'Sobrevivencia', 109.00, 284, 10, 14, 16),

    # Ada Wong - 2 livros
    ('Criptografia e Espionagem Moderna', 2024, 'Seguranca', 145.00, 392, 7, 15, 16),
    ('Identidades e Operacoes Secretas', 2025, 'Investigacao', 119.90, 338, 11, 15, 16),

    # Aloy - 2 livros
    ('Ecossistemas de um Mundo Renascido', 2023, 'Ciencia', 132.50, 476, 14, 16, 19),
    ('Maquinas e Tecnologia Ancestral', 2025, 'Tecnologia', 159.90, 524, 6, 16, 19),

    # Ellie Williams - 2 livros
    ('Diarios de Uma Jornada', 2022, 'Aventura', 89.90, 265, 18, 17, 19),
    ('Botanica para Sobreviventes', 2024, 'Botanica', 94.50, 318, 9, 17, 19),

    # Yennefer de Vengerberg - 1 livro
    ('Arte da Magia e Estrategia', 2023, 'Fantasia', 139.90, 448, 13, 18, 20),

    # Arthur Morgan - 1 livro
    ('Memorias da Fronteira', 2021, 'Ficcao Historica', 112.00, 386, 16, 19, 17),

    # Geralt de Rívia - 1 livro
    ('Compendio de Criaturas e Lendas', 2024, 'Fantasia', 149.90, 562, 5, 20, 20),

    # Leon Kennedy - 1 livro
    ('Procedimentos em Crises Urbanas', 2025, 'Seguranca', 125.00, 342, 10, 21, 18),

    # Solid Snake - 1 livro
    ('Taticas de Infiltracao Silenciosa', 2024, 'Estrategia', 135.50, 394, 7, 22, 17);


# 4.4 LEITORES

INSERT INTO leitores (
    nome,
    email,
    cidade,
    data_cadastro,
    idade,
    telefone,
    genero
)
VALUES
    ('Neymar Junior', 'neymar.junior@bibliotecaze.com', 'Santos', '2024-01-10', 25, '(00) 90000-0001', 1),
    ('Lionel Messi', 'lionel.messi@bibliotecaze.com', 'Rosario', '2024-01-15', 32, '(00) 90000-0002', 1),
    ('Cristiano Ronaldo', 'cristiano.ronaldo@bibliotecaze.com', 'Funchal', '2024-01-20', 39, '(00) 90000-0003', 1),
    ('Vinicius Junior', 'vinicius.junior@bibliotecaze.com', 'Rio de Janeiro', '2024-02-05', 46, '(00) 90000-0004', 1),
    ('Rodrygo Goes', 'rodrygo.goes@bibliotecaze.com', 'Osasco', '2024-02-08', 22, '(00) 90000-0005', 1),
    ('Kylian Mbappe', 'kylian.mbappe@bibliotecaze.com', 'Paris', '2024-02-15', 29, '(00) 90000-0006', 1),
    ('Erling Haaland', 'erling.haaland@bibliotecaze.com', 'Leeds', '2024-03-01', 36, '(00) 90000-0007', 1),
    ('Kevin De Bruyne', 'kevin.de.bruyne@bibliotecaze.com', 'Ghent', '2024-03-12', 43, '(00) 90000-0008', 1),
    ('Luka Modric', 'luka.modric@bibliotecaze.com', 'Zadar', '2024-03-18', 19, '(00) 90000-0009', 1),
    ('Robert Lewandowski', 'robert.lewandowski@bibliotecaze.com', 'Warsaw', '2024-04-02', 26, '(00) 90000-0010', 1),
    ('Mohamed Salah', 'mohamed.salah@bibliotecaze.com', 'Cairo', '2024-04-12', 33, '(00) 90000-0011', 1),
    ('Harry Kane', 'harry.kane@bibliotecaze.com', 'London', '2024-04-20', 40, '(00) 90000-0012', 1),
    ('Antoine Griezmann', 'antoine.griezmann@bibliotecaze.com', 'Macon', '2024-05-01', 47, '(00) 90000-0013', 1),
    ('Bruno Fernandes', 'bruno.fernandes@bibliotecaze.com', 'Porto', '2024-05-10', 23, '(00) 90000-0014', 1),
    ('Casemiro', 'casemiro@bibliotecaze.com', 'Sao Jose dos Campos', '2024-05-20', 30, '(00) 90000-0015', 1),
    ('Alisson Becker', 'alisson.becker@bibliotecaze.com', 'Novo Hamburgo', '2024-06-01', 37, '(00) 90000-0016', 1),
    ('Ederson Moraes', 'ederson.moraes@bibliotecaze.com', 'Osasco', '2024-06-10', 44, '(00) 90000-0017', 1),
    ('Marquinhos', 'marquinhos@bibliotecaze.com', 'Sao Paulo', '2024-06-15', 20, '(00) 90000-0018', 1),
    ('Thiago Silva', 'thiago.silva@bibliotecaze.com', 'Rio de Janeiro', '2024-06-21', 27, '(00) 90000-0019', 1),
    ('Gabriel Jesus', 'gabriel.jesus@bibliotecaze.com', 'Sao Paulo', '2024-07-01', 34, '(00) 90000-0020', 1),
    ('Raphinha', 'raphinha@bibliotecaze.com', 'Porto Alegre', '2024-07-10', 41, '(00) 90000-0021', 1),
    ('Paqueta', 'paqueta@bibliotecaze.com', 'Rio de Janeiro', '2024-07-22', 48, '(00) 90000-0022', 1),
    ('Richarlison', 'richarlison@bibliotecaze.com', 'Nova Venecia', '2024-08-01', 24, '(00) 90000-0023', 1),
    ('Endrick', 'endrick@bibliotecaze.com', 'Brasilia', '2024-08-13', 31, '(00) 90000-0024', 1),
    ('Jude Bellingham', 'jude.bellingham@bibliotecaze.com', 'Birmingham', '2024-08-21', 38, '(00) 90000-0025', 1),
    ('Phil Foden', 'phil.foden@bibliotecaze.com', 'Stockport', '2024-09-02', 45, '(00) 90000-0026', 1),
    ('Bukayo Saka', 'bukayo.saka@bibliotecaze.com', 'London', '2024-09-15', 21, '(00) 90000-0027', 1),
    ('Pedri', 'pedri@bibliotecaze.com', 'Tegueste', '2024-09-22', 28, '(00) 90000-0028', 1),
    ('Gavi', 'gavi@bibliotecaze.com', 'Seville', '2024-10-03', 35, '(00) 90000-0029', 1),
    ('Bernardo Silva', 'bernardo.silva@bibliotecaze.com', 'Lisbon', '2024-10-10', 42, '(00) 90000-0030', 1),
    ('Luis Diaz', 'luis.diaz@bibliotecaze.com', 'Barrancas', '2024-10-22', 18, '(00) 90000-0031', 1),
    ('Darwin Nunez', 'darwin.nunez@bibliotecaze.com', 'Artigas', '2024-11-01', 25, '(00) 90000-0032', 1),
    ('Son Heung-min', 'son.heung.min@bibliotecaze.com', 'Chuncheon', '2024-11-10', 32, '(00) 90000-0033', 1),
    ('Virgil van Dijk', 'virgil.van.dijk@bibliotecaze.com', 'Breda', '2024-11-20', 39, '(00) 90000-0034', 1),
    ('Manuel Neuer', 'manuel.neuer@bibliotecaze.com', 'Gelsenkirchen', '2024-12-01', 46, '(00) 90000-0035', 1),
    ('Thomas Muller', 'thomas.muller@bibliotecaze.com', 'Weilheim', '2024-12-05', 22, '(00) 90000-0036', 1),
    ('Joshua Kimmich', 'joshua.kimmich@bibliotecaze.com', 'Rottweil', '2024-12-10', 29, '(00) 90000-0037', 1),
    ('Federico Valverde', 'federico.valverde@bibliotecaze.com', 'Montevideo', '2024-12-15', 36, '(00) 90000-0038', 1),
    ('Lautaro Martinez', 'lautaro.martinez@bibliotecaze.com', 'Bahia Blanca', '2024-12-20', 43, '(00) 90000-0039', 1),
    ('Angel Di Maria', 'angel.di.maria@bibliotecaze.com', 'Rosario', '2024-12-22', 19, '(00) 90000-0040', 1),
    ('Samus Aran', 'samus.aran@bibliotecaze.com', 'Lages', '2025-01-10', 28, '(00) 90000-0041', 2),
    ('Princesa Zelda', 'princesa.zelda@bibliotecaze.com', 'Hyrule', '2025-01-15', 24, '(00) 90000-0042', 2),
    ('Tifa Lockhart', 'tifa.lockhart@bibliotecaze.com', 'Midgar', '2025-02-05', 23, '(00) 90000-0043', 2),
    ('Aerith Gainsborough', 'aerith.gainsborough@bibliotecaze.com', 'Midgar', '2025-02-12', 25, '(00) 90000-0044', 2),
    ('Claire Redfield', 'claire.redfield@bibliotecaze.com', 'Raccoon City', '2025-03-01', 27, '(00) 90000-0045', 2),
    ('Chun-Li', 'chun.li@bibliotecaze.com', 'Hong Kong', '2025-03-18', 31, '(00) 90000-0046', 2),
    ('Bayonetta', 'bayonetta@bibliotecaze.com', 'Vigrid', '2025-04-02', 35, '(00) 90000-0047', 2),
    ('Ciri', 'ciri@bibliotecaze.com', 'Cintra', '2025-04-15', 22, '(00) 90000-0048', 2),
    ('Triss Merigold', 'triss.merigold@bibliotecaze.com', 'Novigrad', '2025-05-03', 30, '(00) 90000-0049', 2),
    ('Senua', 'senua@bibliotecaze.com', 'Orkney', '2025-05-21', 26, '(00) 90000-0050', 2),
    ('Amicia de Rune', 'amicia.de.rune@bibliotecaze.com', 'Aquitania', '2025-06-08', 20, '(00) 90000-0051', 2),
    ('Kassandra', 'kassandra@bibliotecaze.com', 'Esparta', '2025-06-19', 29, '(00) 90000-0052', 2),
    ('Faith Connors', 'faith.connors@bibliotecaze.com', 'Glass', '2025-07-04', 24, '(00) 90000-0053', 2),
    ('Elizabeth Comstock', 'elizabeth.comstock@bibliotecaze.com', 'Columbia', '2025-07-16', 21, '(00) 90000-0054', 2),
    ('Jaina Proudmoore', 'jaina.proudmoore@bibliotecaze.com', 'Theramore', '2025-08-01', 32, '(00) 90000-0055', 2),
    ('Kratos', 'kratos@bibliotecaze.com', 'Esparta', '2025-08-12', 45, '(00) 90000-0056', 1),
    ('Nathan Drake', 'nathan.drake@bibliotecaze.com', 'Nova York', '2025-09-05', 34, '(00) 90000-0057', 1),
    ('Ezio Auditore', 'ezio.auditore@bibliotecaze.com', 'Florença', '2025-09-20', 38, '(00) 90000-0058', 1),
    ('Joel Miller', 'joel.miller@bibliotecaze.com', 'Jackson', '2025-10-07', 42, '(00) 90000-0059', 1),
    ('Link', 'link@bibliotecaze.com', 'Hyrule', '2025-10-22', 22, '(00) 90000-0060', 1);


# 4.5 FUNCIONÁRIOS

INSERT INTO funcionarios (
    nome,
    cargo,
    salario
)
VALUES
    ('Carlos Oliveira', 'Bibliotecario', 4800.00),
    ('Mariana Souza', 'Bibliotecaria', 4750.00),
    ('Pedro Martins', 'Atendente', 3200.00),
    ('Ana Paula Lima', 'Atendente', 3150.00),
    ('Joao Ribeiro', 'Auxiliar', 2800.00),
    ('Camila Ferreira', 'Atendente', 3250.00),
    ('Lucas Mendes', 'Auxiliar', 2900.00),
    ('Beatriz Costa', 'Bibliotecaria', 4600.00),
    ('Fernando Rocha', 'Atendente', 3100.00),
    ('Larissa Alves', 'Auxiliar', 2850.00),
    ('Gustavo Pereira', 'Atendente', 3300.00),
    ('Amanda Rodrigues', 'Auxiliar', 2820.00),
    ('Ricardo Moreira', 'Bibliotecario', 4900.00),
    ('Patricia Gomes', 'Atendente', 3180.00),
    ('Eduardo Castro', 'Auxiliar', 2750.00),
    ('Juliana Martins', 'Gerente', 6500.00),
    ('Marcelo Teixeira', 'Atendente', 3350.00),
    ('Renata Cardoso', 'Bibliotecaria', 4700.00),
    ('Diego Fernandes', 'Auxiliar', 2920.00),
    ('Isabela Moraes', 'Atendente', 3220.00),
    ('Alyx Vance', 'Bibliotecaria', 4650.00),
    ('Morrigan Aensland', 'Atendente', 3350.00),
    ('Clementine', 'Auxiliar', 2950.00),
    ('Princesa Peach', 'Gerente', 6700.00),
    ('Dante Sparda', 'Bibliotecario', 4850.00);


# 4.6 EMPRÉSTIMOS

INSERT INTO emprestimos (
    livro_id,
    leitor_id,
    funcionario_id,
    data_emprestimo,
    data_devolucao,
    status
)
VALUES
    # Janeiro de 2025
    (1, 1, 1, '2025-01-05', '2025-01-12', 'Devolvido'),
    (2, 2, 1, '2025-01-06', '2025-01-14', 'Devolvido'),
    (10, 1, 2, '2025-01-08', '2025-01-18', 'Devolvido'),
    (1, 3, 1, '2025-01-09', '2025-01-16', 'Devolvido'),
    (20, 4, 3, '2025-01-11', '2025-01-21', 'Devolvido'),
    (2, 1, 1, '2025-01-13', '2025-01-20', 'Devolvido'),
    (11, 5, 2, '2025-01-15', '2025-01-25', 'Devolvido'),
    (1, 6, 1, '2025-01-17', '2025-01-26', 'Devolvido'),

    # Fevereiro de 2025
    (30, 2, 4, '2025-02-02', '2025-02-12', 'Devolvido'),
    (3, 1, 1, '2025-02-04', '2025-02-13', 'Devolvido'),
    (10, 7, 2, '2025-02-06', '2025-02-16', 'Devolvido'),
    (15, 8, 3, '2025-02-08', '2025-02-18', 'Devolvido'),
    (1, 2, 1, '2025-02-11', '2025-02-21', 'Devolvido'),
    (25, 1, 5, '2025-02-14', '2025-02-25', 'Devolvido'),
    (2, 4, 2, '2025-02-17', '2025-02-27', 'Devolvido'),
    (40, 9, 6, '2025-02-20', '2025-03-02', 'Devolvido'),

    # Março de 2025
    (1, 1, 1, '2025-03-01', '2025-03-10', 'Devolvido'),
    (10, 3, 2, '2025-03-03', '2025-03-13', 'Devolvido'),
    (4, 2, 1, '2025-03-05', '2025-03-15', 'Devolvido'),
    (20, 10, 4, '2025-03-07', '2025-03-17', 'Devolvido'),
    (11, 1, 2, '2025-03-09', '2025-03-19', 'Devolvido'),
    (1, 5, 1, '2025-03-11', '2025-03-21', 'Devolvido'),
    (32, 4, 7, '2025-03-13', '2025-03-23', 'Devolvido'),
    (2, 2, 3, '2025-03-16', '2025-03-25', 'Devolvido'),
    (10, 1, 1, '2025-03-20', '2025-03-30', 'Devolvido'),

    # Abril de 2025
    (5, 11, 4, '2025-04-01', '2025-04-10', 'Devolvido'),
    (1, 1, 1, '2025-04-03', '2025-04-13', 'Devolvido'),
    (15, 2, 2, '2025-04-05', '2025-04-15', 'Devolvido'),
    (20, 3, 3, '2025-04-07', '2025-04-17', 'Devolvido'),
    (2, 4, 1, '2025-04-09', '2025-04-19', 'Devolvido'),
    (10, 1, 2, '2025-04-11', '2025-04-21', 'Devolvido'),
    (35, 12, 8, '2025-04-13', '2025-04-23', 'Devolvido'),
    (3, 5, 1, '2025-04-16', '2025-04-26', 'Devolvido'),

    # Maio de 2025
    (1, 2, 1, '2025-05-02', '2025-05-12', 'Devolvido'),
    (2, 1, 2, '2025-05-04', '2025-05-14', 'Devolvido'),
    (10, 4, 1, '2025-05-06', '2025-05-16', 'Devolvido'),
    (12, 6, 3, '2025-05-08', '2025-05-18', 'Devolvido'),
    (45, 13, 9, '2025-05-10', '2025-05-20', 'Devolvido'),
    (1, 3, 1, '2025-05-12', '2025-05-22', 'Devolvido'),
    (20, 1, 4, '2025-05-14', '2025-05-24', 'Devolvido'),
    (5, 7, 2, '2025-05-16', '2025-05-26', 'Devolvido'),
    (2, 2, 1, '2025-05-18', '2025-05-28', 'Devolvido'),

    # Junho de 2025
    (1, 1, 1, '2025-06-01', '2025-06-11', 'Devolvido'),
    (10, 2, 2, '2025-06-03', '2025-06-13', 'Devolvido'),
    (15, 3, 3, '2025-06-05', '2025-06-15', 'Devolvido'),
    (22, 14, 10, '2025-06-07', '2025-06-17', 'Devolvido'),
    (2, 5, 1, '2025-06-09', '2025-06-19', 'Devolvido'),
    (30, 4, 4, '2025-06-11', '2025-06-21', 'Devolvido'),
    (11, 1, 2, '2025-06-13', '2025-06-23', 'Devolvido'),
    (1, 8, 1, '2025-06-15', '2025-06-25', 'Devolvido'),

    # Julho de 2025
    (4, 1, 1, '2025-07-01', '2025-07-11', 'Devolvido'),
    (1, 2, 2, '2025-07-03', '2025-07-13', 'Devolvido'),
    (10, 3, 1, '2025-07-05', '2025-07-15', 'Devolvido'),
    (20, 4, 3, '2025-07-07', '2025-07-17', 'Devolvido'),
    (2, 1, 1, '2025-07-09', '2025-07-19', 'Devolvido'),
    (38, 15, 11, '2025-07-11', '2025-07-21', 'Devolvido'),
    (15, 5, 2, '2025-07-13', '2025-07-23', 'Devolvido'),
    (1, 6, 1, '2025-07-15', '2025-07-25', 'Devolvido'),
    (5, 2, 4, '2025-07-17', '2025-07-27', 'Devolvido'),

    # Agosto de 2025
    (1, 1, 1, '2025-08-01', '2025-08-11', 'Devolvido'),
    (10, 2, 2, '2025-08-03', '2025-08-13', 'Devolvido'),
    (12, 3, 3, '2025-08-05', '2025-08-15', 'Devolvido'),
    (2, 4, 1, '2025-08-07', '2025-08-17', 'Devolvido'),
    (25, 16, 12, '2025-08-09', '2025-08-19', 'Devolvido'),
    (1, 5, 1, '2025-08-11', '2025-08-21', 'Devolvido'),
    (20, 1, 2, '2025-08-13', '2025-08-23', 'Devolvido'),
    (40, 17, 13, '2025-08-15', '2025-08-25', 'Devolvido'),

    # Setembro de 2025
    (3, 2, 1, '2025-09-01', '2025-09-11', 'Devolvido'),
    (1, 1, 1, '2025-09-03', '2025-09-13', 'Devolvido'),
    (10, 4, 2, '2025-09-05', '2025-09-15', 'Devolvido'),
    (11, 3, 3, '2025-09-07', '2025-09-17', 'Devolvido'),
    (2, 5, 1, '2025-09-09', '2025-09-19', 'Devolvido'),
    (48, 18, 14, '2025-09-11', '2025-09-21', 'Devolvido'),
    (1, 2, 2, '2025-09-13', '2025-09-23', 'Devolvido'),
    (30, 1, 4, '2025-09-15', '2025-09-25', 'Devolvido'),

    # Outubro de 2025
    (1, 1, 1, '2025-10-01', '2025-10-11', 'Devolvido'),
    (2, 2, 2, '2025-10-03', '2025-10-13', 'Devolvido'),
    (10, 3, 1, '2025-10-05', '2025-10-15', 'Devolvido'),
    (15, 4, 3, '2025-10-07', '2025-10-17', 'Devolvido'),
    (20, 5, 4, '2025-10-09', '2025-10-19', 'Devolvido'),
    (32, 19, 15, '2025-10-11', '2025-10-21', 'Devolvido'),
    (1, 6, 1, '2025-10-13', '2025-10-23', 'Devolvido'),
    (10, 1, 2, '2025-10-15', '2025-10-25', 'Devolvido'),

    # Novembro de 2025
    (5, 2, 1, '2025-11-01', '2025-11-11', 'Devolvido'),
    (1, 1, 1, '2025-11-03', '2025-11-13', 'Devolvido'),
    (2, 3, 2, '2025-11-05', '2025-11-15', 'Devolvido'),
    (10, 4, 3, '2025-11-07', '2025-11-17', 'Devolvido'),
    (25, 20, 16, '2025-11-09', '2025-11-19', 'Devolvido'),
    (1, 5, 1, '2025-11-11', '2025-11-21', 'Devolvido'),
    (11, 1, 2, '2025-11-13', '2025-11-23', 'Devolvido'),
    (42, 21, 17, '2025-11-15', '2025-11-25', 'Devolvido'),

    # Dezembro de 2025
    (1, 1, 1, '2025-12-01', '2025-12-11', 'Devolvido'),
    (2, 2, 2, '2025-12-03', '2025-12-13', 'Devolvido'),
    (10, 3, 1, '2025-12-05', '2025-12-15', 'Devolvido'),
    (15, 4, 3, '2025-12-07', '2025-12-17', 'Devolvido'),
    (20, 5, 4, '2025-12-09', '2025-12-19', 'Devolvido'),
    (50, 22, 18, '2025-12-11', '2025-12-21', 'Devolvido'),
    (3, 1, 1, '2025-12-13', '2025-12-23', 'Devolvido'),
    (12, 6, 2, '2025-12-15', '2025-12-26', 'Devolvido'),

    # Janeiro de 2026 - Ainda não devolvidos
    (1, 2, 1, '2026-01-05', NULL, 'Emprestado'),
    (10, 1, 2, '2026-01-06', NULL, 'Emprestado'),
    (35, 7, 5, '2026-01-07', NULL, 'Emprestado'),
    (2, 3, 1, '2026-01-08', NULL, 'Emprestado'),

    # Junho de 2026
    (51, 41, 21, '2026-06-02', '2026-06-12', 'Devolvido'),
    (52, 42, 22, '2026-06-04', '2026-06-14', 'Devolvido'),
    (53, 1, 23, '2026-06-06', '2026-06-17', 'Devolvido'),
    (54, 56, 24, '2026-06-09', '2026-06-19', 'Devolvido'),

    # Julho de 2026
    (55, 43, 25, '2026-07-02', '2026-07-12', 'Devolvido'),
    (56, 44, 21, '2026-07-05', '2026-07-15', 'Devolvido'),
    (57, 45, 22, '2026-07-08', '2026-07-19', 'Devolvido'),
    (58, 2, 23, '2026-07-12', '2026-07-22', 'Devolvido'),

    # Agosto de 2026
    (59, 46, 24, '2026-08-01', '2026-08-11', 'Devolvido'),
    (60, 47, 25, '2026-08-04', '2026-08-14', 'Devolvido'),
    (61, 48, 21, '2026-08-07', '2026-08-17', 'Devolvido'),
    (62, 57, 22, '2026-08-10', '2026-08-21', 'Devolvido'),

    # Setembro de 2026
    (63, 49, 23, '2026-09-02', '2026-09-12', 'Devolvido'),
    (64, 50, 24, '2026-09-05', '2026-09-15', 'Devolvido'),
    (65, 51, 25, '2026-09-08', '2026-09-18', 'Devolvido'),
    (1, 3, 21, '2026-09-11', '2026-09-21', 'Devolvido'),

    # Novembro de 2026 - Ainda não devolvidos
    (2, 52, 22, '2026-11-03', NULL, 'Emprestado'),
    (10, 53, 23, '2026-11-05', NULL, 'Emprestado'),
    (51, 54, 24, '2026-11-07', NULL, 'Emprestado'),
    (65, 5, 25, '2026-11-09', NULL, 'Emprestado');


# 4.7 RESERVAS

INSERT INTO reservas (
    leitor_id,
    livro_id,
    funcionario_id,
    data_reserva,
    data_validade,
    data_atendimento,
    status
)
VALUES
    # Março de 2026
    (41, 51, 21, '2026-03-02', '2026-03-09', '2026-03-05', 'Atendida'),
    (42, 52, 22, '2026-03-05', '2026-03-12', '2026-03-08', 'Atendida'),
    (43, 53, 23, '2026-03-09', '2026-03-16', '2026-03-11', 'Atendida'),
    (44, 54, 24, '2026-03-12', '2026-03-19', NULL, 'Cancelada'),
    (45, 55, 25, '2026-03-16', '2026-03-23', '2026-03-18', 'Atendida'),
    (46, 56, 21, '2026-03-20', '2026-03-27', '2026-03-24', 'Atendida'),

    # Abril de 2026
    (47, 57, 22, '2026-04-01', '2026-04-08', '2026-04-03', 'Atendida'),
    (48, 58, 23, '2026-04-04', '2026-04-11', NULL, 'Cancelada'),
    (49, 59, 24, '2026-04-08', '2026-04-15', '2026-04-10', 'Atendida'),
    (50, 60, 25, '2026-04-12', '2026-04-19', '2026-04-16', 'Atendida'),
    (51, 61, 21, '2026-04-17', '2026-04-24', '2026-04-20', 'Atendida'),
    (52, 62, 22, '2026-04-23', '2026-04-30', NULL, 'Cancelada'),

    # Maio de 2026
    (53, 63, 23, '2026-05-01', '2026-05-08', '2026-05-05', 'Atendida'),
    (54, 64, 24, '2026-05-05', '2026-05-12', '2026-05-08', 'Atendida'),
    (55, 65, 25, '2026-05-09', '2026-05-16', '2026-05-13', 'Atendida'),
    (56, 1, 21, '2026-05-14', '2026-05-21', NULL, 'Cancelada'),
    (57, 2, 22, '2026-05-19', '2026-05-26', '2026-05-22', 'Atendida'),
    (58, 10, 23, '2026-05-23', '2026-05-30', '2026-05-27', 'Atendida'),

    # Junho de 2026
    (59, 20, 24, '2026-06-01', '2026-06-08', '2026-06-04', 'Atendida'),
    (60, 30, 25, '2026-06-06', '2026-06-13', NULL, 'Cancelada'),
    (1, 40, 21, '2026-06-11', '2026-06-18', '2026-06-15', 'Atendida'),
    (2, 50, 22, '2026-06-15', '2026-06-22', '2026-06-18', 'Atendida'),
    (3, 51, 23, '2026-06-19', '2026-06-26', '2026-06-23', 'Atendida'),
    (4, 52, 24, '2026-06-24', '2026-07-01', '2026-06-27', 'Atendida'),

    # Novembro de 2026 - Reservas pendentes
    (41, 53, 21, '2026-11-04', '2026-11-11', NULL, 'Pendente'),
    (43, 54, 22, '2026-11-05', '2026-11-12', NULL, 'Pendente'),
    (45, 55, 23, '2026-11-06', '2026-11-13', NULL, 'Pendente'),
    (47, 56, 24, '2026-11-07', '2026-11-14', NULL, 'Pendente'),
    (49, 57, 25, '2026-11-08', '2026-11-15', NULL, 'Pendente'),
    (51, 58, 21, '2026-11-09', '2026-11-16', NULL, 'Pendente');


# 4.8 PAGAMENTOS

INSERT INTO pagamentos (
    valor_cobrado,
    desconto,
    forma_pagamento,
    data_pagamento,
    emprestimo_id
)
VALUES
    # Junho de 2026
    (25.00, 0.00, 'PIX', '2026-06-02', 104),
    (30.00, 5.00, 'Cartao de Credito', '2026-06-04', 105),
    (18.50, 0.00, 'Dinheiro', '2026-06-06', 106),
    (35.00, 7.00, 'Cartao de Debito', '2026-06-09', 107),

    # Julho de 2026
    (22.00, 2.00, 'PIX', '2026-07-02', 108),
    (28.00, 0.00, 'Cartao de Credito', '2026-07-05', 109),
    (32.50, 5.00, 'PIX', '2026-07-08', 110),
    (20.00, 0.00, 'Dinheiro', '2026-07-12', 111),

    # Agosto de 2026
    (27.00, 3.00, 'Cartao de Debito', '2026-08-01', 112),
    (40.00, 8.00, 'PIX', '2026-08-04', 113),
    (24.50, 0.00, 'Dinheiro', '2026-08-07', 114),
    (33.00, 3.00, 'Cartao de Credito', '2026-08-10', 115),

    # Setembro de 2026
    (29.90, 4.90, 'PIX', '2026-09-02', 116),
    (26.00, 0.00, 'Cartao de Debito', '2026-09-05', 117),
    (38.00, 8.00, 'PIX', '2026-09-08', 118);