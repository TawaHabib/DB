/* 	3.	Selezionare il codice dei fornitori che forniscono prodotti con parte P001 in una 
		quantita’ maggiore della media fornita per la parte P001 per quel determinato prodotto*/
select distinct FCOD as Codice_formitore
from prova.forniture 
where quantita>(
        select avg(quantita)
        from prova.forniture
        where pcod="P001"
        )
order by FCOD