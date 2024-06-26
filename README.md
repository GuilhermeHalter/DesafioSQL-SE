# DesafioSQL-SE

## Atributos
Tipos de atributos:
- Simples
- Composto
- Multivalorado
- Determinante
- Identificador

**Atributo Simples**: não possui caracteristicas especiais, e são indivisíeis.<br/>
Ex: Nome da empresa, CPF, CNPJ

**Atributo Composto**: É formado por itens menores, e pode ser subdividido em outros atributos. <br/>
Ex: Endereço da empresa(dividido em rua, CEP, bairro);

**Atributo Multivalorado**: Pode conter mais de um valor para um mesmo registro (informação )<br/>
Ex: Telefone da empresa

**Atributo Determinante**: Define de forma única as instâncias de uma entidade. Não podem existir duas instancias com o mesmo valor nesse atributo.<br/>
Ex: CNPJ da empresa, Código de Produto

**Atributo Identificador ("Chaves")**: Uma chave indentifica uma instancia especifica na classe de entidade.<br/>
Ex: CPF, CodigoProduto, Matricula, ID_setor

As chaves podem ser únicas ou não-unicas:
- Únicas: O valor dos dados da chave é unico na entidade
- Não-única: Usada para agrupar instancias de classe em categorias.
As chaves podem ser Compostas, consistindo de dois ou mais atributos  combinados.

## Criação de banco de dados
```SQL
CREATE DATABASE db_Biblioteca
ON PRIMARY(
NAME= db_biblioteca,
FILENAME='C:\SQL\db_Biblioteca.MDF',
SIZE=6MB,
MAXSIZE=15MB,
FILEGROWTH=10%
)
```

### Comando USE <br>
O comando USE instrui o SGBDR (Sistema Gerenciador de Banco de Dados Relacional) a utilizar o banco de dados especificado para rodar os comandos

```SQL
USE db_Biblioteca
```

### Comando sp_helpdb <br>
O comando sp_helpdb informa o tamanho, taxa de crescimento, e local do banco de dados.

```SQL
sp_helpdb db_Biblioteca
```

## Constraints (Restições)

São regras aplicadas nas colunas de uma tabela, usadas para limitar os tipos de dados que são inseridos.
Podem ser especificadas no momento de criação da tabela (CREATE) ou após a tabela ter sido criada (ALTER).

### Principais Constraints
- NOT NULL 
- UNIQUE
- PRIMARY KEY
- FOREING KEY
- CHECK
- DEFAULT

**NOT NULL** <br>
A constraint NOT NULL impõe a uma coluna a NÃO aceitar valores NULL. A constraint NOT NULL obriga um campo a sempre possuir um valor.
Deste modo, não é possivel inserir um registro (ou atualizar) sem entrar com um valor neste campo.

**UNIQUE**<br>
A restrição UNIQUE indentifica de forma única cada registro em uma tabela de um banco de dados. As constraints UNIQUE e PRIMARY KEY garantem a unicidade em uma coluna ou conjunto de colunas.


```SQL
```




## Resumo (Comando Essenciais)

1. Criar Banco de Dados

```SQL
CREATE DATABASE Supermecado;
```

2. Criar Tabelas

```SQL
CREATE TABLE Fornecedores (
  Cod_Fornec SMALLINT PRIMARY KEY,
  Nome_Fornec VARCHAR(50)
);

CREATE TABLE Produtos (
  ID_Prod SMALLINT PRIMARY KEY,
  Nome_Prod VARCHAR(50) NOT NULL,
  Quant_Prod SMALLINT NOT NULL,
  Preco_Prod DECIMAL(10,2),
  Cod_Fornec SMALLINT,
  CONSTRAINT fk_cod_fornec FOREIGN KEY,
  REFERENCES Fornecedores(Cod_Fornec)
);
```

3. Inserir dados nas tabelas

```SQL
INSERT INTO Fornecedores (Cod_Fornec, Nome_Fornec)
VALUES (1, "Acme");

INSERT INTO Produtos
VALUES (100,"Monitor LCD", 12, 550.00, 1),
(101,"Roteador Banda Larga", 8, 130.00, 1),
(102,"Teclado", 15, 40.00, 1),
(103,"Pendrive 64GB", 22, 48.00, 1);
```

4. Efetuar consulta 
```SQL
SELECT Nome_Fornec FROM Fornecedores; --trazendo colunas especificas
SELECT Nome_Prod, Prece_Prod FROM Produtos; --trazendo colunas especificas
SELECT * FROM Produtos; --trazendo todas as colunas 
```

5. Consultando uma tabela com filtros de dados
```SQL
SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101;
```

6. Alterar um registro na tabela
```SQL
UPDATE Produtos
SET Preco_Prod = 630.00
WHERE ID_Prod = 100  --A cláusula WHERE é muito importante se não você fará o update em todos os dados da tabela
```

7. Excluir registros de uma tabela
```SQL
DELETE FROM Produtos
WHERE ID_Prod = 101;  --A cláusula WHERE é muito importante se não você irá deletar todos os dados da tabela
```

8. Trazer dados de duas ou mais tabelas relacionadas
```SQL
SELECT Nome_Prod, Nome_Fornec
FROM Fornecedores
INNER JOIN Produtos
ON Fornecedores.Cod_Fornec = Produtos.Cod_Fornec;
```

9. Retornar resultados ordenados em uma consulta
```SQL
SELECT Nome_Prod, Preco_Prod
FROM Produtos
ORDER BY Nome_Prod;
```

10. Apagar todos os dados de uma tabela
```SQL
TRUNCATE TABLE Produtos;
```



_________________________________________________________________________________________________________

Anotações:

- Razão Social VARCHAR(255)
- Nome Fantasia VARCHAR(255)
- CNPJ BIGINT(14), VARCHAR(18)
- Data de Fundação DATE
- Email VARCHAR(100)
- Website VARCHAR(100)
- Telefone BIGINT(14) (Já considera números de 9 dígitos). Na dúvida, use VARCHAR
- Celular BIGINT(14) (Já considera números de 9 dígitos) Na dúvida, use VARCHAR
- Responsável VARCHAR(255), VARCHAR(100)
- Endereço VARCHAR(150)
- Endereço, número VARCHAR(20) (lembre-se: "números" podem conter outros caracteres)
- Bairro VARCHAR(50)
- Cidade VARCHAR(50)
- UF CHAR(2), TINYINT(2) (uso de números se relacionado a outra tabela)
- CEP INT(8), VARCHAR(10)
- Descrição TEXT












