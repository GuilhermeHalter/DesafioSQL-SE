--LISTA 7 de Exercicios SQL
USE treinamento

-- Faça um script

-- A) Excluindo todos os pedidos que forem menores que R$1000 que não possuam itens cadastrados e que sejam no mês de junho/2003
DELETE FROM REQUEST
WHERE CDREQUEST NOT IN (SELECT CDREQUEST FROM PRODUCTREQUEST) 
AND DTREQUEST BETWEEN '2003-06-01' AND '2003-06-30'
AND VLTOTAL < 1000;

SELECT * FROM PRODUCT
-- B) Atualizando o preço do produto como sendo a média dos valores unitários de venda, somente para produtos que venderam menos de 800 unidades
UPDATE PRODUCT
SET VLPRICE = (SELECT AVG(VLUNITARY) FROM PRODUCTREQUEST WHERE PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT)
WHERE CDPRODUCT IN (SELECT CDPRODUCT FROM PRODUCTREQUEST GROUP BY CDPRODUCT HAVING SUM(QTAMOUNT) < 800);

-- C) Inserindo os fornecedores como clientes. Utilize como código o valor máximo mais o código do fornecedor para gerar o código do novo cliente criado a partir do fornecedor
INSERT INTO CUSTOMER (CDCUSTOMER,NMCUSTOMER,NMADRESS,IDFONE)
SELECT (SELECT MAX(CDCUSTOMER)FROM CUSTOMER) + CDSUPPLIER AS NEWCDCUSTOMER, CDSUPPLIER, NMSUPPLIER, IDFONE 
FROM SUPPLIER

-- D) Atualizando a data de entrega do pedido como sendo a data do pedido + 30 dias para pedidos em que a diferença entre essas duas datas seja menor que 10 dias e o cliente tenha comprado menos que R$10.000
UPDATE REQUEST
SET DTDELIVER = DTREQUEST + 30
WHERE ((DTREQUEST + 30) - (DTDELIVER)) < 10 AND REQUEST.VLTOTAL < 10000
AND CDCUSTOMER IN (SELECT CDCUSTOMER FROM Request WHERE VLTOTAL < 10000);