SELECT * FROM Produtos

-- ALT + F1 + Tabela(selecionado) = especificações da tabela

-- Alterando a tabela e colocando o nome como único

ALTER TABLE Produtos
ADD UNIQUE (Nome)

INSERT INTO Produtos (Nome, Preco, Tamanho, Genero, DataCadastro)
VALUES ('Mountain Bike Socks, M', 10, 'G', 'M', GETDATE())

--Colocando um validador para a coluna 

ALTER TABLE Produtos
ADD CONSTRAINT CHK_ColunaGenero CHECK(Genero = 'U' OR Genero = 'M' OR Genero = 'F')

INSERT INTO Produtos (Nome, Preco, Tamanho, Genero, DataCadastro)
VALUES ('Mountain Bike Socks2, M', 10, 'G', 'U', GETDATE())

-- Colocando um valor padão para a coluna, caso o mesmo seja omitido

ALTER TABLE Produtos
ADD DEFAULT GETDATE() FOR DataCadastro

INSERT INTO Produtos (Nome, Preco, Tamanho, Genero)
VALUES ('Mountain Bike Socks 3, M', 10, 'G', 'U')

-- Apagendo um constraint -- ALT + F1 + TABELA,	VAI PROCURAR O NOME DELA PARA ADICIONAR AO COMANDO

ALTER TABLE Produtos
DROP CONSTRAINT UQ__Produtos__7D8FE3B21CFAD07E

--Criando uma procedure

CREATE PROCEDURE InserirNovoProduto
@Nome varchar(255),
@Cor varchar(50),
@Preco decimal,
@Tamanho varchar(5),
@Genero varchar(1)

AS

INSERT INTO Produtos (Nome, Cor, Preco, Tamanho, Genero)
Values (@Nome, @Cor, @Preco, @Tamanho, @Genero)

-- Executando a Procedure

EXECUTE InserirNovoProduto
'Produto Procedure', -- @Nome
'Colorido', -- @Cor
40, -- @Preco
'G', -- @Tamanho
'U' -- @Genero

-- Procedure para o SELECT

CREATE PROCEDURE ProdutoPeloTamanho
@TamanhoP varchar(5)

AS

SELECT * FROM Produtos WHERE Tamanho = @TamanhoP

-- Usando a procedure acima

EXECUTE ProdutoPeloTamanho 'G'

-- Procedure para o SELECT

CREATE PROCEDURE ProdutosTabela

AS

SELECT * FROM Produtos 

-- Ao inves de escrever os codigos, usasse a procedure

EXECUTE ProdutosTabela


-- Function para o deconto de 10%

--Ao inves do abaixo

SELECT
	Nome,
	Preco,
	FORMAT (Preco - Preco / 100 * 10, 'N2') PrecoDesconto
FROM Produtos WHERE Tamanho = 'M'

-- Voce cria uma FUNCTION 

CREATE FUNCTION CalcularDesconto(@Preco DECIMAL, @Porcentagem INT)
RETURNS DECIMAL (13, 2)

BEGIN
	RETURN @Preco - @Preco / 100 * @Porcentagem
END

-- E usa a Function

SELECT
	Nome,
	Preco,
	dbo.CalcularDesconto(Preco, 10) PrecoDesconto -- dbo. , precisa ser usado para chamar a função
FROM Produtos WHERE Tamanho = 'M'




