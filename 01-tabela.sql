-- ===========================================================
--  BANCO DE DADOS: FRIEND DOG PET SHOP
--  Compatível com PostgreSQL (PGAdmin)
-- ===========================================================

-- Criar o banco de dados (opcional)
-- CREATE DATABASE frienddog;
-- \c frienddog;

-- ===========================================================
--                TABELA CLIENTE
-- ===========================================================
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(255)
);

-- ===========================================================
--                TABELA PET
-- ===========================================================
CREATE TABLE pet (
    id_pet SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- ===========================================================
--                TABELA FUNCIONARIO
-- ===========================================================
CREATE TABLE funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50)
);

-- ===========================================================
--                TABELA SERVICO
-- ===========================================================
CREATE TABLE servico (
    id_servico SERIAL PRIMARY KEY,
    nome_servico VARCHAR(100) NOT NULL,
    preco_base DECIMAL(10,2) NOT NULL
);

-- ===========================================================
--                TABELA ATENDIMENTO
-- ===========================================================
CREATE TABLE atendimento (
    id_atendimento SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    id_pet INT NOT NULL,
    id_servico INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- ===========================================================
--                TABELA VENDA
-- ===========================================================
CREATE TABLE venda (
    id_venda SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- ===========================================================
--                TABELA PRODUTO
-- (Necessária para ITEMVENDA funcionar)
-- ===========================================================
CREATE TABLE produto (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- ===========================================================
--                TABELA ITEMVENDA
--   (Relacionamento N:N entre VENDA e PRODUTO)
-- ===========================================================
CREATE TABLE itemvenda (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- ===========================================================
--   INSERTS DE TESTE (opcional – para rodar no PGAdmin)
-- ===========================================================

-- CLIENTES
INSERT INTO cliente (nome, telefone, email, endereco) VALUES
('Lucas Andrade', '1199999-0000', 'lucas@email.com', 'Rua A, 123'),
('Maria Silva', '1188888-1111', 'maria@email.com', 'Rua B, 456');

-- PETS
INSERT INTO pet (nome, especie, raca, idade, id_cliente) VALUES
('Rex', 'Cachorro', 'Labrador', 5, 1),
('Mia', 'Gato', 'Persa', 3, 2);

-- FUNCIONÁRIOS
INSERT INTO funcionario (nome, cargo) VALUES
('João Pereira', 'Atendente'),
('Ana Costa', 'Veterinária');

-- SERVIÇOS
INSERT INTO servico (nome_servico, preco_base) VALUES
('Banho', 50.00),
('Tosa', 70.00);

-- ATENDIMENTO
INSERT INTO atendimento (data, hora, id_pet, id_servico, id_funcionario) VALUES
('2025-01-10', '10:00', 1, 1, 1),
('2025-01-10', '11:00', 2, 2, 2);

-- PRODUTOS
INSERT INTO produto (nome_produto, preco) VALUES
('Ração Premium 2kg', 35.00),
('Coleira Nylon', 20.00);

-- VENDA
INSERT INTO venda (data, id_cliente, id_funcionario) VALUES
('2025-01-10', 1, 1);

-- ITEMVENDA
INSERT INTO itemvenda (id_venda, id_produto, quantidade) VALUES
(1, 1, 1),
(1, 2, 2);

-- ===========================================================
--              FIM DO SCRIPT
-- ===========================================================
