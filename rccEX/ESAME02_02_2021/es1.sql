/*		Facendo riferimento allo schema del database PROVA, contenente le tabelle DIPART (dipartimenti), DIPENDENTI, 
		FORNITORI, PARTI, PRODOTTI, FORNITURE, del quale è fornita un’istanza, scrivere la query SQL corrispondenti alle 
		seguenti interrogazioni:
		1. Si identifichi per ogni MANSIONE dei DIPENDENTI la prima data di assunzione di un dipendente 
		con quella mansione. Elencare poi tutti i dipendenti, la cui data di assunzione è successiva alla 
		data di prima assunzione nella sua mansione.
        
		Opzionale. Stabilire inoltre se il dipartimento dei dipendenti così identificati è lo stesso di quello nel 
		quale c’è il dipendente che è stato assunto per primo in quella mansione, indicandolo nella “target 
		list” con la stringa “speciale” se vale la condizione, altrimenti non indicare nulla.*/
select *
from prova.dipendenti
where (MANSIONE, DATA_ASS)not in
	(select MANSIONE, min(Data_ass)
	from prova.dipendenti 
    where mansione is not null and DATA_ASS is not null
    group by mansione)