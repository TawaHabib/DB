insert into prova_hbb_98.dipart_hbb_98
	(select * from prova.dipart);
    
insert into prova_hbb_98.dipendenti_hbb_98
	(select * from prova.dipendenti);
    
insert into prova_hbb_98.fornitori_hbb_98
	(select * from prova.fornitori);
    
insert into prova_hbb_98.prodotti_hbb_98
	(select * from prova.prodotti);

insert into prova_hbb_98.parti_hbb_98
	(select * from prova.parti);
    
insert into prova_hbb_98.forniture_hbb_98
	(select * from prova.forniture);
    
insert into prova_hbb_98.spedizioni_hbb_98
	(select * from prova.spedizioni);
    
insert into prova_hbb_98.sped_dettagli_hbb_98
	(select * from prova.sped_dettagli);