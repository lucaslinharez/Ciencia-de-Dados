# Design de Tabelas no SQL Server

O **design de tabelas** é uma das partes mais importantes do desenvolvimento de um banco de dados.  
Ele define **como os dados serão armazenados, relacionados e acessados**.

---

## O que é uma Tabela

Uma **tabela** é um objeto do banco de dados que **armazena dados em linhas e colunas**, semelhante a uma planilha.  
Cada **coluna** define um **tipo de dado**, e cada **linha** representa um **registro**.

```sql ´´´ 
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100),
    DataCadastro DATE 
); 


## Estrutura Básica de uma Tabela


| Elemento             | Descrição                                                   |
| -------------------- | ----------------------------------------------------------- |
| **Nome da tabela**   | Identifica o objeto no banco (ex: `Clientes`, `Produtos`).  |
| **Colunas (fields)** | Definem o tipo e formato dos dados.                         |
| **Linhas (records)** | Cada linha é um conjunto de dados referentes a uma entrada. |
| **Constraints**      | Regras que controlam integridade e consistência.            |



## Tipos de Dados


| Tipo            | Descrição                           | Exemplo    |
| --------------- | ----------------------------------- | ---------- |
| `INT`           | Número inteiro                      | 100        |
| `BIGINT`        | Inteiro longo                       | 9999999999 |
| `DECIMAL(p, s)` | Número decimal fixo                 | 12.50      |
| `FLOAT`         | Número decimal de precisão variável | 12.3456    |



## Texto


| Tipo          | Descrição                                                       |
| ------------- | --------------------------------------------------------------- |
| `CHAR(n)`     | Texto fixo (mesmo tamanho sempre).                              |
| `VARCHAR(n)`  | Texto variável (até n caracteres).                              |
| `NVARCHAR(n)` | Igual ao `VARCHAR`, mas suporta Unicode (acentos, emojis etc.). |


## Data e Hora


| Tipo        | Descrição                      |
| ----------- | ------------------------------ |
| `DATE`      | Apenas data.                   |
| `TIME`      | Apenas hora.                   |
| `DATETIME`  | Data e hora completas.         |
| `DATETIME2` | Data e hora com mais precisão. |



## Outros tipos


| Tipo               | Descrição                           |
| ------------------ | ----------------------------------- |
| `BIT`              | Valor lógico (0 ou 1).              |
| `UNIQUEIDENTIFIER` | GUID (identificador único global).  |
| `VARBINARY`        | Dados binários (imagens, arquivos). |


## Propriedades das Colunas

Cada coluna pode ter propriedades que controlam o comportamento dos dados.


| Propriedade         | Função                                     |
| ------------------- | ------------------------------------------ |
| **NULL / NOT NULL** | Define se a coluna aceita valores nulos.   |
| **IDENTITY (1,1)**  | Gera valores automáticos (ex: 1, 2, 3...). |
| **DEFAULT**         | Define um valor padrão.                    |
| **PRIMARY KEY**     | Identifica unicamente cada linha.          |
| **FOREIGN KEY**     | Cria relação com outra tabela.             |
| **UNIQUE**          | Garante que os valores não se repitam.     |
| **CHECK**           | Impõe uma condição lógica (ex: idade > 0). |


## Relacionamentos entre Tabelas

As chaves estrangeiras (FOREIGN KEY) garantem a integridade referencial entre tabelas.

CREATE TABLE Vendas (
    VendaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    DataVenda DATETIME DEFAULT GETDATE()
);


## Índices (Indexes)

Os índices aceleram a busca e ordenação de dados.

PRIMARY KEY cria automaticamente um índice.

Índices adicionais podem ser criados em colunas pesquisadas com frequência:

CREATE INDEX idx_NomeCliente ON Clientes(Nome);


## Outras Propriedades de Tabela

| Propriedade          | Descrição                                                        |
| -------------------- | ---------------------------------------------------------------- |
| **Schema**           | Agrupa tabelas logicamente (ex: `dbo.Clientes`).                 |
| **Constraints**      | Regras de integridade (PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE). |
| **Triggers**         | Ações automáticas em eventos (INSERT, UPDATE, DELETE).           |
| **Computed Columns** | Colunas calculadas com base em outras.                           |
| **Partitioning**     | Divide fisicamente grandes tabelas em partes menores.            |



## Boas Práticas de Design

 Use nomes claros e padronizados (ex: tb_Clientes, tb_Vendas).
 Sempre defina chaves primárias.
 Use tipos de dados adequados — nem sempre o maior é o melhor.
 Evite colunas NULL quando possível.
 Crie índices em colunas usadas em WHERE ou JOIN.
 Documente a estrutura com comentários.

 
 ## Exemplo Completo


 CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    DataCadastro DATE DEFAULT GETDATE()
);

CREATE TABLE Produtos (
    ProdutoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) CHECK (Preco > 0),
    Estoque INT DEFAULT 0
);

CREATE TABLE Vendas (
    VendaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL FOREIGN KEY REFERENCES Clientes(ClienteID),
    DataVenda DATETIME DEFAULT GETDATE()
);

CREATE TABLE ItensVenda (
    ItemID INT IDENTITY(1,1) PRIMARY KEY,
    VendaID INT FOREIGN KEY REFERENCES Vendas(VendaID),
    ProdutoID INT FOREIGN KEY REFERENCES Produtos(ProdutoID),
    Quantidade INT CHECK (Quantidade > 0)
);
