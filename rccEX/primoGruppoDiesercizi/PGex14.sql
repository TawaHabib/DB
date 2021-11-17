SELECT NOME_IMP, MATRICOLA FROM
						(		SELECT NOME_IMP, MATRICOLA, STIPENDIO,MEDIA
								FROM (	SELECT 		NUM_DIPART, avg(STIPENDIO) AS MEDIA 
										FROM 		prova.dipendenti 
                                        group by 	NUM_DIPART)AS T1, prova.dipendentI AS T2 
										WHERE 	T2.NUM_DIPART=T1.NUM_DIPART) AS T3
								
WHERE T3.STIPENDIO >T3.MEDIA 

