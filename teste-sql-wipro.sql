-- Criação do banco de dados
CREATE DATABASE TesteSqlWipro;
GO

-- Comando para usar o banco de dados criado
USE TesteSqlWipro;
GO

-- Criação das tabelas
CREATE TABLE tb_Status(
	idStatus INT PRIMARY KEY IDENTITY,
	dsStatus VARCHAR(50) NOT NULL,
);
GO

CREATE TABLE tb_Processo(
	idProcesso INT PRIMARY KEY IDENTITY NOT NULL,
	nroProcesso BIGINT NOT NULL,
	Autor VARCHAR(90) ,
	DtEntrada DATE,
	DtEncerramento DATE,
	idStatus INT FOREIGN KEY REFERENCES tb_Status(idStatus)
);
GO

CREATE TABLE tb_Andamento(
	idAndamento INT PRIMARY KEY IDENTITY NOT NULL,
	idProcesso INT FOREIGN KEY REFERENCES tb_Processo(idProcesso) NOT NULL,
	dtAndamento DATE,
	dsMovimento VARCHAR(2000)
);
GO

-- Populando as tabelas 
INSERT INTO tb_Status (dsStatus) 
	VALUES	('Esse é o status 1'),
			('Esse é o status 2');
GO


INSERT INTO tb_Processo (nroProcesso, Autor, idStatus, DtEntrada, DtEncerramento)
	VALUES	(1, 'Autor 1',1, '2010-03-05', '2013-02-01' ),
			(2, 'Autor 2',2, '2015-06-20', '2017-02-01' )
GO

INSERT INTO tb_Processo (nroProcesso, Autor, DtEntrada, DtEncerramento)
	VALUES	(3, 'Autor sem status', '2010-09-05', '2013-12-01')
GO

SELECT * FROM tb_Andamento

INSERT INTO tb_Andamento (idProcesso, dtAndamento, dsMovimento)
	VALUES	(1, '2015-12-01', 'dsMovimento 1'),
			(2, '2013-12-01', 'dsMovimento 2')
GO



-- Comando 1:
SELECT P.*, S.dsStatus 
FROM tb_Processo P
INNER JOIN tb_Status S
ON P.idStatus = S.idStatus

-- Comando 2:
SELECT MAX(A.dtANdamento)
AS 'Maior data de andamento com processos encerrados em 2013'
FROM tb_Andamento A
INNER JOIN tb_Processo P
ON P.idProcesso = A.idProcesso
WHERE YEAR(P.DtEncerramento) = 2013

-- Comando 3:


