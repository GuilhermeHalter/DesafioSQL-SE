CREATE DATABASE Atividade;
USE Atividade;

-- A)Fa�a scripts para cria��o de tabelas sem as restri��es

CREATE TABLE PRODUCTREQUEST (
	QTAMOUNT INT,
	VLUNITARY DECIMAL(10,2),
);

CREATE TABLE REQUEST (
	CDREQUEST INT,
	DTREQUEST DATE,
	CDCUSTOMER INT,
	DTDELIVER INT,
	VLTOTAL DECIMAL(10,2),
);

CREATE TABLE CUSTOMER (
	CDCUSTOMER INT,
	NMCUSTOMER INT,
	NRFONE VARCHAR(11),
	DSADRESS VARCHAR(150),
);

CREATE TABLE PRODUCT (
	CDPRODUCT INT,
	NMPRODUCT VARCHAR(255),
	CDSUPPLIER INT,
	VLPRICE DECIMAL(10,2),
	QTSTOCK INT,
);

CREATE TABLE SUPPLIER (
	CDSUPPLIER INT,
	NMSUPPLIER VARCHAR(255),
	NRFONE VARCHAR(11),
);

-- B)Fa�a scripts para cria��o de Chaves Primarias nas  tabelas.
ALTER TABLE PRODUCTREQUEST
ADD CDREQUEST SMALLINT NOT NULL;

ALTER TABLE PRODUCTREQUEST
ADD CDPRODUCT SMALLINT NOT NULL;

ALTER TABLE REQUEST
ALTER COLUMN CDCUSTOMER SMALLINT NOT NULL;

ALTER TABLE PRODUCT
ALTER COLUMN CDSUPPLIER SMALLINT NOT NULL;

ALTER TABLE REQUEST
ALTER COLUMN CDREQUEST SMALLINT NOT NULL;
ALTER TABLE REQUEST 
ADD CONSTRAINT pk_CDREQUEST PRIMARY KEY (CDREQUEST);

ALTER TABLE CUSTOMER
ALTER COLUMN CDCUSTOMER SMALLINT NOT NULL;
ALTER TABLE CUSTOMER
ADD CONSTRAINT pk_CDCUSTOMER PRIMARY KEY (CDCUSTOMER);

ALTER TABLE PRODUCT
ALTER COLUMN CDPRODUCT SMALLINT NOT NULL;
ALTER TABLE PRODUCT
ADD CONSTRAINT pk_CDPRODUCT PRIMARY KEY (CDPRODUCT);

ALTER TABLE SUPPLIER 
ALTER COLUMN CDSUPPLIER SMALLINT NOT NULL;
ALTER TABLE SUPPLIER
ADD CONSTRAINT pk_CDSUPPLIER PRIMARY KEY (CDSUPPLIER);

--C)Fa�a scripts para cria��o de Chaves Secundarias nas tabelas.

ALTER TABLE PRODUCTREQUEST 
ADD CONSTRAINT FK_PRODUCTREQUEST FOREIGN KEY (CDREQUEST) 
REFERENCES REQUEST (CDREQUEST);

ALTER TABLE PRODUCTREQUEST 
ADD CONSTRAINT FK2PRODUCTREQUEST FOREIGN KEY (CDPRODUCT) 
REFERENCES PRODUCT (CDPRODUCT);

ALTER TABLE REQUEST 
ADD CONSTRAINT FK_CUSTOMER FOREIGN KEY (CDCUSTOMER) 
REFERENCES CUSTOMER (CDCUSTOMER);

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_SUPPLIER FOREIGN KEY (CDSUPPLIER) 
REFERENCES SUPPLIER (CDSUPPLIER);

--D)
