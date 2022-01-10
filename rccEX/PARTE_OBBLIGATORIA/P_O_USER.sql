/*g. (da WB) Connettersi all’istanza usando il nuovo utente e creare un’istanza di nome BDXXXXXX */
create SCHEMA IF NOT EXISTS BD481357;
/*h. (da WB) Nel database BDXXXXXX creare le stesse table presenti nel database PROVA, ma SENZA popolarle di dati */
use BD481357; 
CREATE TABLE DIPART
        ( NUM_DIPART SMALLINT primary key,
          NOME_DIPART CHAR(14),
          CITTA CHAR(13))
         ENGINE = InnoDB;
CREATE TABLE DIPENDENTI
        ( MATRICOLA SMALLINT primary key,
          NOME_IMP CHAR(10),
          MANSIONE CHAR(11),
          SUP SMALLINT,
          DATA_ASS DATE,
          STIPENDIO INTEGER,
          COMMISS INTEGER,
          NUM_DIPART SMALLINT,
          FOREIGN KEY (NUM_DIPART) REFERENCES DIPART(NUM_DIPART)
        )
         ENGINE = InnoDB;

CREATE TABLE FORNITORI
        ( COD CHAR(4) PRIMARY KEY,
          NOME CHAR(13),
          CITTA CHAR(13));
CREATE TABLE PARTI
        ( COD CHAR(4) PRIMARY KEY,
          NOME CHAR(20),
          COLORE CHAR(20),
          PESO INTEGER,
          CITTA CHAR(20));
CREATE TABLE PRODOTTI
        ( COD CHAR(4) PRIMARY KEY,
          NOME CHAR(13),
          CITTA CHAR(10));
CREATE TABLE FORNITURE
        (FCOD CHAR(4),
         PCOD CHAR(4),
         PRCOD CHAR(4),
         QUANTITA INTEGER,
         PRIMARY KEY (FCOD,PCOD,PRCOD),
         FOREIGN KEY (FCOD) REFERENCES FORNITORI(COD),
         FOREIGN KEY (PCOD) REFERENCES PARTI(COD),
         FOREIGN KEY (PRCOD) REFERENCES PRODOTTI(COD));
CREATE TABLE SPEDIZIONI
        (SPCOD CHAR(4) PRIMARY KEY,
         DATASP DATE,
         CITTADEST CHAR(20),
         CITTAPART CHAR(20),
         QTA_TOTALE SMALLINT);
CREATE TABLE SPED_DETTAGLI
        (SPCOD CHAR(4) ,
         FCOD CHAR(4) ,
         PCOD CHAR(4) ,
         PRCOD CHAR(4) ,
         PRIMARY KEY (SPCOD,FCOD,PCOD,PRCOD),
         FOREIGN KEY (SPCOD) REFERENCES SPEDIZIONI(SPCOD),
         FOREIGN KEY (FCOD,PCOD,PRCOD) REFERENCES FORNITURE(FCOD,PCOD,PRCOD));
         
/*i. (da WB) Eseguire uno script che popoli opportunemente le table del database BDXXXXXX copiandovi i contenuti delle table dello schema PROVA. */
insert into BD481357.DIPART
	(select * from PROVA.DIPART);
    
insert into BD481357.DIPENDENTI
	(select * from PROVA.DIPENDENTI WHERE SUP IS NULL OR SUP IN(SELECT MATRICOLA FROM PROVA.DIPENDENTI)); 
    
/*AGGIUNGO VINCOLO DI INTEGRITA'*/
ALTER TABLE DIPENDENTI add FOREIGN KEY (SUP) REFERENCES DIPENDENTI (MATRICOLA);
    
insert into BD481357.FORNITORI
	(select * from PROVA.FORNITORI);
    
insert into BD481357.PRODOTTI
	(select * from PROVA.PRODOTTI);

insert into BD481357.PARTI
	(select * from PROVA.PARTI);
    
insert into BD481357.FORNITURE
	(select * from PROVA.FORNITURE);
    
insert into BD481357.SPEDIZIONI
	(select * from PROVA.SPEDIZIONI);
    
insert into BD481357.SPED_DETTAGLI
	(select * from PROVA.SPED_DETTAGLI);