/*Per ogni MANSIONE determinare:
	1	Il numero ZEROSUP di dipartimenti nei quali nessun dipendente svolge quella mansione
	2	il numero UNOSUP di dipartimenti nei quali un solo dipendente svolge quella mansione
	3	il numero DUESUP di dipartimenti nei quali almeno due dipendente svolgono quella mansione;
Elencare tutte le MANSIONE, assieme a ZEROSUP, UNOSUP e DUESUP.
*/
SELECT		T0.MANSIONE,
			coalesce(T1.ZEROSUP, "0") AS ZEROSUP, 
			coalesce(T2.UNOSUP, "0") AS UNOSUP, 
            coalesce(T3.DUESUP, "0") AS DUESUP
FROM 	
		(###########----MANSIONI----##########
        SELECT DISTINCT MANSIONE FROM prova.dipendenti
        ) AS T0
LEFT JOIN 
		(###########----ZEROSUP----##########
		SELECT MANSIONE,  COUNT(NUM_DIPART) AS ZEROSUP
		FROM 
				(SELECT NUM_DIPART FROM prova.dipart)AS T1,
				(SELECT DISTINCT MANSIONE FROM prova.dipendenti) AS T2
		where (NUM_DIPART,MANSIONE)
			NOT IN (SELECT DISTINCT  NUM_DIPART, MANSIONE FROM prova.dipendenti where NUM_DIPART IS NOT NULL)
		group by MANSIONE
        )AS T1 ON T0.MANSIONE=T1.MANSIONE 
LEFT JOIN
		(###########----UNOSUP----##########
        SELECT MANSIONE, COUNT(DISTINCT NUM_DIPART) AS UNOSUP
		FROM(
				SELECT  MANSIONE,NUM_DIPART
				FROM prova.dipendenti
				group by MANSIONE,NUM_DIPART 
				having count(NUM_DIPART)=1) AS T1
		group by MANSIONE
            )AS T2 ON T0.MANSIONE=T2.MANSIONE
LEFT JOIN
		(###########----DUESUP----##########
		SELECT MANSIONE, COUNT(DISTINCT NUM_DIPART) AS DUESUP
		FROM(
				SELECT  MANSIONE,NUM_DIPART
				FROM prova.dipendenti
				group by MANSIONE,NUM_DIPART 
				having count(NUM_DIPART)>1) AS T1
		group by MANSIONE)AS T3 ON T0.MANSIONE=T3.MANSIONE
ORDER BY MANSIONE
