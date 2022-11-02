--Criando a tabela PRODUTOS
CREATE TABLE Produtos (
	Id int IDENTITY(1,1) NOT NULL, --BD gerenciará o ID (IDENTITY - auto incrementado)
	Nome varchar(255) NOT NULL,
	Cor varchar(50) NULL,
	Preco decimal(13,2) NOT NULL, --13 digitos com 2 casas decimais
	Tamanho varchar(5) NULL,
	Genero char(1) NULL
)

SELECT * FROM Produtos
