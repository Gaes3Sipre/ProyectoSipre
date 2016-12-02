alter table BI_TERCEROS  alter Column actUsuario Varchar(15); 
ALTER TABLE dbo.Tmp_Bi_Terceros ADD CONSTRAINT
	DF_Bi_Terceros_actUsuario DEFAULT (SUSER_NAME()) FOR actUsuario;
alter table gn_auditoria  alter Column descripcion Varchar(max); 
alter table gn_auditoria add codTercero int null;
alter table gn_auditoria add tipTecrero nchar(1) null;
alter table gn_auditoria add DesTercero varchar(max) null;
