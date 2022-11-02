SELECT * FROM Produtos 

--CONTARÁ OS DADOS DA TABELA PRODUTO
SELECT COUNT (*) FROM Produtos 

--CONTARÁ OS DADOS DA TABELA PRODUTO, ADICIONANDO O NOME A TABELA DO COUNT
SELECT COUNT (*) QuantidadeProdutos FROM Produtos 

--CONTARÁ OS DADOS DA TABELA PRODUTO, QUE ATENDEREM A CONDIÇÃO DO WHERE
SELECT COUNT (*) QuantProTamM FROM Produtos WHERE Tamanho = 'M'

--Retorna o valor do somatório de uma determinada coluna
SELECT SUM(Preco) ValorProdutos FROM Produtos

--Retorna o valor do somatório de uma determinada coluna, atendendo a uma condição
SELECT SUM(Preco) PreçoTamM FROM Produtos WHERE Tamanho = 'M'

--Retorna o valor Máximo de uma tabela, pode colocar a condição
SELECT MAX(Preco) Maximo FROM Produtos 

--Retorna o valor Mínimo de uma tabela, pode colocar a condição
SELECT MIN(Preco) Minimo FROM Produtos 

--Retorna a Média dos valores de uma tabela, pode colocar a condição
SELECT AVG(Preco) Média FROM Produtos 

--Concatenando colunas (juntando em 1), tudo junto
SELECT Nome + ' - ' + Cor FROM Produtos 

--Explicando a concatenação Linha a linha 
SELECT 
Nome + ' - ' + Cor --Concatenação
NomeCor --Nome da coluna concatenada
FROM Produtos 

--Upper e Lower: pega uma coluna e coloca as letras para maiúsculo ou minúsculo
SELECT UPPER(Nome) Nome FROM Produtos 

--Concatenação + UPPER e LOWER
SELECT 
Nome + ' - ' + Cor NomeCor,
UPPER(Nome) Nome, --Coloca a coluna Nome Maiúscula
LOWER(Cor) Cor --Coloca a coluna Cor Minúsculo
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
UPPER(Nome) Nome, --Coloca a coluna Nome Maiúscula
LOWER(Cor) Cor, --Coloca a coluna Cor Minúsculo
FORMAT(DataCadastro, 'dd/MM/yyyy - HH:mm') DataCadastro --Formata a Data seguindo o padrão que quiser
FROM Produtos

--Agrupar propriedades semelhantes e conta-las usando o GROUP BY
SELECT
	Tamanho,
	COUNT(*) Quantidade
FROM Produtos
GROUP BY Tamanho --Seleciona esse grupo para analisar (contar)

--Agrupar propriedades semelhantes e conta-las usando o GROUP BY, com uma condição
SELECT
	Tamanho,
	COUNT(*) Quantidade
FROM Produtos
WHERE Tamanho <> '' --Condição de ser diferente de vazio (NULL)
GROUP BY Tamanho --Seleciona esse grupo para analisar (contar)

--Agrupar propriedades semelhantes e conta-las usando o GROUP BY, com uma condição e colocando em uma ordem
SELECT
	Tamanho,
	COUNT(*) Quantidade
FROM Produtos
WHERE Tamanho <> '' --Condição de ser diferente de vazio (NULL)
GROUP BY Tamanho --Seleciona esse grupo para analisar (contar)
ORDER BY Quantidade DESC --Ordena na ordem decrescente
