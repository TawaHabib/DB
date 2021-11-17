use PROVA;
drop VIEW IF EXISTS partidiprove;
CREATE VIEW partidiprove (COD_PRODOTTO , NOME_PRODOTTO , CODICE_PARTE , NOME_PARTE , COLORE_PARTE) AS
    SELECT DISTINCT
        p3.COD AS COD_PRODOTTO,
        p3.NOME AS NOME_PRODOTTO,
        p1.COD AS CODICE_PARTE,
        p1.NOME AS NOME_PARTE,
        p1.COLORE AS COLORE_PARTE
    FROM
        ((prova.parti p1
        JOIN (
			SELECT DISTINCT
				prova.forniture.PCOD AS PCOD,
                prova.forniture.PRCOD AS PRCOD
			FROM
				prova.forniture) p2 ON ((p2.PCOD = p1.COD)))
        JOIN prova.prodotti p3 ON ((p2.PRCOD = p3.COD)))