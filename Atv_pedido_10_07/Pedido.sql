DROP TABLE IF EXISTS pedido_Item_pedido;
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

CREATE TABLE pedido_Item_pedido (
	id_pedido_fk INT,
    id_produto_fk INT,
    quantidade_ip INT NOT NULL,
    preco_unitario_ip DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido_fk, id_produto_fk),
    FOREIGN KEY (id_pedido_fk) REFERENCES pedido(id_pedido_pk),
    FOREIGN KEY (id_produto_fk) REFERENCES produto(id_produto_pk)
)
