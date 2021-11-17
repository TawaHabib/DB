
select numero_dipendenti, media_stipendio, num_dipart,nome_dipart
from(
		select numero_dipendenti,media_stipendio,massimo_sti,min_sti, num_dipart,nome_dipart
        from
			(SELECT 	COUNT(MATRICOLA) 	AS NUMERO_DIPENDENTI,
				avg(STIPENDIO+COMMISS) 		AS MEDIA_STIPENDIO,
				NUM_DIPART 					as num,
				MAX(STIPENDIO)				AS MASSIMO_STI,
				min(STIPENDIO)				AS MIN_STI
			FROM prova.dipendenti
				group by NUM_DIPART) as t1, 
			(select num_dipart, nome_dipart from prova.dipart) as t2
        where t1.num=t2.num_dipart) as t3, (select min(stipendio) as basso from prova.dipendenti)as t4,
        (select max(stipendio) as alto from prova.dipendenti)as t5
where massimo_sti<alto and min_sti>basso
        
        