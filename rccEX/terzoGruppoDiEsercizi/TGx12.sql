--
-- 12. Verificare cosa succede... insert into mil_for values ('30', 'VERD','TORINO') 
--
##VIENE INSERITA LA TUPLA IN FORNITORI_HBB_98 E NON VIENE INSERITA IN  FORNITORE DI MILANO 
## QUINDI VIENE FATTO IL CASCADE
insert into fornitoriDiMilano values ('190', 'VERD','TORINO');
insert into fornitoriDiMilano values ('30', 'VERD','TORINO');
insert into fornitoriDiMilano values ('1500', 'VERD','TORINO');