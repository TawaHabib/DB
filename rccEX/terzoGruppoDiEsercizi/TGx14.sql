--
-- 14.Creare una vista costituita dai nomi dei fornitori che effettivamente forniscono almeno una fornitura.
--
use prova_hbb_98;
drop view if exists FornitoriCheForniscono;
create view FornitoriCheForniscono (Nome) as (
	select t1.NOME
    from prova_hbb_98.fornitori_hbb_98 as t1 join prova_hbb_98.forniture_hbb_98 as t2 on t1.COD=t2.FCOD 
    )with local check option;
