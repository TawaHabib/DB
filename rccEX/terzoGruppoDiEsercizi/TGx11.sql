--
-- 11.Creare una vista costituita da tutte le tuple relative a tutti i fornitori che risiedono a MILANO
--
use prova_hbb_98;
drop view if exists fornitoriDiMilano;
create view fornitoriDiMilano (COD,NOME,CITTA) as (
	select *
    from prova_hbb_98.fornitori_hbb_98
	where CITTA="MILANO"
    ) with local check option
