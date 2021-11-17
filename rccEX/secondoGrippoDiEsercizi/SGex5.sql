/*5.	Selezionare il codice dei prodotti per cui non  e’ fornita alcuna parte rossa da nessun fornitore di Milano*/

SELECT  COD
FROM prova.PRODOTTI
where COD NOT IN(#Prodotti per cui  e’ fornita ALMENO UNA parte rossa dAI fornitore di Milano
		SELECT distinct PRCOD
		FROM PROVA.FORNITURE JOIN prova.fornitori ON(COD=FCOD AND CITTA="MILANO")
		where (PCOD) IN (#PARTI ROSSE
						SELECT CODICE_PARTE
                        FROM PROVA.PARTIDIPROVE
						where COLORE_PARTE="ROSSO"
						)
				)	

