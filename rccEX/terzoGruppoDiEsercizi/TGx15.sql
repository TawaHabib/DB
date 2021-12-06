--
-- 15.Creare una vista sul database fornitori-parti-prodotti-forniture costituita dal codice dei prodotti e dalle citta’ di quei 
-- prodotti che sono forniti da F003 e che usano la parte P001.
--
use prova_hbb_98;
drop view if exists prodottidif003e_usano_p001;
CREATE VIEW prova_hbb_98.prodottidif003e_usano_p001 (PRCOD,CITTA) AS (
	select t3.COD,t3.CITTA
	from 
    	prova_hbb_98.fornitori_hbb_98 	as t1 
		join 
		prova_hbb_98.forniture_hbb_98 	as t2 on(((t1.COD = t2.FCOD) and (t1.COD = 'F003')))
		join
		prova_hbb_98.prodotti_hbb_98 	as t3 on((t2.PRCOD = t3.COD))
		join 
		prova_hbb_98.parti_hbb_98 		as t4 on(((t2.PCOD=t4.COD) and (t4.COD= 'P001')))
)WITH LOCAL CHECK OPTION; # perchè mi accetta la check option? (vista definita su più tabelle)
-- 
-- riferimento viste aggiornabile o non (regole più complesse di quelle dette nel libro) per MySQL:
-- https://dev.mysql.com/doc/refman/8.0/en/view-updatability.html
-- 
