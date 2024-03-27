--LISTA 3 de Exercicios SQL
USE treinamento

--Faça um comando para listar:
/*A)O nome do produto, o nome  do fornecedor, o preço do produto, o preço com 10% de desconto,
o preço com 20% de descontos e o preço com 30% de descontos para produtos cujo valor com 10% 
de desconto ultrapasse os 15 reais, isso ordenado por preço do produto*/
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

/*B) O nome do produto, o nome do fornecedor, o preço do produto, 
o preço total do produto no estoque e o preco total para o dobro do estoque
para produtos com preco total acima de 12000, ordenados por fornecedor e produto.*/

SELECT NMPRODUCT, NMSUPPLIER, VLPRICE, (VLPRICE * QTSTOCK) AS TOTALPRICE,
CASE
	WHEN ((VLPRICE * QTSTOCK) * 2) > 12000 THEN ((VLPRICE * QTSTOCK) * 2)
END
FROM PRODUCT, SUPPLIER
ORDER BY NMSUPPLIER, NMPRODUCT

/*C) Todas as colunas dos clientes que possuem telefone cadastrado e começam com a letra J, ordenado pelo nome do cliente.*/
SELECT * 
FROM CUSTOMER
WHERE IDFONE IS NOT NULL AND NMCUSTOMER LIKE 'J%'
ORDER BY NMCUSTOMER

/*D) O nome do produto, o preço e o nome do fornecedor dos produtos 
que o fornecedor tenha no nome os caracteres "ica", ordenado por fornecedor e preço.*/
SELECT NMPRODUCT, VLPRICE, NMSUPPLIER 
FROM PRODUCT, SUPPLIER
WHERE NMSUPPLIER LIKE '%ica%'
ORDER BY NMSUPPLIER, VLPRICE

/*E) O nome do fornecedor, o fone do fornecedor, o nome do produto, o preco e o preco total do produto 
no estoque para produtos que comecem com a letra S, tendo preco acima de 50, ordenado por fornecedor e preco.*/
SELECT NMSUPPLIER, IDFONE, NMPRODUCT, VLPRICE, (QTSTOCK * VLPRICE) AS TOTALPRICE
FROM SUPPLIER, PRODUCT
WHERE NMPRODUCT LIKE 'S%' AND VLPRICE < 50

/*F)O nome do cliente, o nome do produto a data do pedido,
a data de entrega, a quantidade pedida, o valor unitario de venda dos produtos
e o valor total do produto pedido, cujas unidades pedidas por pedido 
sejam menor que 600 e a data do pedido seja no mes de agosto de 2003 e o produto comece com a letra M .*/
SELECT NMCUSTOMER, NMPRODUCT, DTREQUEST, DTDELIVER, QTAMOUNT, VLUNITARY, VLTOTAL
FROM PRODUCTREQUEST
JOIN REQUEST ON REQUEST.CDREQUEST = PRODUCTREQUEST.CDREQUEST
JOIN CUSTOMER ON CUSTOMER.CDCUSTOMER = REQUEST.CDCUSTOMER
JOIN PRODUCT ON PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT
WHERE QTAMOUNT < 600 AND DTREQUEST BETWEEN '2003-08-01' AND '2003-08-31' AND NMPRODUCT LIKE 'M%'

/*G) O nome do cliente, o nome do produto o nome do fornecedor, 
a data do pedido, a data de entrega e o preço, somente se o fornecedor 
for de São Paulo (011) e o preço seja maior que 20 reais.*/

SELECT NMCUSTOMER, NMPRODUCT, NMSUPPLIER, DTREQUEST, DTDELIVER, VLPRICE, .SUPPLIER.IDFONE 
FROM CUSTOMER, PRODUCT, SUPPLIER, REQUEST 
WHERE SUPPLIER.IDFONE LIKE '(011)%' AND VLPRICE < 20
