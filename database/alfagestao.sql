CREATE DATABASE alfagestao;
USE alfagestao;

CREATE TABLE ft (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_cliente int(11),
    moeda VARCHAR(128),
    regularizada BOOLEAN,
    pais VARCHAR(128),
    ncont VARCHAR(128),
    morada VARCHAR(512),
    localidade VARCHAR(128),
    cod_postal VARCHAR(128),
    cond_pagamento INT(11),
    data_vencimento DATETIME DEFAULT NULL,
    id_vendedor INT(11),
    desconto DECIMAL(5, 2),
    mot_isencao INT(11),
    mot_anulacao VARCHAR(512),
    estab INT(11),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE fi (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_fatura INT(11),
    id_artigo INT(11),
    qtty DECIMAL(10, 2),
    preco_unidade DECIMAL(10, 2),
    preco_total DECIMAL(10, 2),
    desconto DECIMAL(5, 2),
    iva DECIMAL(5, 2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE st (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    ref VARCHAR(128),
    familia INT(11),
    designacao VARCHAR(512),
    descricao TEXT,
    url VARCHAR(512),
    stock DECIMAL(10, 2),
    cod_barras VARCHAR(128),
    unidade VARCHAR(128),
    marca VARCHAR(128),
    modelo VARCHAR(128),
    suj_irs BOOLEAN,
    preco_venda DECIMAL(10, 2),
    tab_iva INT(11),
    mot_isencao INT(11),
    ativo BOOLEAN,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE cl (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(512),
    estab INT(11),
    ncont VARCHAR(128),
    morada VARCHAR(512),
    localidade VARCHAR(128),
    cod_postal VARCHAR(128),
    telefone VARCHAR(128),
    telemovel VARCHAR(128),
    email VARCHAR(128),
    ativo BOOLEAN,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE fl (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(512),
    estab INT(11),
    ncont VARCHAR(128),
    morada VARCHAR(512),
    localidade VARCHAR(128),
    cod_postal VARCHAR(128),
    telefone VARCHAR(128),
    telemovel VARCHAR(128),
    email VARCHAR(128),
    ativo BOOLEAN,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE us (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(512),
    username VARCHAR(128),
    password VARCHAR(512),
    email VARCHAR(128),
    is_admin BOOLEAN,
    grupo VARCHAR(128),
    departamento VARCHAR(128),
    avatar VARCHAR(512),
    ativo BOOLEAN,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE bo (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_tipo_dossier INT(11),
    nome VARCHAR(512),
    estab INT(11),
    morada VARCHAR(512),
    localidade VARCHAR(128),
    cod_postal VARCHAR(128),
    ncont VARCHAR(128),
    total DECIMAL(10, 2),
    tipo VARCHAR(128),
    id_vendedor INT(11),
);

CREATE TABLE bi (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_dossier INT(11),
    id_artigo INT(11),
    designacao VARCHAR(512),
    qtty DECIMAL(10, 2),
    preco_unidade DECIMAL(10, 2),
    preco_total DECIMAL(10, 2),
    desconto DECIMAL(5, 2),
    iva DECIMAL(5, 2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ts (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nome_dossier VARCHAR(128),
    bdempresas VARCHAR(128),
    preco_desc VARCHAR(128)
);

CREATE TABLE e1 (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(512),
    nome_abr VARCHAR(128),
    morada VARCHAR(512),
    localidade VARCHAR(128),
    cod_postal VARCHAR(128),
    ncont VARCHAR(128),
    cae VARCHAR(128),
    capsocial DECIMAL(10, 2),
    freguesia VARCHAR(128),
    concelho VARCHAR(128),
    distrito VARCHAR(128),
    telefone VARCHAR(128),
    telemovel VARCHAR(128),
    fax VARCHAR(128),
    ncontss VARCHAR(128),
    contacto VARCHAR(128),
    contacto_cargo VARCHAR(128),
    bic VARCHAR(128),
    iban VARCHAR(128),
    idcredorsepa VARCHAR(128),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);