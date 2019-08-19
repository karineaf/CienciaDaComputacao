/*1. Nome de cada cidade e o nome do seu estado*/
Select c.nomeCidade, e.NomeUF
from Cidade c inner join UF e
on c.IdUF = e.IdUF

/*2. Nome de cada pessoa e o da cidade onde reside*/
Select p.nomePessoa, c.nomeCidade
from Cidade c inner join Pessoa p
on p.CidadeReside = c.IdCidade

/*3. Nome de cada pessoa e nome da cidade e do estado onde reside*/
Select p.nomePessoa, c.nomeCidade, e.NomeUF
from Cidade c inner join UF e
on c.IdUF = e.IdUF inner join Pessoa p
on p.CidadeReside = c.IdCidade

/*4. Nome de cada estado e a quantidade de pessoas que vivem no estado.*/
SELECT e.nomeUF, Count(*) as 'Qtd de Pessoas'
FROM Cidade c inner join UF e
on c.IdUF = e.IdUF inner join Pessoa p
on p.CidadeReside = c.IdCidade
GROUP BY e.nomeUF

/*5. Lista cada pessoa com os seus veículos. Mostrar nome da pessoa, placa, ano e nome da cidade
onde esta licenciado cada veículo.*/
SELECT p.nomePessoa, v.placa, v.ano, c.nomeCidade
FROM Pessoa p inner join Veiculo v
ON p.IdPessoa = v.IdPessoa inner join Cidade c
ON  v.Cidade = c.IdCidade

/*6. Lista o nome das pessoas, a placa, a cor e o nome do fabricante, das pessoas que residem na
cidade de São Paulo (código 134).*/
SELECT p.nomePessoa, v.placa, v.cor, f.nomeFabricante
FROM Pessoa p inner join Veiculo v
ON p.IdPessoa = v.IdPessoa inner join Fabricante f
ON v.Marca = f.IdFabricante inner join Cidade c
ON  v.Cidade = c.IdCidade
WHERE c.IdCidade = 134

/*7. Lista o nome das pessoas, a placa, a cor e o nome do fabricante, das pessoas que residem na
cidade de São Paulo (código 134) e que possuem veículo Fiat preto.*/
SELECT p.nomePessoa, v.placa, v.cor, f.nomeFabricante
FROM Pessoa p inner join Veiculo v
ON p.IdPessoa = v.IdPessoa inner join Fabricante f
ON v.Marca = f.IdFabricante inner join Cidade c
ON  v.Cidade = c.IdCidade
WHERE c.IdCidade = 134 And v.Marca = 'Fiat' and v.Cor = 'preto'

/*8. Lista nome das cidades que possuem veículos mais antigos que a média de todos os veículos.*/
SELECT c.nomeCidade
FROM Cidade c inner join Veiculo v
ON v.Cidade = c.IdCidade
WHERE v.Ano < (SELECT avg(ano) FROM Veiculo v)

/*9. Lista dos veiculos mais antigos do estado de SP. Mostrar placa, marca, cor, ano e nome da
cidade onde está licenciado.*/
SELECT v.placa, v.marca, v.cor, v.ano, c.nomeCidade
FROM Veiculo v inner join Cidade c
ON v.Cidade = c.IdCidade
WHERE v.Ano = ( SELECT min(ano) 
FROM Veiculo v INNER JOIN Cidade c
ON v.Cidade = c.IdCidade
WHERE c.IdUF = 'sp')

/*10.Quantidade de veículos em cada cidade. Mostrar os nomes das cidades.*/
SELECT c.nomeCidade, Count(*) as 'Qtd de Veículos'
FROM Veiculo v inner join Cidade c 
ON v.Cidade = c.IdCidade
GROUP BY c.NomeCidade
