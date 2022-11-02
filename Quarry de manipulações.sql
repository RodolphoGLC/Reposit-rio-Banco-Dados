SELECT * FROM Produtos 

--CONTAR� OS DADOS DA TABELA PRODUTO
SELECT COUNT (*) FROM Produtos 

--CONTAR� OS DADOS DA TABELA PRODUTO, ADICIONANDO O NOME A TABELA DO COUNT
SELECT COUNT (*) QuantidadeProdutos FROM Produtos 

--CONTAR� OS DADOS DA TABELA PRODUTO, QUE ATENDEREM A CONDI��O DO WHERE
SELECT COUNT (*) QuantProTamM FROM Produtos WHERE Tamanho = 'M'

--Retorna o valor do somat�rio de uma determinada coluna
SELECT SUM(Preco) ValorProdutos FROM Produtos

--Retorna o valor do somat�rio de uma determinada coluna, atendendo a uma condi��o
SELECT SUM(Preco) Pre�oTamM FROM Produtos WHERE Tamanho = 'M'

--Retorna o valor M�ximo de uma tabela, pode colocar a condi��o
SELECT MAX(Preco) Maximo FROM Produtos 

--Retorna o valor M�nimo de uma tabela, pode colocar a condi��o
SELECT MIN(Preco) Minimo FROM Produtos 

--Retorna a M�dia dos valores de uma tabela, pode colocar a condi��o
SELECT AVG(Preco) M�dia FROM Produtos 

--Concatenando colunas (juntando em 1), tudo junto
SELECT Nome + ' - ' + Cor FROM Produtos 

--Explicando a concatena��o Linha a linha 
SELECT 
Nome + ' - ' + Cor --Concatena��o
NomeCor --Nome da coluna concatenada
FROM Produtos 

--Upper e Lower: pega uma coluna e coloca as letras para mai�sculo ou min�sculo
SELECT UPPER(Nome) Nome FROM Produtos 

--Concatena��o + UPPER e LOWER
SELECT 
Nome + ' - ' + Cor NomeCor,
UPPER(Nome) Nome, --Coloca a coluna Nome Mai�scula
LOWER(Cor) Cor --Coloca a coluna Cor Min�sculo
FROM Produtos

--Criando uma coluna por SCRIPT
Alter Table Produtos
ADD DataCadastro DateTime2

--Adiciona o valor a nova tabela (nesse caso a hora atual)
UPDATE Produtos SET DataCadastro = GETDATE() 

--Apagando uma coluna por SCRIPT
ALTER TABLE Produtos
DROP COLUMN DataCadastro

--Alterando o Formato da data usando o FORMAT
SELECT 
Nome + ' - ' + Cor NomeCor,
UPPER(Nome) Nome, --Coloca a coluna Nome Mai�scula
LOWER(Cor) Cor, --Coloca a coluna Cor Min�sculo
FORMAT(DataCadastro, 'dd/MM/yyyy - HH:mm') DataCadastro --Formata a Data seguindo o padr�o que quiser
FROM Produtos

--Agrupar propriedades semelhantes e conta-las usando o GROUP BY
SELECT
	Tamanho,
	COUNT(*) Quantidade
FROM Produtos
GROUP BY Tamanho --Seleciona esse grupo para analisar (contar)

--Agrupar propriedades semelhantes e conta-las usando o GROUP BY, com uma condi��o
SELECT
	Tamanho,
	COUNT(*) Quantidade
FROM Produtos
WHERE Tamanho <> '' --Condi��o de ser diferente de vazio (NULL)
GROUP BY Tamanho --Seleciona esse grupo para analisar (contar)

--Agrupar propriedades semelhantes e conta-las usando o GROUP BY, com uma condi��o e colocando em uma ordem
SELECT
	Tamanho,
	COUNT(*) Quantidade
FROM Produtos
WHERE Tamanho <> '' --Condi��o de ser diferente de vazio (NULL)
GROUP BY Tamanho --Seleciona esse grupo para analisar (contar)
ORDER BY Quantidade DESC --Ordena na ordem decrescente
