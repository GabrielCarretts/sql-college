DROP DATABASE IF EXISTS atividade_12;
CREATE DATABASE atividade_12;
USE atividade_12;


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


