CREATE DATABASE IF NOT EXISTS db_farmacia;

USE db_farmacia;

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome_completo VARCHAR(255),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE IF NOT EXISTS telefone_cliente (
	id_telefone_cliente INT NOT NULL AUTO_INCREMENT,
    telefone_celular VARCHAR(14) NOT NULL,
    telefone_residencial VARCHAR(14) ,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_telefone_cliente),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE IF NOT EXISTS endereco_cliente (
	id_endereco_cliente INT NOT NULL AUTO_INCREMENT,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    bairro VARCHAR(255),
    cidade VARCHAR(45) NOT NULL,
    estado CHAR(2) NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_endereco_cliente),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE IF NOT EXISTS funcionarios (
	id_funcionarios INT NOT NULL AUTO_INCREMENT,
    nome_completo VARCHAR(255),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id_funcionarios)
);

CREATE TABLE IF NOT EXISTS telefone_funcionarios (
	id_telefone_funcionario INT NOT NULL AUTO_INCREMENT,
    telefone_celular VARCHAR(14) NOT NULL,
    telefone_residencial VARCHAR(14) ,
    id_funcionarios INT NOT NULL,
    PRIMARY KEY (id_telefone_funcionario),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios (id_funcionarios)
);

CREATE TABLE IF NOT EXISTS endereco_funcionario (
	id_endereco_funcionario INT NOT NULL AUTO_INCREMENT,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    bairro VARCHAR(255),
    cidade VARCHAR(45) NOT NULL,
    estado CHAR(2) NOT NULL,
    id_funcionarios INT NOT NULL,
    PRIMARY KEY (id_endereco_funcionario),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios (id_funcionarios)
);

CREATE TABLE IF NOT EXISTS venda (
	id_venda INT NOT NULL AUTO_INCREMENT,
    data_hora_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento ENUM('Dinheiro', 'Pix', 'Cartão') NOT NULL,
    valor_total DECIMAL(10,2),
    id_cliente INT NOT NULL,
    id_funcionarios INT NOT NULL,
    PRIMARY KEY (id_venda),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios (id_funcionarios)
);

CREATE TABLE IF NOT EXISTS produto (
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    quantidade_estoque INT NOT NULL,
    PRIMARY KEY (id_produto)
);

CREATE TABLE IF NOT EXISTS item_venda (
	id_item_venda INT NOT NULL AUTO_INCREMENT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    id_venda INT NOT NULL,
    id_cliente INT NOT NULL,
    id_funcionarios INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_item_venda),
    FOREIGN KEY (id_venda) REFERENCES venda (id_venda),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios (id_funcionarios),
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);


INSERT INTO cliente (nome_completo, cpf, data_nascimento, email) VALUES
('Ana Silva', '336.832.315-12', '1980-09-23', 'ana.silva1@email.com'),
('Bruno Oliveira', '259.269.102-71', '1979-05-08', 'bruno.oliveira2@email.com'),
('Carla Santos', '969.527.805-80', '1987-11-23', 'carla.santos3@email.com'),
('Diego Souza', '569.359.235-53', '1979-02-22', 'diego.souza4@email.com'),
('Elena Lima', '878.270.963-70', '2002-05-17', 'elena.lima5@email.com'),
('Felipe Rocha', '258.906.254-70', '2002-11-05', 'felipe.rocha6@email.com'),
('Gabriela Alves', '657.339.148-88', '1967-06-12', 'gabriela.alves7@email.com'),
('Henrique Ferreira', '322.645.419-12', '1992-11-21', 'henrique.ferreira8@email.com'),
('Isabela Costa', '913.129.629-89', '1965-07-24', 'isabela.costa9@email.com'),
('João Pereira', '988.404.653-98', '1967-03-02', 'joao.pereira10@email.com'),
('Karina Gomes', '903.400.600-18', '2001-02-22', 'karina.gomes11@email.com'),
('Lucas Martins', '437.481.818-13', '1968-12-08', 'lucas.martins12@email.com'),
('Mariana Barbosa', '408.400.708-55', '1987-02-20', 'mariana.barbosa13@email.com'),
('Natan Ribeiro', '353.977.423-95', '1965-11-01', 'natan.ribeiro14@email.com'),
('Olivia Castro', '358.186.301-23', '1975-03-07', 'olivia.castro15@email.com'),
('Paulo Rodrigues', '868.367.768-69', '1974-10-26', 'paulo.rodrigues16@email.com'),
('Amanda Carvalho', '964.996.890-47', '1972-10-17', 'amanda.carvalho17@email.com'),
('Rafael Mendes', '258.209.937-94', '1988-04-26', 'rafael.mendes18@email.com'),
('Sofia Cardoso', '964.261.373-72', '1980-02-06', 'sofia.cardoso19@email.com'),
('Thiago Araujo', '986.908.500-42', '1994-01-20', 'thiago.araujo20@email.com'),
('Vanessa Ramos', '439.810.891-44', '1999-06-18', 'vanessa.ramos21@email.com'),
('Gabriel Fernandes', '735.820.288-75', '1983-01-05', 'gabriel.fernandes22@email.com'),
('Beatriz Teixeira', '381.781.139-78', '1978-07-23', 'beatriz.teixeira23@email.com'),
('Rodrigo Correia', '445.685.761-58', '1976-11-10', 'rodrigo.correia24@email.com'),
('Camila Cavalcante', '402.807.256-52', '1994-02-27', 'camila.cavalcante25@email.com'),
('Daniel Dias', '814.593.665-44', '1966-04-10', 'daniel.dias26@email.com'),
('Larissa Moreira', '533.357.815-61', '1971-02-25', 'larissa.moreira27@email.com'),
('Vinicius Freitas', '988.255.223-33', '1974-09-07', 'vinicius.freitas28@email.com'),
('Aline Cunha', '567.345.279-52', '1999-01-12', 'aline.cunha29@email.com'),
('Eduardo Machado', '352.179.628-11', '1985-01-23', 'eduardo.machado30@email.com');


INSERT INTO telefone_cliente (telefone_celular, telefone_residencial, id_cliente) VALUES
('(81)92885-4298', '(81)2938-5683', 1),
('(31)92454-7210', '(31)2128-5609', 2),
('(61)98053-5167', NULL, 3),
('(27)95323-4188', '(27)2750-9301', 4),
('(19)98314-6375', '(19)2858-3008', 5),
('(51)94456-5252', NULL, 6),
('(81)91956-5804', '(81)2945-2745', 7),
('(11)94070-3717', '(11)3086-9098', 8),
('(91)99713-3304', NULL, 9),
('(71)96339-5995', '(71)2279-5981', 10),
('(91)92656-3883', '(91)3056-3904', 11),
('(51)99372-2500', NULL, 12),
('(61)95130-3047', '(61)2558-7321', 13),
('(31)99483-5639', '(31)2849-7602', 14),
('(51)91200-8351', NULL, 15),
('(41)95100-4571', '(41)2113-6391', 16),
('(21)92171-3236', '(21)3810-1163', 17),
('(11)95462-8564', NULL, 18),
('(71)97309-1543', '(71)2845-9075', 19),
('(21)91311-6996', '(21)3258-2170', 20),
('(27)94008-8325', NULL, 21),
('(51)99836-8504', '(51)3767-7387', 22),
('(48)93709-2171', '(48)3905-3664', 23),
('(51)95650-8410', NULL, 24),
('(21)96117-5182', '(21)3255-2528', 25),
('(51)96781-1066', '(51)3687-5192', 26),
('(41)99800-6951', NULL, 27),
('(41)92858-5531', '(41)3670-8208', 28),
('(71)96733-3122', '(71)2681-8843', 29),
('(91)92302-8463', NULL, 30);


INSERT INTO endereco_cliente (cep, logradouro, bairro, cidade, estado, id_cliente) VALUES
('82416-388', 'Rua das Flores, 1429', 'Vila Nova', 'Campinas', 'SP', 1),
('13481-791', 'Avenida Paulista, 1046', 'Botafogo', 'Salvador', 'BA', 2),
('80377-698', 'Rua das Palmeiras, 170', 'Botafogo', 'Fortaleza', 'CE', 3),
('88316-451', 'Avenida Brasil, 798', 'Copacabana', 'Rio de Janeiro', 'RJ', 4),
('24398-961', 'Rua Sete de Setembro, 534', 'Mocambinho', 'Belo Horizonte', 'MG', 5),
('54704-749', 'Rua XV de Novembro, 414', 'Moema', 'São Paulo', 'SP', 6),
('35477-195', 'Avenida Rio Branco, 308', 'Botafogo', 'Campinas', 'SP', 7),
('82866-668', 'Rua Amazonas, 1348', 'Centro', 'Salvador', 'BA', 8),
('86200-229', 'Avenida São João, 309', 'Bela Vista', 'Porto Alegre', 'RS', 9),
('96260-703', 'Rua Bahia, 742', 'Botafogo', 'Salvador', 'BA', 10),
('78965-486', 'Avenida Getúlio Vargas, 847', 'Copacabana', 'Belo Horizonte', 'MG', 11),
('82744-496', 'Rua Tiradentes, 353', 'Botafogo', 'Salvador', 'BA', 12),
('64539-837', 'Rua Bela Vista, 517', 'Centro', 'Salvador', 'BA', 13),
('71189-754', 'Avenida Central, 984', 'Bela Vista', 'Belo Horizonte', 'MG', 14),
('55022-553', 'Rua dos Pinheiros, 1047', 'Tatuapé', 'Salvador', 'BA', 15),
('48744-175', 'Rua Castro Alves, 1006', 'Moema', 'Salvador', 'BA', 16),
('78745-297', 'Avenida Atlântica, 54', 'Tatuapé', 'Porto Alegre', 'RS', 17),
('98866-307', 'Rua Marechal Deodoro, 693', 'Tatuapé', 'Porto Alegre', 'RS', 18),
('54920-528', 'Rua Dom Pedro II, 1282', 'Moema', 'Belo Horizonte', 'MG', 19),
('12678-775', 'Avenida Liberdade, 1011', 'Mocambinho', 'Salvador', 'BA', 20),
('21163-669', 'Rua Santo Antônio, 701', 'Botafogo', 'Curitiba', 'PR', 21),
('12695-387', 'Rua São José, 1441', 'Jardins', 'Campinas', 'SP', 22),
('14120-817', 'Avenida Rebouças, 846', 'Tatuapé', 'Recife', 'PE', 23),
('88443-542', 'Rua Pará, 959', 'Copacabana', 'Recife', 'PE', 24),
('67560-574', 'Avenida Ipiranga, 1294', 'Jardins', 'São Paulo', 'SP', 25),
('55235-974', 'Rua Minas Gerais, 1126', 'Botafogo', 'Recife', 'PE', 26),
('18167-449', 'Rua São Paulo, 341', 'Mocambinho', 'Fortaleza', 'CE', 27),
('49605-971', 'Avenida Brigadeiro Faria Lima, 816', 'Botafogo', 'Curitiba', 'PR', 28),
('97361-687', 'Rua Goiás, 1182', 'Pinheiros', 'Curitiba', 'PR', 29),
('44357-222', 'Rua Paraná, 1056', 'Pinheiros', 'Porto Alegre', 'RS', 30);


INSERT INTO funcionarios (nome_completo, cpf, data_nascimento, email) VALUES
('Carlos Eduardo Souza', '918.421.249-13', '1999-04-17', 'carlos.souza.farmacia@email.com'),
('Fernanda Lima Silva', '656.791.629-21', '1987-07-04', 'fernanda.silva.farmacia@email.com'),
('Roberto Alves Costa', '195.613.616-89', '1997-07-25', 'roberto.costa.farmacia@email.com'),
('Patricia Gomez Santos', '171.262.444-60', '1975-03-02', 'patricia.santos.farmacia@email.com'),
('Marcelo Oliveira Rocha', '544.523.982-57', '1979-07-02', 'marcelo.rocha.farmacia@email.com'),
('Camila Pereira Lima', '153.208.671-20', '1975-03-01', 'camila.lima.farmacia@email.com'),
('Renato Castro Martins', '317.722.190-38', '1999-11-06', 'renato.martins.farmacia@email.com'),
('Juliana Barbosa Ferreira', '383.728.559-14', '1996-11-12', 'juliana.ferreira.farmacia@email.com'),
('Andre Luis Ribeiro', '243.652.644-75', '1989-01-05', 'andre.ribeiro.farmacia@email.com'),
('Beatriz Santos Almeida', '844.386.679-39', '1994-05-23', 'beatriz.almeida.farmacia@email.com');


INSERT INTO telefone_funcionarios (telefone_celular, telefone_residencial, id_funcionarios) VALUES
('(51)91430-7057', NULL, 1),
('(11)95025-2140', '(11)2136-1943', 2),
('(71)98471-8971', NULL, 3),
('(91)93796-7498', '(91)2071-2233', 4),
('(51)95261-3798', NULL, 5),
('(81)98180-1039', '(81)3097-2883', 6),
('(21)98555-2364', NULL, 7),
('(71)93235-4123', '(71)3685-9206', 8),
('(71)96375-2136', NULL, 9),
('(71)99121-4384', '(71)2540-5644', 10);


INSERT INTO endereco_funcionario (cep, logradouro, bairro, cidade, estado, id_funcionarios) VALUES
('83778-935', 'Rua dos Funcionários, 427', 'Jardins', 'Salvador', 'BA', 1),
('54494-819', 'Rua dos Funcionários, 343', 'Centro', 'Rio de Janeiro', 'RJ', 2),
('61467-305', 'Rua dos Funcionários, 160', 'Jardins', 'Porto Alegre', 'RS', 3),
('94679-225', 'Rua dos Funcionários, 415', 'Botafogo', 'Recife', 'PE', 4),
('38344-271', 'Rua dos Funcionários, 322', 'Vila Nova', 'Porto Alegre', 'RS', 5),
('97486-447', 'Rua dos Funcionários, 28', 'Bela Vista', 'Curitiba', 'PR', 6),
('43144-649', 'Rua dos Funcionários, 118', 'Pinheiros', 'Rio de Janeiro', 'RJ', 7),
('46168-713', 'Rua dos Funcionários, 281', 'Pinheiros', 'Recife', 'PE', 8),
('39840-869', 'Rua dos Funcionários, 423', 'Vila Nova', 'São Paulo', 'SP', 9),
('95252-439', 'Rua dos Funcionários, 18', 'Bela Vista', 'Belo Horizonte', 'MG', 10);


INSERT INTO venda (data_hora_venda, forma_pagamento, valor_total, id_cliente, id_funcionarios) VALUES
('2026-06-13 21:28:00', 'Cartão', 221.19, 24, 8),
('2026-07-16 19:36:00', 'Dinheiro', 68.96, 29, 9),
('2026-04-19 08:22:00', 'Cartão', 35.95, 3, 6),
('2026-01-14 14:29:00', 'Pix', 89.48, 28, 5),
('2026-06-02 15:16:00', 'Dinheiro', 78.56, 21, 1),
('2026-06-28 11:28:00', 'Dinheiro', 210.81, 11, 2),
('2026-03-18 13:33:00', 'Pix', 221.08, 27, 1),
('2026-06-23 21:09:00', 'Dinheiro', 149.51, 2, 4),
('2026-08-13 18:01:00', 'Cartão', 220.68, 25, 5),
('2026-05-12 09:50:00', 'Cartão', 106.25, 30, 9),
('2026-01-25 08:54:00', 'Pix', 274.74, 23, 4),
('2026-02-01 21:24:00', 'Cartão', 167.26, 19, 5),
('2026-08-07 21:05:00', 'Pix', 275.49, 29, 5),
('2026-07-16 12:26:00', 'Dinheiro', 87.39, 20, 1),
('2026-01-18 12:10:00', 'Cartão', 232.22, 11, 10),
('2026-09-04 10:47:00', 'Cartão', 99.41, 10, 2),
('2026-03-30 15:27:00', 'Pix', 198.21, 4, 10),
('2026-03-14 10:24:00', 'Pix', 262.77, 11, 10),
('2026-01-17 19:38:00', 'Pix', 108.96, 13, 6),
('2026-01-05 08:23:00', 'Pix', 218.73, 10, 2),
('2026-02-08 17:17:00', 'Pix', 130.64, 2, 2),
('2026-08-16 19:12:00', 'Cartão', 39.92, 7, 10),
('2026-09-05 11:00:00', 'Cartão', 48.38, 7, 4),
('2026-05-04 14:20:00', 'Dinheiro', 51.92, 9, 2),
('2026-06-07 20:18:00', 'Cartão', 109.01, 3, 4),
('2026-06-21 08:14:00', 'Pix', 270.49, 10, 4),
('2026-08-27 15:24:00', 'Cartão', 108.10, 9, 6),
('2026-01-17 16:42:00', 'Cartão', 279.89, 9, 3),
('2026-01-14 13:19:00', 'Cartão', 48.60, 30, 5),
('2026-08-05 21:50:00', 'Dinheiro', 225.91, 10, 8),
('2026-05-04 10:03:00', 'Dinheiro', 72.73, 14, 5),
('2026-06-09 12:11:00', 'Dinheiro', 119.72, 22, 10),
('2026-05-29 14:33:00', 'Cartão', 127.18, 9, 5),
('2026-03-16 10:34:00', 'Dinheiro', 187.82, 2, 3),
('2026-09-02 09:11:00', 'Cartão', 129.54, 29, 3),
('2026-07-10 21:40:00', 'Pix', 179.19, 19, 8),
('2026-02-15 10:26:00', 'Pix', 82.45, 3, 2),
('2026-03-12 14:39:00', 'Dinheiro', 160.15, 20, 8),
('2026-06-25 19:00:00', 'Dinheiro', 71.17, 16, 6),
('2026-07-03 22:37:00', 'Cartão', 69.47, 26, 10);

USE db_farmacia;


INSERT INTO produto (nome, categoria, preco, quantidade_estoque) VALUES
('Dipirona Monidratada 500mg', 'Medicamentos', 8.50, 150),
('Paracetamol 750mg', 'Medicamentos', 9.20, 120),
('Ibuprofeno 600mg', 'Medicamentos', 18.90, 80),
('Amoxicilina 500mg', 'Medicamentos', 32.50, 50),
('Omeprazol 20mg', 'Medicamentos', 22.00, 90),
('Dorflex 36 Comprimidos', 'Medicamentos', 24.90, 200),
('Neosaldina 20 Drágeas', 'Medicamentos', 21.50, 180),
('Protetor Solar FPS 50 200ml', 'Cosméticos', 65.90, 45),
('Creme Anti-idade 50g', 'Cosméticos', 89.90, 30),
('Shampoo Anticaspa 400ml', 'Higiene', 28.50, 60),
('Condicionador Hidratante 400ml', 'Higiene', 29.90, 55),
('Sabonete Líquido 500ml', 'Higiene', 15.90, 100),
('Pasta de Dente Tripla Ação', 'Higiene', 7.80, 250),
('Fio Dental 50m', 'Higiene', 9.50, 150),
('Desodorante Roll-on 50ml', 'Higiene', 12.90, 110),
('Fralda Geriatrica G 8un', 'Cuidados Pessoais', 42.00, 40),
('Lenço Umedecido 100un', 'Cuidados Pessoais', 18.50, 85),
('Vitamina C 1g 10 Comprimidos', 'Suplementos', 19.90, 130),
('Multivitamínico A-Z 60 Caps', 'Suplementos', 54.90, 70),
('Soro Fisiológico 500ml', 'Primeiros Socorros', 6.50, 160),
('Algodão Hidrófilo 100g', 'Primeiros Socorros', 8.20, 140),
('Curativo Gel de Silicone', 'Primeiros Socorros', 14.50, 95);


INSERT INTO item_venda (quantidade, valor_unitario, id_venda, id_produto, id_funcionarios) VALUES
(3, 8.50, 1, 1, 8),
(4, 18.90, 1, 3, 8),
(4, 9.50, 2, 14, 9),
(3, 21.50, 2, 7, 9),
(2, 18.90, 3, 3, 6),
(1, 8.20, 4, 21, 5),
(2, 12.90, 4, 15, 5),
(4, 22.00, 4, 5, 5),
(2, 8.20, 5, 21, 1),
(3, 8.50, 5, 1, 1),
(3, 22.00, 5, 5, 1),
(2, 12.90, 6, 15, 2),
(3, 24.90, 7, 6, 1),
(1, 18.50, 8, 17, 4),
(4, 12.90, 8, 15, 4),
(1, 12.90, 9, 15, 5),
(1, 6.50, 10, 20, 9),
(4, 9.50, 11, 14, 4),
(2, 32.50, 12, 4, 5),
(4, 18.90, 13, 3, 5),
(1, 15.90, 13, 12, 5),
(3, 9.20, 13, 2, 5),
(1, 14.50, 14, 22, 1),
(3, 89.90, 14, 9, 1),
(2, 54.90, 15, 19, 10),
(1, 42.00, 16, 16, 2),
(1, 65.90, 16, 8, 2),
(2, 32.50, 16, 4, 2),
(2, 6.50, 17, 20, 10),
(1, 54.90, 17, 19, 10),
(4, 18.50, 18, 17, 10),
(2, 22.00, 19, 5, 6),
(2, 18.90, 19, 3, 6),
(3, 9.20, 19, 2, 6),
(3, 8.20, 20, 21, 2),
(1, 89.90, 20, 9, 2),
(1, 89.90, 21, 9, 2),
(3, 89.90, 22, 9, 10),
(2, 18.50, 22, 17, 10),
(3, 15.90, 22, 12, 10),
(2, 29.90, 23, 11, 4),
(4, 21.50, 23, 7, 4),
(2, 9.50, 24, 14, 2),
(4, 9.20, 24, 2, 2),
(2, 32.50, 24, 4, 2),
(3, 89.90, 25, 9, 4),
(1, 15.90, 25, 12, 4),
(4, 19.90, 26, 18, 4),
(2, 18.50, 26, 17, 4),
(4, 8.20, 27, 21, 6),
(1, 28.50, 27, 10, 6),
(1, 9.20, 28, 2, 3),
(4, 65.90, 28, 8, 3),
(3, 7.80, 28, 13, 3),
(3, 28.50, 29, 10, 5),
(3, 24.90, 29, 6, 5),
(1, 18.50, 29, 17, 5),
(4, 12.90, 30, 15, 8),
(1, 9.50, 31, 14, 5),
(1, 8.20, 31, 21, 5),
(3, 7.80, 31, 13, 5),
(3, 19.90, 32, 18, 10),
(2, 89.90, 32, 9, 10),
(4, 32.50, 33, 4, 5),
(1, 89.90, 33, 9, 5),
(2, 8.50, 33, 1, 5),
(3, 15.90, 34, 12, 3),
(4, 6.50, 34, 20, 3),
(3, 29.90, 35, 11, 3),
(2, 6.50, 35, 20, 3),
(4, 21.50, 35, 7, 3),
(3, 12.90, 36, 15, 8),
(1, 29.90, 36, 11, 8),
(4, 8.20, 37, 21, 2),
(3, 24.90, 38, 6, 8),
(1, 18.90, 39, 3, 6),
(4, 8.20, 39, 21, 6),
(1, 12.90, 39, 15, 6),
(1, 54.90, 40, 19, 10),
(1, 42.00, 40, 16, 10);

-- Comparativo de vendas Mês a Mês
SELECT 
    DATE_FORMAT(data_hora_venda, '%Y-%m') AS mes_ano,
    COUNT(id_venda) AS total_transacoes,
    SUM(valor_total) AS faturamento_total,
    ROUND(AVG(valor_total), 2) AS ticket_medio
FROM venda
GROUP BY DATE_FORMAT(data_hora_venda, '%Y-%m')
ORDER BY mes_ano ASC;

-- Produtos Menos Vendidos
SELECT
	p.id_produto,
    p.nome,
    p.categoria,
    COALESCE(SUM(iv.quantidade), 0) AS quantidade_vendida,
    p.quantidade_estoque AS estoque_produto
FROM produto AS p
LEFT JOIN item_venda AS iv ON p.id_produto = iv.id_produto
GROUP BY p.id_produto, p.nome, p.categoria, p.quantidade_estoque
ORDER BY quantidade_vendida ASC
LIMIT 5;

-- Relatório de evolução mensal e crescimento
WITH faturamento_mensal AS (
    SELECT 
		DATE_FORMAT(data_hora_venda, '%Y-%m') AS mes_ano,
		COUNT(id_venda) AS total_vendas,
		SUM(valor_total) AS faturamento,
		ROUND(AVG(valor_total), 2) AS ticket_medio
	FROM venda
	GROUP BY DATE_FORMAT(data_hora_venda, '%Y-%m')
)
SELECT
	mes_ano,
    total_vendas,
    faturamento,
    ticket_medio,
    LAG(faturamento, 1) OVER (ORDER BY mes_ano) AS faturamento_mes_anterior,
    ROUND(
		((faturamento - LAG(faturamento, 1) OVER (ORDER BY mes_ano))
        / LAG(faturamento, 1) OVER (ORDER BY mes_ano)) * 100, 2
    ) AS porcentagem_crescimento
FROM faturamento_mensal
ORDER BY mes_ano ASC;

-- Produtos menos vendidos e capital parado
SELECT
	p.id_produto,
    p.nome AS nome_produto,
    p.categoria,
    p.quantidade_estoque AS estoque_atual,
    COALESCE(SUM(iv.quantidade), 0) AS unidades_vendidas,
    ROUND(COALESCE(SUM(iv.quantidade * iv.valor_unitario), 0), 2) AS receita_gerada,
    ROUND(p.preco * p.quantidade_estoque, 2) AS capital_parado_estoque,
    CASE
		WHEN COALESCE(SUM(iv.quantidade), 0) = 0 THEN 'Critico: Sem Vendas'
        WHEN COALESCE(SUM(iv.quantidade), 0) <= 5 THEN 'ALERTA: Baixo Giro'
        WHEN COALESCE(SUM(iv.quantidade), 0) <= 12 THEN 'Giro Médio'
        ELSE 'Alto Giro'
	END AS status_estrategico
FROM produto AS p
LEFT JOIN item_venda AS iv ON p.id_produto = iv.id_produto
GROUP BY p.id_produto, p.nome, p.categoria, p.quantidade_estoque, p.preco
ORDER BY unidades_vendidas ASC, capital_parado_estoque DESC;

-- Desempenho e Comissão de funcionários
SELECT
	f.id_funcionarios,
    f.nome_completo AS funcionario,
    COUNT(v.id_venda) AS total_vendas_realizadas,
    ROUND(SUM(v.valor_total), 2) AS faturamento_gerado,
    ROUND(AVG(v.valor_total), 2) AS ticket_medio_atendimento,
    ROUND(SUM(v.valor_total) * 0.03, 2) AS comissao_estimada_3_porcento
FROM funcionarios AS f
INNER JOIN venda AS v ON f.id_funcionarios = v.id_funcionarios
GROUP BY f.id_funcionarios, f.nome_completo
ORDER BY faturamento_gerado DESC;

-- VIEW para Dashboard de categoria
CREATE OR REPLACE VIEW vw_dashboard_vendas_categoria AS
SELECT
	p.categoria,
    COUNT(DISTINCT v.id_venda) AS quantidade_vendas,
    SUM(iv.quantidade) AS total_itens_vendidos,
    ROUND(SUM(iv.quantidade * iv.valor_unitario), 2) AS faturamento_bruto,
    ROUND((SUM(iv.quantidade * iv.valor_unitario) / (SELECT SUM(valor_total) FROM venda)) * 100, 2) AS percentual_participacao_faturamento
FROM produto AS p
INNER JOIN item_venda AS iv ON p.id_produto = iv.id_produto
INNER JOIN venda AS v ON iv.id_venda = v.id_venda
GROUP BY p.categoria
ORDER BY faturamento_bruto DESC;

SELECT * FROM vw_dashboard_vendas_categoria;

    








