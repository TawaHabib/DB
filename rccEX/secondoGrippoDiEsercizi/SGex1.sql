#finito
/*1.	Selezionare i dipendenti che guadagnano il minimo e quelli che
		guadagnano il massimo rispetto alla propria mansione, elencandoli poi per mansione*/
select *
from prova.dipendenti
where (stipendio, MANSIONE)in    
		(
        SELECT max(stipendio), mansione
		FROM prova.dipendenti 
		group by mansione
        )
	or(stipendio, mansione)in
		(
        SELECT min(stipendio), mansione
		FROM prova.dipendenti 
		group by mansione
        )
order by mansione;