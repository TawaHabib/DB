--
-- 13.Creare una vista costituita dai codici e relative citta’ dei prodotti forniti dal fornitore F001. NB: ove si ritenga 
-- opportuno, nella creazione delle viste si utilizzi la clausola with check option, provando quindi a verificarne la 
-- funzionalita’ eseguendo inserimenti non leciti.
--
use prova_hbb_98;
drop view if exists prodottiDiF001;
create view prodottiDiF001 (Prcod, citta) as (
	select t3.COD,t3.CITTA
    from prova_hbb_98.fornitori_hbb_98 as t1,prova_hbb_98.forniture_hbb_98 as t2, prova_hbb_98.prodotti_hbb_98 as t3
	where t1.COD=t2.FCOD and t2.PRCOD=t3.COD and t1.COD="F001"
    )with local check option;
insert into prodottiDiF001 values ('PR90','TORINO')