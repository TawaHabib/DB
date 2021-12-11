/*		Facendo riferimento allo schema del database PROVA, contenente le tabelle DIPART (dipartimenti), DIPENDENTI, 
		FORNITORI, PARTI, PRODOTTI, FORNITURE, del quale è fornita un’istanza, scrivere la query SQL corrispondenti alle 
		seguenti interrogazioni:
		2. Si consideri l’elenco di tutte le città (sia Fornitori, sia Parti, sia Prodotti). Produrre un output che 
		riporti, per ogni città nell’elenco, il numero di Fornitori, di Parti e di Prodotti per quella città. Se una 
		città non è associata ad una o più delle tabelle, indicare 0 (nel l’esempio qui sotto, con dati di 
		fantasia, Pavia non è associata a nessun prodotto, Torino a nessun fornitore né parte).*/
 SELECT T0.CITTA,
		coalesce(T1.N_FORNITORI, 0 )	AS N_FORNITORI,
        coalesce(T2.N_PARTI, 0 )		AS N_PARTI,
        coalesce(T3.N_PRODOTTI, 0 )		AS N_PRODOTTI
 FROM
        (select  CITTA
        FROM prova.fornitori
		where CITTA IS NOT NULL
        UNION
		select CITTA
        FROM prova.PARTI
        where CITTA IS NOT NULL
        UNION
		select  CITTA
        FROM prova.PRODOTTI
        where CITTA IS NOT NULL)AS T0
LEFT JOIN
        (select CITTA, COUNT(COD) AS N_FORNITORI
        FROM prova.fornitori
        group by CITTA) AS T1 ON T0.CITTA=T1.CITTA
LEFT JOIN
		(select CITTA, COUNT(COD) AS N_PARTI
        FROM prova.parti
        group by CITTA) AS T2  ON T0.CITTA=T2.CITTA
LEFT JOIN 
		(select CITTA, COUNT(COD) AS N_PRODOTTI
        FROM prova.prodotti
        group by CITTA)AS T3 ON T0.CITTA=T3.CITTA