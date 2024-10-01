create database gamestore;


use gamestore;

-- Dar os privilegios aos administradores

create user 'Paulo Pereira'@'localhost' IDENTIFIED BY 'admin01';

create user 'Sérgio Lopes'@'localhost' IDENTIFIED BY 'admin02';

GRANT CREATE, SELECT, INSERT, UPDATE ON * . * TO 'Paulo Pereira'@'localhost'; 

GRANT CREATE, SELECT, INSERT, UPDATE ON * . * TO 'Sérgio Lopes'@'localhost'; 


CREATE TABLE clientes (
id_cliente int PRIMARY KEY auto_increment,
nome varchar(150) not null,
email varchar(200) not null,
telefone varchar(11) not null,
cpf varchar(11),
cnpj varchar(14)
);

CREATE TABLE funcionarios (
id_funcionario int PRIMARY KEY auto_increment,
nome varchar(150) not null,
cargo varchar(3) not null,
salario float not null,
status_funcionario varchar(1) not null,
data_admissao varchar(10) not null,
idade int not null
);

CREATE TABLE produtos (
id_produto int PRIMARY KEY auto_increment,
nome varchar(150) not null,
preco float not null,
estoque int not null,
descricao varchar(300) not null
);

CREATE TABLE pedidos (
id_pedido INT PRIMARY KEY auto_increment,
data_pedido varchar(10) not null,
status_liberacao varchar(10) not null,
nota_fiscal varchar(200),
id_cliente int,
foreign key (id_cliente) references clientes (id_cliente),
id_funcionario int,
foreign key (id_funcionario) references funcionarios (id_funcionario)
);

CREATE TABLE itens_pedidos (
id_item_pedido_ INT PRIMARY KEY auto_increment,
quantidade int not null,
preco_unitario float not null,
id_pedido int,
foreign key (id_pedido) references pedidos (id_pedido),
id_produto int,
foreign key (id_produto) references produtos (id_produto)
);


CREATE TABLE pagamento (
id_pagamento  int PRIMARY KEY auto_increment,
data_pagamento varchar(10),
data_gerada_pagamento varchar(10) not null,
metodo_pagamento varchar(20) not null,
status_pagamento varchar(10) not null,
valor float,
id_funcionario int,
foreign key(id_funcionario) references funcionarios (id_funcionario),
id_pedido int,
foreign key(id_pedido) references pedidos (id_pedido)
);


INSERT INTO clientes (nome, email, telefone, cpf, cnpj)
VALUES 
('João Silva', 'joao.silva@email.com', '99999999999', '12345678901', NULL),
('Maria Santos', 'maria.santos@email.com', '98888888888', NULL, '12345678000123'),
('Pedro Oliveira', 'pedro.oliveira@email.com', '97777777777', '34567890123', NULL),
('Ana Costa', 'ana.costa@email.com', '96666666666', NULL, '23456789000145'),
('Lucas Souza', 'lucas.souza@email.com', '95555555555', '56789012345', NULL),
('Paula Lima', 'paula.lima@email.com', '94444444444', NULL, '34567890000156'),
('Carlos Menezes', 'carlos.menezes@email.com', '93333333333', '78901234567', NULL),
('Fernanda Rocha', 'fernanda.rocha@email.com', '92222222222', NULL, '45678900001234'),
('Roberto Gonçalves', 'roberto.goncalves@email.com', '91111111111', '89012345678', NULL),
('Juliana Ferreira', 'juliana.ferreira@email.com', '90000000000', NULL, NULL);



INSERT INTO funcionarios (nome, cargo, salario, status_funcionario, data_admissao, idade)
VALUES 
('Carlos Lima', 'GER', 4500.00, 'A', '2020-01-15', 45),
('Fernanda Almeida', 'VEN', 3500.00, 'A', '2021-02-20', 32),
('Paulo Pereira', 'ADM', 3000.00, 'A', '2019-03-10', 29),
('Juliana Ribeiro', 'VEN', 3600.00, 'I', '2022-04-22', 26),
('Ricardo Gomes', 'ADM', 3200.00, 'A', '2021-05-15', 34),
('Mariana Sousa', 'VEN', 3700.00, 'A', '2020-08-12', 30),
('Bruno Costa', 'GER', 5000.00, 'A', '2018-07-01', 50),
('Sérgio Lopes', 'ADM', 3100.00, 'A', '2019-09-30', 40),
('Ana Paula', 'VEN', 3650.00, 'A', '2020-10-05', 28),
('Cláudio Tavares', 'GER', 4600.00, 'A', '2021-11-20', 48);


INSERT INTO produtos (nome, preco, estoque, descricao)
VALUES 
('Notebook Dell', 3500.00, 10, 'Notebook Dell com 8GB RAM e 256GB SSD'),
('Smartphone Samsung', 2000.00, 15, 'Samsung Galaxy com 128GB de armazenamento'),
('Mouse Gamer', 150.00, 50, 'Mouse Gamer RGB com 6 botões programáveis'),
('Teclado Mecânico', 300.00, 30, 'Teclado mecânico RGB com switches azuis'),
('Monitor LG', 1200.00, 20, 'Monitor LG de 27 polegadas Full HD'),
('Impressora Epson', 800.00, 12, 'Impressora multifuncional Epson com tanque de tinta'),
('Tablet Apple', 2500.00, 5, 'Tablet Apple iPad Pro 11 polegadas'),
('Câmera Canon', 4000.00, 8, 'Câmera DSLR Canon com lente 18-55mm'),
('Fone de Ouvido Sony', 400.00, 40, 'Fone de ouvido Sony com cancelamento de ruído'),
('Smartwatch Xiaomi', 600.00, 25, 'Smartwatch Xiaomi Mi Band 6');

INSERT INTO pedidos (data_pedido, status_liberacao, nota_fiscal, id_cliente, id_funcionario)
VALUES 
('2023-09-10', 'Liberado', 'NF-001', 1, 1),
('2023-09-11', 'Pendente', NULL, 2, 2),
('2023-09-12', 'Liberado', 'NF-002', 3, 1),
('2023-09-13', 'Pendente', NULL, 4, 3),
('2023-09-14', 'Liberado', 'NF-003', 5, 2),
('2023-09-15', 'Pendente', NULL, 6, 4),
('2023-09-16', 'Liberado', 'NF-004', 7, 5),
('2023-09-17', 'Pendente', NULL, 8, 6),
('2023-09-18', 'Liberado', 'NF-005', 9, 7),
('2023-09-19', 'Pendente', NULL, 10, 8);

INSERT INTO itens_pedidos (quantidade, preco_unitario, id_pedido, id_produto)
VALUES 
(1, 3500.00, 1, 1),
(2, 150.00, 1, 3),
(1, 2000.00, 2, 2),
(1, 300.00, 3, 4),
(1, 1200.00, 4, 5),
(1, 2500.00, 5, 7),
(1, 4000.00, 6, 8),
(2, 400.00, 7, 9),
(1, 600.00, 8, 10),
(1, 800.00, 9, 6);

INSERT INTO pagamento (data_pagamento, data_gerada_pagamento, metodo_pagamento, status_pagamento, valor, id_funcionario, id_pedido)
VALUES 
('2023-09-10', '2023-09-09', 'Cartão de Crédito', 'Pago', 3650.00, 1, 1),
('2023-09-12', '2023-09-11', 'Boleto', 'Aguardando', 2000.00, 2, 2),
('2023-09-14', '2023-09-01', 'PIX', 'Pago', 350.00, 1, 3),
(NULL, '2023-09-13', 'Cartão de Débito', 'Pendente', NULL, 3, 4),
('2023-09-20', '2023-09-14', 'Cartão de Crédito', 'Pago', 2500.00, 2, 5),
('2023-10-16', '2023-09-20', 'PIX', 'Pago', 4000.00, 4, 6),
(NULL, '2023-09-16', 'Boleto', 'Aguardando', NULL, 5, 7),
('2023-09-17', '2023-09-16', 'Cartão de Crédito', 'Pago', 800.00, 6, 9),
(NULL, '2023-09-18', 'Cartão de Débito', 'Pendente', NULL, 7, 10);

SELECT * FROM clientes;

SELECT * FROM funcionarios;

SELECT * FROM produtos;

SELECT * FROM pedidos;

SELECT * FROM itens_pedidos;

SELECT * FROM pagamento;

-- Adicionar enderenço para realizar a entrega aos clientes
ALTER TABLE clientes
ADD endereco VARCHAR(255);

-- Adicionando endereco a todos os clientes
UPDATE clientes
SET endereco = 'Rua ABC, 123'
WHERE id_cliente = 1;  

UPDATE clientes
SET endereco = 'Avenida DEF, 456'
WHERE id_cliente = 2;  

UPDATE clientes
SET endereco = 'Travessa GHI, 333'
WHERE id_cliente = 3; 

UPDATE clientes
SET endereco = 'Rua XYZ, 10'
WHERE id_cliente = 4; 

UPDATE clientes
SET endereco = 'Alameda dos Pinheiros, 202'
WHERE id_cliente = 5;  

UPDATE clientes
SET endereco = 'Rua AXC, 431'
WHERE id_cliente = 6;  

UPDATE clientes
SET endereco = 'Avenida DEF, 700'
WHERE id_cliente = 7;  

UPDATE clientes
SET endereco = 'Travessa gostosura, 90'
WHERE id_cliente = 8; 

UPDATE clientes
SET endereco = 'Rua nenhuma, 100'
WHERE id_cliente = 9; 

UPDATE clientes
SET endereco = 'Alameda sunshine, 1'
WHERE id_cliente = 10;  -- Lucas Souza

-- Remover status do funcionario do banco
ALTER TABLE funcionarios
DROP COLUMN idade;

-- Consultar produtos e o preço espefico de um pedido
SELECT produtos.nome, itens_pedidos.quantidade, itens_pedidos.preco_unitario
FROM itens_pedidos
JOIN produtos ON itens_pedidos.id_produto = produtos.id_produto
WHERE id_pedido = 1; 

-- Mostra os itens e a quantidade e o total
SELECT produtos.nome AS produto, itens_pedidos.quantidade, 
itens_pedidos.preco_unitario, (itens_pedidos.quantidade * itens_pedidos.preco_unitario) AS total_item
FROM produtos
RIGHT JOIN itens_pedidos ON produtos.id_produto = itens_pedidos.id_produto;

-- Agora somatório do valor de todos os produtos 
SELECT SUM(itens_pedidos.quantidade * itens_pedidos.preco_unitario) AS valor_total_todos_produtos
FROM itens_pedidos;

-- Procurar todos os pedidos que ainda não foram pagos
SELECT * FROM pagamento
WHERE status_pagamento = 'Aguardando';

-- status de entrega
DELIMITER //
create procedure status_entrega()
begin
SELECT pedidos.id_pedido, clientes.nome, pedidos.data_pedido, clientes.endereco,
pagamento.status_pagamento
from pedidos
join clientes on pedidos.id_cliente = clientes.id_cliente
JOIN pagamento ON pedidos.id_pedido = pagamento.id_pedido;
end //
DELIMITER ;

-- Total do valor que cada funcionario vendeu
DELIMITER //
create procedure funcionario_venda()
begin
SELECT f.nome, SUM(pag.valor) AS total_vendas
FROM funcionarios f
JOIN pedidos ped ON f.id_funcionario = ped.id_funcionario
JOIN pagamento pag ON ped.id_pedido = pag.id_pedido
WHERE pag.status_pagamento = 'Pago'
GROUP BY f.nome;
end //
DELIMITER ;

-- Consultar os pedidos que ainda não foram pagos e agir para garantir a venda
DELIMITER //
create procedure pedidos_pendentes()
begin
SELECT pedidos.id_pedido, clientes.nome, pedidos.data_pedido,
clientes.telefone
FROM pedidos
JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
JOIN pagamento ON pedidos.id_pedido = pagamento.id_pedido
WHERE pagamento.status_pagamento = 'Aguardando';
end //
DELIMITER ;

-- Atualizar status para pago após recuperação da venda
UPDATE pagamento
SET status_pagamento = 'Pago'
WHERE id_pagamento = 2; 

-- Verificar total de vendas do mês para realizar controle
DELIMITER //
create procedure total_vendas()
begin
SELECT SUM(valor) AS total_vendas
FROM pagamento
WHERE status_pagamento = 'Pago';
end //
DELIMITER ;


call status_entrega();

call funcionario_venda();

call pedidos_pendentes();

call total_vendas();


