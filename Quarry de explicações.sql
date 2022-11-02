--SELECT * FROM ClienteTeste --Mostra a tabela
--WHERE Nome LIKE '%R%' --Filtra a tabela
--ORDER BY Nome --Ordena a tabela

--Insere valores na tabela
--INSERT INTO ClienteTeste VALUES ('Rod','Cout','emmail',0,'Jun 11 2002 13:00PM')
--INSERT INTO ClienteTeste (Nome, Sobrenome, Email, AceitaComunicados, DataCadastro)
--VALUES ('Rod','Cout','emmail',0,'Jun 11 2002 13:00PM')

SELECT * FROM ClienteTeste

SELECT * FROM ClienteTeste WHERE Nome = 'Ken' --Tabela já com 1 busca

BEGIN TRAN --Antes de um update execute isso, p/ ter um SavePoint
ROLLBACK --Se der ruim com o WHERE e o DELETE, acione o ROLLBACK

--Faz a alteração apenas onde o WHERE está indicando
UPDATE ClienteTeste
SET Email = 'email.UPDATE@email.com'

--Deleta uma parte da tabela ClienteTeste
DELETE ClienteTeste
WHERE Id = 28

