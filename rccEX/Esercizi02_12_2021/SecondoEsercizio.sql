/*Per ogni MANSIONE determinare:
	1	Il numero ZEROSUP di dipartimenti nei quali nessun dipendente svolge quella mansione
	2	il numero UNOSUP di dipartimenti nei quali un solo dipendente svolge quella mansione
	3	il numero DUESUP di dipartimenti nei quali almeno due dipendente svolgono quella mansione;
Elencare tutte le MANSIONE, assieme a ZEROSUP, UNOSUP e DUESUP.
richiesta ambigua? sup --> si riferisce a superiore?? <non ho capito la richiesta>
*/
###########TODO##########
###########TODO##########
###########TODO##########
###########TODO##########
#zero sup
select *
from prova.dipendenti;
	(select distinct Mansione, num_dipart
	from prova.dipendenti)