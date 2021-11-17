SELECT COD 
FROM prova.fornitORI
WHERE CITTA=(SELECT CITTA 
			FROM prova.fornitORI 
            WHERE COD="F001");