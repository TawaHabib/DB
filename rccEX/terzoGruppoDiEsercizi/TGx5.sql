--
-- 5. Costruire una tabella contenente un elenco di codici di prodotti che si riferiscono a prodotti di ROMA oppure a 
-- prodotti forniti da fornitori di ROMA.
--
use prova_hbb_98;
drop view if exists prodottiDiROMA;
create view prodottiDiROMA (codice) as (
		(#prodotti di  di ROMA
		select Cod 
        from prova_hbb_98.prodotti_hbb_98
        where citta="ROMA")
        UNION
        (#prodotti forniti da fornitori di ROMA
        select PRCOD 
        from prova_hbb_98.fornitori_hbb_98 as t1 join prova_hbb_98.forniture_hbb_98  as t2 on fcod=cod
        where t1.CITTA="ROMA")
);
