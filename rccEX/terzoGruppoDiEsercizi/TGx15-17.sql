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
)WITH LOCAL CHECK OPTION;
--
-- 16.Creare una vista costituita dai codici dei prodotti che vengono forniti con una quantita’ totale (= il totale deve essere 
-- calcolato per prodotto, comprendendo tutte le parti e tutti i fornitori) maggiore della media delle quantita’ di tutte le 
-- forniture del prodotto PR005.
--
# non funziona con CHECK OPTION --> error code: 1368
use prova_hbb_98;
drop view if exists prodottiperQuantita;
CREATE VIEW prova_hbb_98.prodottiperQuantita(PRCOD,Quantita) AS (
	select PRCOD, sum(QUANTITA)
	from 
		prova_hbb_98.forniture_hbb_98
	group by prcod
    having sum(QUANTITA)>(select avg(quantita) from prova_hbb_98.forniture_hbb_98 where PRCOD="PR005")
)#WITH CHECK OPTION;
;
--
-- 17.Creare una vista sul database fornitori-parti-prodotti-forniture costituita dal codice delle parti e dal peso per quelle 
-- parti fornite dal fornitore F003 e dal fornitore F005
--
# non funziona con CHECK OPTION --> error code: 1368
use prova_hbb_98;
drop view if exists parti_fornite_da_f003_f005;
CREATE VIEW prova_hbb_98.parti_fornite_da_f003_f005 (Pcod,peso) AS (
	select distinct t3.COD,t3.PESO
	from 
    	prova_hbb_98.fornitori_hbb_98 	as t1 
		join 
		prova_hbb_98.forniture_hbb_98 	as t2 on((t1.COD <> t2.FCOD) and ((t1.COD = 'F003')or (t1.cod='F005')))
		join
		prova_hbb_98.parti_hbb_98 		as t3 on((t2.PCOD=t3.COD))
	
)#WITH cascaded CHECK OPTION
;