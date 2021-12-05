/*1. Creare una copia di ciascuna tabella del database prova, dando a ciascuna tabella un nome
scelto in modo da evitare nomi uguali (ad esempio, da PARTI creare PARTI_YYY_99 dove YYY
sono le prime tre lettere del CF e 99 è il giorno di nascita)*/
use PROVA_hbb_98;
drop TABLE IF EXISTS DIPENDENTI_hbb_98;
drop TABLE IF EXISTS DIPART_hbb_98;
drop TABLE IF EXISTS SPED_DETTAGLI_hbb_98;
drop TABLE IF EXISTS SPEDIZIONI_hbb_98;
drop TABLE IF EXISTS FORNITURE_hbb_98;
DROP TABLE IF EXISTS FORNITORI_hbb_98;
DROP TABLE IF EXISTS PRODOTTI_hbb_98;
DROP TABLE IF EXISTS PARTI_hbb_98;
CREATE TABLE DIPART_hbb_98(
          NUM_DIPART SMALLINT primary key,
          NOME_DIPART CHAR(14),
          CITTA CHAR(13))
         ENGINE = InnoDB;
CREATE TABLE DIPENDENTI_hbb_98(
		MATRICOLA SMALLINT primary key,
          NOME_IMP CHAR(10),
          MANSIONE CHAR(11),
          SUP SMALLINT,
          DATA_ASS DATE,
          STIPENDIO INTEGER,
          COMMISS INTEGER,
          NUM_DIPART SMALLINT,
          FOREIGN KEY (NUM_DIPART) REFERENCES DIPART_hbb_98(NUM_DIPART)
        )
         ENGINE = InnoDB;
CREATE TABLE FORNITORI_hbb_98(
			COD CHAR(4) PRIMARY KEY,
          NOME CHAR(13),
          CITTA CHAR(13));
          
CREATE TABLE PARTI_hbb_98(
			COD CHAR(4) PRIMARY KEY,
          NOME CHAR(20),
          COLORE CHAR(20),
          PESO INTEGER,
          CITTA CHAR(20));
          
CREATE TABLE PRODOTTI_hbb_98(
          COD CHAR(4) PRIMARY KEY,
          NOME CHAR(13),
          CITTA CHAR(10));
          
CREATE TABLE FORNITURE_hbb_98(
         FCOD CHAR(4),
         PCOD CHAR(4),
         PRCOD CHAR(4),
         QUANTITA INTEGER,
         PRIMARY KEY (FCOD,PCOD,PRCOD),
         FOREIGN KEY (FCOD) REFERENCES FORNITORI_hbb_98(COD),
         FOREIGN KEY (PCOD) REFERENCES PARTI_hbb_98(COD),
         FOREIGN KEY (PRCOD) REFERENCES PRODOTTI_hbb_98(COD));
CREATE TABLE SPEDIZIONI_hbb_98(
         SPCOD CHAR(4) PRIMARY KEY,
         DATASP DATE,
         CITTADEST CHAR(20),
         CITTAPART CHAR(20),
         QTA_TOTALE SMALLINT);
CREATE TABLE SPED_DETTAGLI_hbb_98(
         SPCOD CHAR(4) ,
         FCOD CHAR(4) ,
         PCOD CHAR(4) ,
         PRCOD CHAR(4) ,
         PRIMARY KEY (SPCOD,FCOD,PCOD,PRCOD),
         FOREIGN KEY (SPCOD) REFERENCES SPEDIZIONI_hbb_98(SPCOD),
         FOREIGN KEY (FCOD,PCOD,PRCOD) REFERENCES FORNITURE_hbb_98(FCOD,PCOD,PRCOD));
                  