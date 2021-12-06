--
-- 17.Creare una vista sul database fornitori-parti-prodotti-forniture costituita dal codice delle parti e dal peso per quelle 
-- parti fornite dal fornitore F003 e dal fornitore F005
--
# non funziona con CHECK OPTION --> Error Code: 1368. CHECK OPTION on non-updatable view 'prova_hbb_98.parti_fornite_da_f003_f005'
# motivo: vista non aggiornabile in quanto contiene 'distinct'; vedere documentazione sotto;
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
	
)#WITH local CHECK OPTION --> no check option in quanto vista non aggiornabile
;
# stesso problema di prima: non acetta la check option: risposta:
# vista non aggiornabile in quanto contiene 'distinct'; vedere documentazione sotto;
use prova_hbb_98;
drop view if exists parti_fornite_da_f003_f005;
CREATE VIEW prova_hbb_98.parti_fornite_da_f003_f005 (Pcod,peso) AS (
	select distinct t3.COD,t3.PESO
	from 
			prova_hbb_98.fornitori_hbb_98 	as t1 ,
			prova_hbb_98.forniture_hbb_98 	as t2,
			prova_hbb_98.parti_hbb_98 		as t3 
	where (t1.COD<>t2.FCOD) and t2.PCOD=t3.COD and (t1.COD="F003" or t1.COD="F005"))
    #with local check option; no check option in quanto vista non aggiornabile (definita su piu tabelle)
-- 
-- riferimento viste aggiornabile o non (regole più complesse di quelle dette nel libro) per MySQL:
-- https://dev.mysql.com/doc/refman/8.0/en/view-updatability.html
-- 