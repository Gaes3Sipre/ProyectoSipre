USE [sipre]
GO

/****** Object:  Trigger [dbo].[AU_Bi_Tercero_Insercion]    Script Date: 23/10/2016 10:33:10 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[AU_Bi_Tercero_Insercion] 
  on [dbo].[Bi_Terceros]
  for INSERT
  as
	declare @IcodTercero int
	declare @ItipTercero nchar(1)
	declare @ItipIdentificacion int
	declare @IpriNombre nVarchar(20)
	declare @IsegNombre nVarchar(20)
	declare @IpriApellido nVarchar(20)
	declare @IsegApellido nVarchar(20)
	declare @IindActividad nchar(1)
	declare @IcodMunicipio int
	declare @IdirResidencia nvarchar(15)
	declare @ItelResidencia int
	declare @IcorElectronico nvarchar(15)
	declare @STDESCRIPC VARCHAR(MAX)
	declare @User varchar(15)
	select @User = SUSER_NAME()
	BEGIN
	SELECT	@IcodTercero = codTercero,
			@ItipTercero = tipTercero,
			@ItipIdentificacion = tipIdentificacion,
			@IpriNombre = priNombre,
			@IsegNombre = segNombre,
			@IpriApellido = priApellido,
			@IsegApellido = segApellido,
			@IindActividad = indActividad,
			@IcodMunicipio = codMunicipio,
			@IdirResidencia = dirResidencia,
			@IcorElectronico = corElectronico
	FROM INSERTED
  
  SELECT @STDESCRIPC = 'codTercero='+		CONVERT(varchar(3),@IcodTercero) +
						', tipTercero='+		@ItipTercero +
						', tipIdentificacion=' +CONVERT(varchar(1),@ItipIdentificacion) +
						', priNombre='+			@IpriNombre +
						', segNombre='+			@IsegNombre+
						', priApellido='+		@IpriApellido+
						', segApellido='+		@IsegApellido+
						', indActividad='+		@IindActividad+
						', codMunicipio='+		CONVERT(varchar(1),@IcodMunicipio)+
						', dirResidencia='+		@IdirResidencia+
						', telResidencia='+		CONVERT(varchar(1),@ItelResidencia)+
						', corElectronico='+	@IcorElectronico
  
  INSERT INTO Gn_Auditoria (tabla, usuario, descripcion, tipoModificacion, fecha)
values ('Bi_Terceros', @User, @STDESCRIPC,'I', GETDATE())
  end

GO

ALTER TABLE [dbo].[Bi_Terceros] ENABLE TRIGGER [AU_Bi_Tercero_Insercion]
GO


