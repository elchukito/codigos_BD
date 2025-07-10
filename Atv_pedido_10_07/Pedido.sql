DROP TABLE IF EXISTS pedido_Produto;

CREATE TABLE pedido_Produto (
	id_produto_pk INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);
