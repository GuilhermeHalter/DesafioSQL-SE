--LISTA 2 de Exercicios SQL
USE treinamento

--Faça um comando para listar:
--A)O nome e telefone de todos os clientes em que o telefone começa com o digito 4
SELECT NMCUSTOMER, IDFONE 
FROM CUSTOMER
WHERE IDFONE LIKE '4%';

--B)Todas as colunas dos clientes que não possuem telefone cadastrados.
SELECT * 
FROM CUSTOMER 
WHERE IDFONE = NULL;

--C) O nome e o telefone dos fornecedores em que o DDD não foi cadastrado
SELECT NMSUPPLIER, IDFONE 
FROM SUPPLIER
WHERE LEN(IDFONE) < 11

--D) O nome, quantidade em estoque e o preço com desconto de 10% dos produtos que tem mais de 2000 unidades em estoque.
SELECT NMPRODUCT, QTSTOCK, VLPRICE,
CASE
	WHEN QTSTOCK > 2000 THEN ( VLPRICE-(VLPRICE * 0.1) )
	WHEN QTSTOCK < 2000 THEN VLPRICE
END
FROM PRODUCT;

--E)O nome e o preço dos produtos com preço entre 10 e 20 reais
SELECT NMPRODUCT, VLPRICE 
FROM PRODUCT
WHERE VLPRICE BETWEEN 10 AND 20;

/*F) O nome do produto, o preço e o preço total do estoque dos produtos com preço acima de 50 reais*/ 


SELECT * FROM PRODUCT;
