Para a criação de um banco de dados, precisamos nos atentar a algumas regras importantes para a organização e construção de tabelas bem estruturadas. 

# Regras de nomenclatura 

Regras de nomenclatura para bancos de dados no SQL Server é essencial para manter organização, padronização e manutenção facilitada ao longo do tempo.

## Boas práticas:

Use nomes descritivos e curtos, mas significativos.
Evite espaços, acentos e caracteres especiais.
Prefira nomes no singular (ex: Financeiro, RH, Vendas).
Caso tenha vários bancos de um mesmo sistema, use prefixos coerentes:


``` ERP_Financeiro ``` 
```  ERP_Compras ``` 
```  ERP_RH ``` 

Exemplo correto:
 
``` ERP_Contabilidade``` 

Evite:
 
``` ERP Contabilidade, ERP_Conta$$, ERPCont``` 

## Nomenclaturas de Tabelas

**Boas práticas:**

Use nomes no singular (cada linha representa um registro de uma entidade).


✅ ``` Cliente, Pedido, Produto ```
❌ ``` Clientes, Pedidos, Produtos ```


Utilize prefixos por área se o banco for grande:


```

Fin_Transacao, Fin_Fatura
RH_Funcionario, RH_Cargo 

``` 


. Evite abreviações confusas (Tbl, T_, tb_) — só use se for padrão institucional.

. Não use palavras reservadas do SQL Server (como Order, User, Group, etc.).

## Nomenclaturas de Colunas

**Boas práticas:**

Use nomes autoexplicativos, curtos e consistentes.


✅ ``` DataCriacao, ValorTotal, IdCliente ```
❌ ``` DtCr, vl_t, cliente_id_x ```


Use camelCase ou PascalCase, e mantenha o padrão em todo o banco.


Exemplo: 

``` DataCriacao, valorTotal ```


Em chaves estrangeiras, use o mesmo nome da chave primária referenciada:


**Tabela Cliente → IdCliente**
**Tabela Pedido → IdCliente** 


## Índices e Constraints

### Índices:

IX_<Tabela>_<Coluna> → IX_Pedido_DataPedido


Se for único: UX_<Tabela>_<Coluna> → UX_Cliente_CPF


### Constraints:

Check constraint: CK_<Tabela>_<Coluna> → CK_Pedido_ValorPositivo


Default constraint: DF_<Tabela>_<Coluna> → DF_Cliente_Ativo


## Outras boas práticas

. Evite nomes ambíguos ou genéricos (Data, Status, Valor) sem contexto.


. Não misture idiomas — escolha entre português ou inglês e mantenha.


. Se usar abreviações, documente-as num glossário interno.


Padronize maiúsculas/minúsculas (SQL Server é case-insensitive, mas consistência ajuda).


Exemplo completo de padrão

### Banco:
 ```ERP_Vendas```

### Tabelas:

```Cliente ```

``` Pedido ``` 


```ItemPedido```


### Colunas:

```Cliente.IdCliente, Cliente.Nome, Cliente.CPF```


```Pedido.IdPedido, Pedido.DataCriacao, Pedido.IdCliente```


```ItemPedido.IdItemPedido, ItemPedido.IdPedido, ItemPedido.Quantidade```


### Chaves:

```PK_Cliente, PK_Pedido, PK_ItemPedido```


```FK_Pedido_Cliente, FK_ItemPedido_Pedido```


### Índices:

```IX_Pedido_DataCriacao```


### Procedure:

```usp_ListarPedidosPorCliente```
