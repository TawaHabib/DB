--
-- 10.Creare un vista costituita dal codice dei fornitori, il nome delle parti per quelle parti e per quei fornitori che non sono 
-- della stessa citta’
--
use prova_hbb_98;
drop view if exists cittaFornitoreDiversaDaCittaParte;
create view cittaFornitoreDiversaDaCittaParte (codice, nomeParte) as (
	select t3.cod, t1.cod
    from prova_hbb_98.parti_hbb_98 as t1,prova_hbb_98.forniture_hbb_98 as t2,prova_hbb_98.fornitori_hbb_98 as t3
	where t1.cod=t2.pcod and t2.fcod=t3.com and t1.citta<>t3.citta
)
