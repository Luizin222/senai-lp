CREATE DATABASE lojinha;

USE lojinha;
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);
INSERT INTO Cliente (id, nome) VALUES
(1, 'Ana'),
(2, 'José'),
(3, 'João');
CREATE TABLE EmailCliente (
    id INT PRIMARY KEY,
    email VARCHAR(50),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);
INSERT INTO EmailCliente (id, email, idCliente) VALUES
(1, 'e1', 1),
(2, 'e2', 1),
(3, 'e3', 2),
(4, 'e4', 2),
(5, 'e5', 3);
CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    data DATE,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);
INSERT INTO Pedido (id, data, idCliente) VALUES
(1, '2015-10-05', 1),
(2, '2014-12-31', 1),
(3, '2010-09-10', 2),
(4, '2015-03-14', 2),
(5, '2014-07-21', 2);
CREATE TABLE Categoria (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);
INSERT INTO Categoria (id, nome) VALUES
(1, 'Ferramenta'),
(2, 'Alimento'),
(3, 'Vestuário');
CREATE TABLE Fornecedor (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);
INSERT INTO Fornecedor (id, nome) VALUES
(1, 'F1'),
(2, 'F2'),
(3, 'F3');
CREATE TABLE Produto (
    id INT PRIMARY KEY,
    descricao VARCHAR(50),
    idCategoria INT,
    idFornecedor INT,
    estoque INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(id),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(id)
);
INSERT INTO Produto (id, descricao, idCategoria, idFornecedor, estoque) VALUES
(1, 'Alicate', 1, 1, 10),
(2, 'Leite', 2, 1, 100),
(3, 'Suco', 2, 1, 50),
(4, 'Camisa', 3, 2, 40),
(5, 'Calça', 3, 2, 20);
CREATE TABLE PedidoProduto (
    id INT PRIMARY KEY,
    idPedido INT,
    idProduto INT,
    quantidade INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(id),
    FOREIGN KEY (idProduto) REFERENCES Produto(id)
);
INSERT INTO PedidoProduto
(id, idPedido, idProduto, quantidade) VALUES
(1, 1, 1, 10),
(2, 1, 2, 20),
(3, 2, 3, 5),
(4, 3, 4, 10),
(5, 4, 5, 5);

select * from pedido;

-- a) Mostre todos os clientes com seus e-mails organizados pelo nome do cliente 
SELECT c.nome AS Cliente, e.email AS Email
FROM Cliente c
JOIN EmailCliente e ON c.id = e.idCliente
ORDER BY c.nome ;

-- b) Mostre todos os pedidos realizados entre 2010 e 2014 
SELECT *
FROM Pedido
WHERE data BETWEEN '2010-01-01' AND '2014-12-31' ; 

-- c) Mostre todos os clientes que possuem pedidos entre 2015 e 2016

SELECT DISTINCT c.nome AS Cliente
FROM Cliente c
JOIN Pedido p ON c.id = p.idCliente
WHERE p.data BETWEEN '2015-01-01' AND '2016-12-31';

-- d) Mostre o nome das categorias que iniciam pela letra "f", organizadas pelo nome da categoria de forma descendente, sem valores repetidos

SELECT DISTINCT nome AS Categoria
FROM Categoria
WHERE nome LIKE 'F%'
ORDER BY nome DESC;

-- e) Apresente o total de produtos que são da categoria "Vestuário"

SELECT COUNT(*) AS TotalProdutos
FROM Produto p
JOIN Categoria c ON p.idCategoria = c.id
WHERE c.nome = 'Vestuário'; 

-- f) Mostre o nome da categoria e o total em estoque de cada produto agrupado por categoria

SELECT c.nome AS Categoria, SUM(p.estoque) AS TotalEstoque
FROM Produto p
JOIN Categoria c ON p.idCategoria = c.id
GROUP BY c.nome; 

-- g) Mostre o nome do produto com o nome do respectivo fornecedor
SELECT p.descricao AS Produto, f.nome AS Fornecedor
FROM Produto p
JOIN Fornecedor f ON p.idFornecedor = f.id; 

-- h) Para o cliente com id=01, mostre a data de todos os pedidos efetuados classificados pela data do pedido
SELECT data AS DataPedido
FROM Pedido
WHERE idCliente = 1
ORDER BY data; 

-- i) Liste a descrição e a quantidade pedida de cada produto
SELECT p.descricao AS Produto, pp.quantidade AS QuantidadePedida
FROM Produto p
JOIN PedidoProduto pp ON p.id = pp.idProduto; 

-- j) Na tabela Produto, insira um novo campo chamado preco e atualize com 10% do valor do estoque

ALTER TABLE Produto ADD COLUMN preco DECIMAL(5,2);
UPDATE Produto
SET preco = estoque * 0.10; 

-- k) Na tabela Produto, informe o maior valor de estoque
SELECT MAX(estoque) AS MaiorEstoque
FROM Produto;
