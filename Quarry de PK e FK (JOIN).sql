SELECT * FROM ClienteTeste
SELECT * FROM Enderecos

INSERT INTO Enderecos VALUES (4, 'Rua Teste', 'Bairro teste', 'Cidade teste', 'SP')

--Testar se as tabelas fazem referência entre si
select * from ClienteTeste where Id = 4
select * from Enderecos where IdCliente = 4

--Junta as tabelas seguindo o padrão imposto
SELECT
	C.Nome,
	C.Sobrenome,
	C.Email,
	E.Rua,    --Tirou a chave primaria das 2 tabelas (e o id do endereço)
	E.Bairro,
	E.Cidade,
	E.Estado
FROM
	ClienteTeste C --Chamou a tabela cliente de C e Endereço de E
INNER JOIN Enderecos E ON C.Id = E.IdCliente --INNER JOIN junta uma tabela ON linkando os IDS
WHERE C.Id = 4