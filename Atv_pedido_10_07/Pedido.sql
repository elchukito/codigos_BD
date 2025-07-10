DROP TABLE IF EXISTS pedido_Pedido;
DROP TABLE IF EXISTS pedido_Produto;

CREATE TABLE pedido_Produto (
	id_produto_pk INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE pedido_Pedido (
	id_pedido_pk INT PRIMARY KEY AUTO_INCREMENT,
	data_pedido DATE NOT NULL,
	cliente_nome VARCHAR(100)
);
