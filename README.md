Exercícios:
1) Fazer em SQL Server os seguintes algoritmos:
a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
b) Fazer um algoritmo que leia 3 números e mostre o maior e o menor
c) Fazer um algoritmo que calcule os 15 primeiros termos da série
1,1,2,3,5,8,13,21,...
E calcule a soma dos 15 termos
d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em
minúsculo (Usar funções UPPER e LOWER)
e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)
f) Considerando a tabela abaixo, gere uma massa de dados, com 100 registros, para fins de teste
com as regras estabelecidas (Não usar constraints na criação da tabela)
Computador
ID Marca QtdRAM TipoHD QtdHD FreqCPU
INT (PK) VARCHAR(40) INT VARCHAR(10) INT DECIMAL(7,2)

• ID incremental a iniciar de 10001
• Marca segue o padrão simples, Marca 1, Marca 2, Marca 3, etc.
• QtdRAM é um número aleatório* dentre os valores permitidos (2, 4, 8, 16)
• TipoHD segue o padrão:
o Se o ID dividido por 3 der resto 0, é HDD
o Se o ID dividido por 3 der resto 1, é SSD
o Se o ID dividido por 3 der resto 2, é M2 NVME
• QtdHD segue o padrão:
o Se o TipoHD for HDD, um valor aleatório* dentre os valores permitidos (500, 1000 ou 2000)
o Se o TipoHD for SSD, um valor aleatório* dentre os valores permitidos (128, 256, 512)
• FreqHD é um número aleatório* entre 1.70 e 3.20
