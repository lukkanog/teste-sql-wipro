# Teste SQL Wipro
Questões de teste para SQL.

### Comando 1:

``` 
SELECT P.*, S.dsStatus 
FROM tb_Processo P
INNER JOIN tb_Status S
ON P.idStatus = S.idStatus
```   

### Comando 2:

```
SELECT MAX(A.dtANdamento)
AS 'Maior data de andamento com processos encerrados em 2013'
FROM tb_Andamento A
INNER JOIN tb_Processo P
ON P.idProcesso = A.idProcesso
WHERE YEAR(P.DtEncerramento) = 2013
```


### Comando 3:

```
SELECT DtEncerramento, COUNT(DtEncerramento) as 'Quantidade'
FROM tb_Processo
GROUP BY DtEncerramento
HAVING COUNT(DtEncerramento) > 5
```

### Comando 4:

```
SELECT RIGHT('000000000000' + CAST(nroProcesso as VARCHAR(12)), 12) 
AS 'Números de identificação dos processos'	
FROM tb_Processo
```
