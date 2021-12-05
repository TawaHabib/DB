use prova_hbb_98;
--
-- 3. Cambiare il colore di tutte le parti che hanno colore 'METALLO' in 'VERDE'
--
update prova_hbb_98.parti_hbb_98
	set colore="verde"
    where colore="METALLO";
--
-- 4. Creare una tabella in modo che contenga l'elenco dei codici delle parti, per quelle parti fornite da fornitori di 
-- MILANO o facenti parte di prodotti di MILANO.
-- 
use prova_hbb_98;
drop view if exists partiMilano;
create view partiMilano (codice) as (
		(#parti di milano
		select Cod 
        from prova_hbb_98.parti_hbb_98 
        where citta="MILANO")
        UNION
        (#parti fornite da fornitori di milano
        select pcod 
        from prova_hbb_98.fornitori_hbb_98 as t1 join prova_hbb_98.forniture_hbb_98  as t2 on fcod=cod
        where t1.CITTA="milano")
);
