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

## Comando Essenciais

1. Criar Banco de Dados

```bash
CREATE DATABASE Supermecado;
```

2. Criar Tabelas

```bash
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

```bash
INSERT INTO Fornecedores (Cod_Fornec, Nome_Fornec)
VALUES (1, "Acme");

INSERT INTO Produtos
VALUES (100,"Monitor LCD", 12, 550.00, 1),
(101,"Roteador Banda Larga", 8, 130.00, 1),
(102,"Teclado", 15, 40.00, 1),
(103,"Pendrive 64GB", 22, 48.00, 1);
```

4. Efetuar consulta 
```bash
SELECT Nome_Fornec FROM Fornecedores; // trazendo colunas especificas
SELECT Nome_Prod, Prece_Prod FROM Produtos; // trazendo colunas especificas
SELECT * FROM Produtos; //trazendo todas as colunas 
```

5. Consultando uma tabela com filtros de dados
```bash
SELECT Nome_Prod FROM Produtos
WHERE ID_Prod = 101;
```

6. Alterar um registro na tabela
```bash
UPDATE Produtos
SET Preco_Prod = 630.00
WHERE ID_Prod = 100  // A cláusula WHERE é muito importante se não você fará o update em todos os dados da tabela
```

7. Excluir registros de uma tabela
```bash
DELETE FROM Produtos
WHERE ID_Prod = 101; // A cláusula WHERE é muito importante se não você irá deletar todos os dados da tabela
```

8. Trazer dados de duas ou mais tabelas relacionadas
```bash
SELECT Nome_Prod, Nome_Fornec
FROM Fornecedores
INNER JOIN Produtos
ON Fornecedores.Cod_Fornec = Produtos.Cod_Fornec;
```

9. Retornar resultados ordenados em uma consulta
```bash
SELECT Nome_Prod, Preco_Prod
FROM Produtos;
ORDER BY Nome_Prod;
```

10. Apagar todos os dados de uma tabela
```bash
TRUNCATE TABLE Produtos;
```



_________________________________________________________________________________________________________


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












