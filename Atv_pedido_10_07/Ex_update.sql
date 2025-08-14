UPDATE pedido_Produto
SET preco = preco + (preco * 0,1)
WHERE preco BETWEEN 100 AND 300;

UPDATE pedido_Pedido
SET cliente_nome = 'Carlos E. da Silva'
WHERE client_nome = 'Carlos%';

UPDATE pedido_Item_pedido AS ip
JOIN pedido_Produto AS p ON ip.id_produto_fk = p.id_produto_pk
SET ip.preco_unitario_ip = p.preco
WHERE ip.id_pedido_fk BETWEEN 1 AND 10;

UPDATE pedido_Produto
SET nome_produto = nome_produto
WHERE nome_produto LIKE '%"';

UPDATE pedido_Produto
SET preco = preco - 20
WHERE id_produto_fk IN (1, 4, 7, 10) AND preco >= 20
