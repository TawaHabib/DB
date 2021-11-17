/*traccia corretta: numero di dirigenti di ogni dipartimento*/

	select DISTINCT count(DISTINCT matricola) AS NUM_DIRIG , t2.NUM_DIPART
	from  prova.dipart as t2, prova.dipendenti as t1
	where t2.NUM_DIPART=t1.Num_dipart and t1.MANSIONE="DIRIGENTE"
	group by t1.num_dipart
;
/*
 *TRACCIA SCORRETTA BBOH
*/
/*NUMERO DI DIRIGENTI CHE LAVORANO IN TUTTI I DIPARTIMENTI*/
SELECT COUNT(MATRICOLA) AS NUM_DIR
from prova.dipendenti
where MANSIONE="DIRIGENTE" AND (MATRICOLA) NOT IN
(	/*CASI SPURI*/
	SELECT distinct MATRICOLA 
	FROM
		(	
			SELECT  MATRICOLA, NUM_DIPART
			FROM 	(	SELECT NUM_DIPART 
						FROM PROVA.DIPART) AS T1,
					(	SELECT MATRICOLA 
						FROM PROVA.DIPENDENTI 
						WHERE MANSIONE="DIRIGENTE")AS T2 
			where   (MATRICOLA, NUM_DIPART )NOT IN	/*MENO*/
				/*CASI REALI*/
			((	SELECT MATRICOLA, NUM_DIPART
				FROM PROVA.DIPENDENTI 
				where mansione="DIRIGENTE")
				union 
				(select DISTINCT T1.SUP AS MATRICOLA, T1.NUM_DIPART
				from prova.dipendenti as t1,prova.dipendenti AS T2
				where t1.SUP=t2.matricola AND T2.MANSIONE="DIRIGENTE"
					))) AS CasSPU)
