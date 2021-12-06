--
-- 16.Creare una vista costituita dai codici dei prodotti che vengono forniti con una quantita’ totale (= il totale deve essere 
-- calcolato per prodotto, comprendendo tutte le parti e tutti i fornitori) maggiore della media delle quantita’ di tutte le 
-- forniture del prodotto PR005.
--
# non funziona con CHECK OPTION --> Error Code: 1368. CHECK OPTION on non-updatable view 'prova_hbb_98.prodottiperquantita'
use prova_hbb_98;
drop view if exists prodottiperQuantita;
CREATE VIEW prova_hbb_98.prodottiperQuantita(PRCOD,Quantita) AS (
	select PRCOD, sum(QUANTITA)
	from 
		prova_hbb_98.forniture_hbb_98
	group by prcod
    having sum(QUANTITA)>(select avg(quantita) from prova_hbb_98.forniture_hbb_98 where PRCOD="PR005")
)#WITH cascaded CHECK OPTION;--> vista non aggiornabile vedere  riferimenti
;
-- 
-- riferimento viste aggiornabile o non (regole più complesse di quelle dette nel libro) per MySQL:
-- https://dev.mysql.com/doc/refman/8.0/en/view-updatability.html
-- 