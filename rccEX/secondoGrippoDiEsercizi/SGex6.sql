/*6.	Selezionare il codice e il nome delle parti non fornite da alcun fornitore di Roma*/
SELECT  COD, NOME
FROM prova.PARTI
where COD NOT IN(#parti fornite da almeno un fornitore di Roma
		SELECT distinct PCOD
		FROM PROVA.FORNITURE JOIN prova.fornitori ON(COD=FCOD AND CITTA="ROMA")
				)	