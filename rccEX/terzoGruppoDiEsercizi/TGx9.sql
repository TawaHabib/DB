--
-- 9. Creare una tabella in cui si memorizza, per ogni parte, il suo codice e la quantita’ totale fornita per quella parte (da 
-- tutti i fornitori).
--
use prova_hbb_98;
drop view if exists Quantitaparti;
create view Quantitaparti (codice, quantita) as (
	select t1.cod, coalesce(t2.quantita, "0")
    from prova_hbb_98.parti_hbb_98 as t1
    left join 
			(#quantita
				select pcod, sum(quantita) as quantita
				from prova_hbb_98.forniture_hbb_98
                group by pcod
            ) as t2
	on cod=pcod

)
