USE WideWorldImporters;

SELECT * 
FROM Application.StateProvinces;

-- Funções de agregação permite agregar os dados e fazer contagens e outros

-- Conta os registros, mas a coluna não possui nome, está em branco porque não temos um nome para o COUNT
SELECT COUNT(*) 
FROM Application.StateProvinces;

--Alias (AS) | O comando AS permite a contagem de todos os registros do (*), e vai nomear a tabela "CountOFStates" 
SELECT COUNT(*) AS CountOfStates  
FROM Application.StateProvinces;

-- Também realiza contagem, mas possui uma clausula de restrição "WHERE SalesTerritory"
SELECT COUNT(*) AS CountOfStates
FROM Application.StateProvinces
WHERE SalesTerritory = 'Southwest';

-- Realiza a contagem e verifica qual é o maior " > " 
SELECT COUNT(*) AS CountOfStates
FROM Application.StateProvinces
WHERE LatestRecordedPopulation > 5000000;


-- Agrupando registros
SELECT SalesTerritory, StateProvinceName
FROM Application.StateProvinces
ORDER BY SalesTerritory;

-- Função de agregação GROUP BY
SELECT SalesTerritory, Count(StateProvinceName) AS NumberOfStates
FROM Application.StateProvinces
GROUP BY SalesTerritory
ORDER BY SalesTerritory;


-- Máximo, Mínimo e Média | Precisa de uma tabela especifica selecionada e não tudo (*)
SELECT MAX(*) 
FROM Application.StateProvinces;

-- Corrigido, contando os valores de população em cada local
SELECT MAX(LatestRecordedPopulation) AS MaxPopulation,
	MIN(LatestRecordedPopulation) AS MinPopulation,
	AVG(LatestRecordedPopulation) AS AvgPopulation
FROM Application.StateProvinces;


-- Subquery ou subconsulta
SELECT StateProvinceName, LatestRecordedPopulation
FROM Application.StateProvinces
WHERE LatestRecordedPopulation =
	(SELECT MAX(LatestRecordedPopulation) FROM Application.StateProvinces)
;

SELECT StateProvinceName, LatestRecordedPopulation
FROM Application.StateProvinces
WHERE LatestRecordedPopulation >
	(SELECT AVG(LatestRecordedPopulation) FROM Application.StateProvinces)
;