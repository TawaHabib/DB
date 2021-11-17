/*7.	Elencare il nome dei fornitori che non forniscono mai la parte P002*/
select nome 
from prova.fornitori
where cod not in(#fornitori che forniscono P002
			select distinct Fcod
			from  prova.forniture
			where PCOD='P002'
				)