--LISTA 3 de Exercicios SQL
USE treinamento

--Fa�a um comando para listar:
/*
A)O nome do produto, o nome  do fornecedor, o pre�o do produto, o pre�o com 10% de desconto,
o pre�o com 20% de descontos e o pre�o com 30% de descontos para produtos cujo valor com 10% 
de desconto ultrapasse os 15 reais, isso ordenado por pre�o do produto
*/
SELECT NMPRODUCT, 
	   NMSUPPLIER, 
	   VLPRICE,
	   (VLPRICE - (VLPRICE * 0.1)) AS VLDISC10,
	   (VLPRICE - (VLPRICE * 0.2)) AS VLDISC20,
CASE
	WHEN (VLPRICE - (VLPRICE * 0.1)) > 15 THEN (VLPRICE - (VLPRICE * 0.3))
END
FROM PRODUCT, SUPPLIER
ORDER BY VLPRICE;

/*
B) O nome do produto, o nome do fornecedor, o pre�o do produto, 
o pre�o total do produto no estoque e o preco total para o dobro do estoque
para produtos com preco total acima de 12000, ordenados por fornecedor e produto.
*/

SELECT NMPRODUCT, NMSUPPLIER, VLPRICE, (VLPRICE * QTSTOCK) AS TOTALPRICE,
CASE
	WHEN ((VLPRICE * QTSTOCK) * 2) > 12000 THEN ((VLPRICE * QTSTOCK) * 2)
END
FROM PRODUCT, SUPPLIER
ORDER BY NMSUPPLIER, NMPRODUCT

/*
C) Todas as colunas dos clientes que possuem telefone cadastrado e come�am com a letra J, ordenado pelo nome do cliente.
*/
SELECT  FROM CUSTOMER

/*
D) O nome do produto, o pre�o e o nome do fornecedor dos produtos 
que o fornecedor tenha no nome os caracteres "ica", ordenado por fornecedor e pre�o.
*/

/*
E) O nome do fornecedor, o fone do fornecedor, o nome do produto, o preco e o preco total do produto 
no estoque para produtos que comecem com a letra S, tendo preco acima de 50, ordenado por fornecedor e preco.
*/

/*
F)O nome do cliente, o nome do produtom a data do pedido,
a data de entrega, a quantidade pedida, o valor unitario de venda dos produtos
e o valor total do produto pedido, cujas unidades pedidas por pedido 
sejam menor que 600 e a data do pedido seja no mes dea agosto de 2003 e o produto comece com a letra M .
*/

/*
G) O nome do cliente, o nome do produto o nome do fornecedor, 
a data do pedido, a data de entrega e o pre�o, somente se o fornecedor 
for de S�o Paulo (011) e o pre�o seja maior que 20 reais.
*/






SELECT * FROM PRODUCT;
SELECT * FROM REQUEST;
SELECT * FROM CUSTOMER;
SELECT * FROM SUPPLIER;