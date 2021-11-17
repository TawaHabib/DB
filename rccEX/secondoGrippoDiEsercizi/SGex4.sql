/*4.	Elencare i nomi dei fornitori che forniscono tutte le parti di Genova*/
SELECT P1.NOME
FROM prova.fornitori AS P1 join PROVA.FORNITURE AS P2 ON (P1.COD=P2.FCOD)
where COD NOT IN (	
		SELECT distinct  FCOD
		FROM PROVA.FORNITURE
		where PCOD NOT IN (
							select cod from prova.parti
							where citta="GENOVA"
							)
				 )