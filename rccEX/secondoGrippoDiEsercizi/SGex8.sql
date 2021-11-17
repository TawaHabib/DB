/*8.	Elencare il codice e il nome dei fornitori che forniscono solo la parte P002*/
select nome 
from prova.fornitori as p1 join prova.forniture as p2 on(p2.FCOD=p1.COD)
where cod not in(#fornitori che corniscono parti diverse da P002
				select distinct Fcod
				from  prova.forniture
				where PCOD!="P002"
				)