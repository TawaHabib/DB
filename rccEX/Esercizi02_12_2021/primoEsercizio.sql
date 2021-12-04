/*Identificare i FORNITORI per i quali vale una delle seguenti due condizioni:
	a) 	il FORNITORE non ha alcuna FORNITURA;
	b) 	il FORNITORE fornisce un numero NPRINF di PRODOTTI che è inferiore a metà di 
		tutti i prodotti che sono nelle forniture.
Elencare poi tutti i dati del FORNITORE e, per il caso a) la stringa “assente”; per il caso b) NPRINF. */
select *
from 
	( ####### --A-- UNION --B--
		(#######A
		SELECT distinct cod, "assente" as NPRINF
		FROM prova.fornitori
		where cod not in (select Fcod From prova.forniture))
		union
        (#######B
		select Fcod as cod,count(distinct Prcod) as NPRINF
		from prova.forniture
		group by FCOD
		having count(distinct Prcod)<(select count(distinct pcod)/2 from prova.forniture))
	) as t1
join prova.fornitori as t2 on (t1.cod=t2.cod)