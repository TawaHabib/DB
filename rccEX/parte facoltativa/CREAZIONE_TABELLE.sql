
create schema dataingestion481357;
use dataingestion481357;
CREATE TABLE ATENEI
        (COD_Ateneo INTEGER primary key,
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
        Classe_dimensione CHAR(200));
        
CREATE TABLE  LAUREATI( 
		AnnoS year not null,
        AteneoCOD INTEGER not null,
        AteneoNOME CHAR(200),
        ClasseNUMERO varchar(20) not null,
        CorsoNOME CHAR(200) ,
        SedeC CHAR(50),
        IstatP varchar(20),
        Lau varchar(20)/*,
        primary key(AnnoS, AteneoCOD,ClasseNUMERO,CorsoNOME) */
        );
        CREATE TABLE  T_LAUREATI( 
		AnnoS year not null,
        AteneoCOD INTEGER not null,
        AteneoNOME CHAR(200),
        ClasseNUMERO varchar(20) not null,
        CorsoNOME CHAR(200) ,
        SedeC CHAR(50),
        IstatP integer,
        Lau integer/*,
        primary key(AnnoS, AteneoCOD,ClasseNUMERO,CorsoNOME) */
        );
        
        insert into dataingestion481357.t_laureati (
													select distinct		AnnoS ,
																		AteneoCOD ,
																		AteneoNOME,
																		ClasseNUMERO,
																		CorsoNOME ,
																		SedeC,
																		cast(IstatP as unsigned integer),
																		cast(Lau as unsigned integer)
													from dataingestion481357.laureati);
        
        
        ALTER TABLE dataingestion481357.laureati add FOREIGN KEY (AteneoCOD) REFERENCES ATENEI (COD_Ateneo);
        update  dataingestion481357.laureati as t1 set IstatP=null where not (t1.IstatP=concat('',t1.IstatP*1));
        update  dataingestion481357.laureati as t1 set Lau=null where not (t1.Lau=concat('',t1.Lau*1));
		alter table dataingestion481357.laureati add primary key(AnnoS, AteneoCOD,ClasseNUMERO,CorsoNOME,SedeC,IstatP,Lau);
        
        
        
        