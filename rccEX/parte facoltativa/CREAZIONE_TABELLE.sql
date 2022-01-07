/*creazione schema*/
create schema dataingestion481357;
#######creazione tabelle
use dataingestion481357;
########atenei table
CREATE TABLE ATENEI
        (#tutti gli atributi 
        COD_Ateneo INTEGER primary key,
        NomeEsteso CHAR(200),
        NomeOperativo CHAR(200),
        status CHAR(200),
        Tipologia_ateneo_descrizione CHAR(200),
        Statale_NonStataleLibera CHAR(200),
        Indirizzo CHAR(200),
        COMUNE CHAR(200),
        PROVINCIA CHAR(200),
        REGIONE CHAR(200),
        Zona_Geografica CHAR(200),
        URL CHAR(200),
        Classe_dimensione CHAR(200)
        );
        
CREATE TABLE  T_LAUREATI
        ( #senza alcun vincolo <tutti gli attributi di laoreati>
		AnnoS year,
        AteneoCOD INTEGER,
        AteneoNOME CHAR(200),
        ClasseNUMERO varchar(20),
        CorsoNOME CHAR(200) ,
        SedeC CHAR(50),
        IstatP varchar(20),
        Lau varchar(20)
        );
        
CREATE TABLE  LAUREATI
		(#laoreati definitivi a cui aggiungo i vincoli
		AnnoS year not null,
        AteneoCOD INTEGER not null,
        AteneoNOME CHAR(200),
        ClasseNUMERO varchar(20) not null,
        CorsoNOME CHAR(200) ,
        SedeC CHAR(50),
        IstatP integer,
        Lau integer NOT NULL
        );

###############una volta caricati i dati in atenei e in t_laoreati eseguire i seguenti###############
update  dataingestion481357.laureati as t1 set IstatP=null where not (t1.IstatP=concat('',t1.IstatP*1));
#######METTO A ZERO I NON INT PER POTERLO INSERIRE NEI LAOREATI; E ANCHE PER INCLUDERE Lao NELLA PK (LA PK NON PUò ESSERE NULLA)
update  dataingestion481357.laureati as t1 set Lau=0 where not (t1.Lau=concat('',t1.Lau*1));
#######COPIO CONVERTENDO OPPURTANAMENTE I VARCHAR IN INTEGER
insert into dataingestion481357.laureati
			(
			select distinct		AnnoS ,AteneoCOD ,AteneoNOME,ClasseNUMERO,CorsoNOME ,SedeC,
								cast(IstatP as unsigned integer),cast(Lau as unsigned integer)
			from 				dataingestion481357.t_laureati
            );
#########ELIMINA TABELLA T_LAOREATI
DROP TABLE  dataingestion481357.T_laureati;
########AGGIUNGO FK
ALTER TABLE dataingestion481357.laureati add FOREIGN KEY (AteneoCOD) REFERENCES ATENEI (COD_Ateneo);
########AGGIUNGO PK
ALTER TABLE dataingestion481357.laureati add primary key(AnnoS, AteneoCOD,ClasseNUMERO,CorsoNOME,SedeC,Lau);
  