--1) Fazer em SQL Server os seguintes algoritmos:
--a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
DECLARE @numero INT
SET @numero = 30
IF (@numero % 2 = 0)
BEGIN
    PRINT 'múltiplo de 2'
END
IF (@numero % 3 = 0)
BEGIN
    PRINT 'múltiplo de 3'
END
IF (@numero % 5 = 0)
BEGIN
    PRINT 'múltiplo de 5'
END
ELSE
BEGIN
    PRINT 'Não é múltiplo de 2, 3 ou 5'
END
--b) Fazer um algoritmo que leia 3 números e mostre o maior e o menor
 DECLARE @n1 INT,
         @n2 INT,
		 @n3 INT,
		 @maior INT,
		 @menor INT
SET @n1 = 14
SET @n2 = 9
SET @n3 = 20
IF (@n1 > @n2 AND @n1 >@n3 AND @n2 < @n3)
BEGIN
      SET @maior = @n1
	  SET @menor = @n2
END
ELSE 
BEGIN
     SET @menor = @n1
END 
IF (@n2 > @maior AND @n2 >@n3 AND @n3 < @n2)
BEGIN
     SET @maior = @n2
	 SET @menor = @n3
END 
ELSE 
BEGIN
     SET @maior = @n3
	 SET @menor = @n2
END
PRINT 'maior número = ' + CAST(@maior AS VARCHAR(10))
PRINT 'menor número = ' + CAST(@menor AS VARCHAR(10))

--c) Fazer um algoritmo que calcule os 15 primeiros termos da série
--1,1,2,3,5,8,13,21,...
--E calcule a soma dos 15 termos
 DECLARE @n INT,
         @aux INT,
		 @i INT,
		 @soma INT,
		 @anterior INT
SET @n = 1
SET @aux = 1
SET @anterior = 0
SET @soma = 0 
WHILE(@n <=15)
BEGIN
     PRINT @aux
	 SET @soma = @soma + @aux
	 SET @i = @aux + @anterior
	 SET @anterior = @aux
	 SET @aux = @i
	 SET @n = @n + 1
END
PRINT 'soma = ' + CAST(@soma AS VARCHAR(10))

--d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em minúsculo (Usar funções UPPER e LOWER)
DECLARE @frase NVARCHAR(MAX)
SET @frase = 'Fazendo a Tarefa de Laboratorio de Banco de Dados'

DECLARE @fraseMaiuscula NVARCHAR(MAX)
SET @fraseMaiuscula = UPPER(@frase)

DECLARE @fraseMinuscula NVARCHAR(MAX)
SET @fraseMinuscula = LOWER(@frase)

PRINT 'frase: ' + @frase
PRINT 'frase em maiúsculas: ' + @fraseMaiuscula
PRINT 'frase em minúsculas: ' + @fraseMinuscula

--e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)
DECLARE @palavra NVARCHAR(MAX)
SET @palavra = 'borboleta'

DECLARE @tamanho INT
SET @tamanho = LEN(@palavra)

DECLARE @palavraInvertida NVARCHAR(MAX)
SET @palavraInvertida = ''

WHILE @tamanho > 0
BEGIN
    SET @palavraInvertida = @palavraInvertida + SUBSTRING(@palavra, @tamanho, 1)
    SET @tamanho = @tamanho - 1
END
PRINT 'palavra : ' + @palavra
PRINT 'palavra invertida: ' + @palavraInvertida

--f) Considerando a tabela abaixo, gere uma massa de dados, com 100 registros, para fins de teste
--com as regras estabelecidas (Não usar constraints na criação da tabela)
--Computador

-- ID incremental a iniciar de 10001
--Marca segue o padrão simples, Marca 1, Marca 2, Marca 3, etc.
--QtdRAM é um número aleatório* dentre os valores permitidos (2, 4, 8, 16)
--TipoHD segue o padrão:
--Se o ID dividido por 3 der resto 0, é HDD
--Se o ID dividido por 3 der resto 1, é SSD
--Se o ID dividido por 3 der resto 2, é M2 NVME
--QtdHD segue o padrão:
-- Se o TipoHD for HDD, um valor aleatório* dentre os valores permitidos (500, 1000 ou 2000)
--Se o TipoHD for SSD, um valor aleatório* dentre os valores permitidos (128, 256, 512)
--FreqHD é um número aleatório* entre 1.70 e 3.20

CREATE DATABASE computador
GO
USE computador
GO
CREATE TABLE computador (
ID       INT           NOT NULL,
Marca    VARCHAR(40)   NOT NULL,
QtdRAM   INT           NOT NULL,
TipoHD   VARCHAR(10)   NOT NULL,
QtdHD    INT           NOT NULL,
FreqCPU  DECIMAL(7,2)  NOT NULL
PRIMARY KEY (ID)
)
DECLARE @qtd INT = 1
DECLARE @ID INT = 10001

WHILE (@qtd <= 100)
BEGIN
    DECLARE @Marca VARCHAR(40)
    DECLARE @QtdRAM INT
    DECLARE @TipoHD VARCHAR(10)
    DECLARE @QtdHD INT
    DECLARE @FreqCPU DECIMAL(4,2)

    SET @Marca = 'Marca ' + CAST(@qtd AS VARCHAR(5))
    SET @QtdRAM = CASE 
                    WHEN RAND() <= 0.25 THEN 2
                    WHEN RAND() <= 0.5 THEN 4
                    WHEN RAND() <= 0.75 THEN 8
                    ELSE 16
                 END

    IF @ID % 3 = 0
        SET @TipoHD = 'HDD'
    ELSE IF @ID % 3 = 1
        SET @TipoHD = 'SSD'
    ELSE
        SET @TipoHD = 'M2 NVME'

    IF @TipoHD = 'HDD'
        SET @QtdHD = (SELECT TOP 1 value FROM STRING_SPLIT('500,1000,2000', ',') ORDER BY NEWID())
    ELSE IF @TipoHD = 'SSD'
        SET @QtdHD = (SELECT TOP 1 value FROM STRING_SPLIT('128,256,512', ',') ORDER BY NEWID())
    ELSE
        SET @QtdHD = 0 

    SET @FreqCPU = RAND() * (3.20 - 1.70) + 1.70

    INSERT INTO computador
    VALUES (@ID, @Marca, @QtdRAM, @TipoHD, @QtdHD, @FreqCPU)

    SET @qtd = @qtd + 1
    SET @ID = @ID + 1 
END

SELECT *FROM computador