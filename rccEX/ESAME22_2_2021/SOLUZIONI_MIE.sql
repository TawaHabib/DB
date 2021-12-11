/*1
--
-- 1.	Stabilire, per ogni dipartimento, il numero distinto di mansioni NMANS presenti nei suoi dipendenti.
-- Elencare per ogni dipartimento, oltre ai suoi dati, il suo NMANS, la mansione MANMAX che ha il numero massimo NMAX di dipendenti e NMAX.
--
*/
SELECT 	T0.NUM_DIPART, T0.NOME_DIPART, T0.CITTA, 
		coalesce(T1.NMANS, "0")	as NMANS, 
        coalesce(T2.MANMAX, "NESSUNA") as MANMAX, 
        coalesce(T2.NMAX, "0")	as NMAX
FROM 
		prova.dipart AS T0
left JOIN 
		(SELECT NUM_DIPART, COUNT(distinct MANSIONE) AS NMANS
		from prova.dipendenti
		group by NUM_DIPART) AS T1 ON T0.NUM_DIPART=T1.NUM_DIPART
LEFT JOIN 
		(SELECT DISTINCT T0.NUM_DIPART,T1.MANSIONE AS MANMAX, T0.NMAX
		FROM 
			(SELECT NUM_DIPART,  max(NMAX) AS NMAX
			FROM
				(SELECT NUM_DIPART, MANSIONE, COUNT(MATRICOLA) AS NMAX
				FROM prova.dipendenti
				WHERE NUM_DIPART IS NOT NULL AND MANSIONE IS NOT NULL
				group by NUM_DIPART, MANSIONE) AS T1
			group by NUM_DIPART) AS T0 
		JOIN 
			(SELECT NUM_DIPART, MANSIONE, COUNT(MATRICOLA) AS NMAX
			FROM prova.dipendenti
			WHERE NUM_DIPART IS NOT NULL AND MANSIONE IS NOT NULL
			group by NUM_DIPART, MANSIONE) AS T1 ON (T0.NUM_DIPART=T1.NUM_DIPART AND T0.NMAX=T1.NMAX))  AS T2 ON T0.NUM_DIPART=T2.NUM_DIPART
;
/*2
--
-- 2.	Produrre una tabella che riporti tutti gli anni nei quali ci sono state assunzioni di DIPENDENTI e/o SPEDIZIONI. 
-- Ogni riga della tabella deve avere, nella prima colonna, l’ANNO, nella seconda il numero NDA dei DIPENDENTI assunti in quell’anno, nella terZa il numero NSA delle SPEDIZIONI eseguite nell’anno 
-- (si veda qui sotto una tabella con dati di fantasia). La tabella deve essere ordinata per valori crescenti di ANNO.
-- Suggerimento: la funzione  year(X) restiuisce l’anno se X è un oggetto di tipo DATE.
-- 
*/

select T0.ANNO, 
		coalesce(T1.NDA, 0)	AS NDA,
        coalesce(T2.NSA, 0)	AS NSA
from
		(#TUTTI GLI ANNI
        (#anni in cui ci sono stati assunzioni
		select year(data_ass) as Anno from prova.dipendenti)
		union #implicit Distinct 
		(#anni in cui ci sono spedizioni 
		select year(datasp) as Anno from prova.spedizioni)) T0
LEFT join
		(#assunzioni negli anni
		select year(data_ass) as Anno, count(matricola) as NDA
		from prova.dipendenti
        where DATA_ASS IS NOT NULL
		group by year(data_ass)
		) AS T1 ON T0.ANNO=T1.ANNO
LEFT JOIN
		(#spedizioni negli anni 
		select year(datasp) as Anno, count(spcod) as NSA
		from prova.spedizioni
        where datasp IS NOT NULL
		group by year(datasp)
		) AS T2 ON T0.ANNO=T2.ANNO
ORDER BY ANNO
;

