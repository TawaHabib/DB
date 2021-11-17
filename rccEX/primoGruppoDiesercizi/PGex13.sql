SELECT NOME_IMP, MATRICOLA FROM prova.dipendenti AS D1
WHERE STIPENDIO>(	SELECT STIPENDIO 
					FROM prova.dipendenti AS D2 
                    where D2.MATRICOLA=D1.SUP);