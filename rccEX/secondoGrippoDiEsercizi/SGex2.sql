/*2.	Selezionare il codice dei fornitori che hanno fornito almeno una 
		fornitura con una quantita’ maggiore del valor medio delle 
		quantita’ di tutte le forniture
*/

select distinct  COD as Codiceforniture 
from prova.fornitori  as t1 join prova.forniture as t2 on (t2.FCOD=t1.COD)
where QUANTITA>	(#media di tutte le forniture
					select avg(quantita) as mediaQuantita
					from prova.forniture
				)