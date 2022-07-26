/*********CARGAR A ALLOCATIONS FILE*****************/
--REGION SI
truncate table desa_clientes.CT.TMP_TB_APP_M10_TMP_ALLOCATION_FILE;
insert into desa_clientes.CT.TMP_TB_APP_M10_TMP_ALLOCATION_FILE

select 	
	AF.CUSTOMER_ID as CUSTOMER_ID
	, AF.OFFER_ID as OFFER_ID
	, null as OFFER_RANK
	--, NOW() AS LOAD_DATE
	from -- select * from 
	DESA_CLIENTES.CT.TMP_TB_APP_M10_TMP_ALLOCATION_FILE_new AF
	WHERE CONTROL = 'M'
--END REGION

/**********************EJECUTAR SP*************************************/
--CC/PP
EXEC DESA_CLIENTES.CT.SP_LOAD_APP_ALLOCATION_FILES_TB_M10();
EXEC DESA_CLIENTES.CT.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_OFFER_TB_M10(8,9);
EXEC DESA_CLIENTES.CT.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_M10(8,9);

/**********************CAMBIARSE DE BD*********************************/
SET CATALOG NZ_CLIENTES;
EXEC NZ_CLIENTES.STG.SP_LOAD_STG_OUTPUT_RD_FILES_BETATEST_TB_M10();
/************************TRUNCAR TABLAS********************************/
TRUNCATE TABLE NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER;
TRUNCATE TABLE NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_OFFER;
TRUNCATE TABLE NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER;


truncate table desa_clientes.RU.TMP_TB_APP_ALVI_TMP_ALLOCATION_FILE;
insert into desa_clientes.RU.TMP_TB_APP_ALVI_TMP_ALLOCATION_FILE
select 	
	AF.PRSN_CODE as CUSTOMER_ID
	, O.OFFER_ID as OFFER_ID
	, null as OFFER_RANK
	--, NOW() AS LOAD_DATE
	from 
	DESA_CLIENTES.CT.LOAD_BANDAS_ALVI LB
INNER JOIN  -- select * from 
	DESA_CLIENTES.CT.APP_ALVI_TOTAL_BOLETA_OFERTAS O
ON 
	O.DCTO = lb.DISCOUNT
inner join --  select * from 
	desa_clientes.CT.TMP_ALLOCATION_FILE_FUG_ALVI AF
on 
	AF.BAND = LB.BANDS

select * from DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_OFFER_TB_ALVI


select count(*) from DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI A where LOAD_DATE ='2021-07-15 16:57:24'--7916  26940  --34856
select count(*) from DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI A where LOAD_DATE ='2021-07-27 13:00:42'--14705  26940  --34856

select *  -- select distinct load_date
from        DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI A
where LOAD_DATE ='2021-08-17 18:39:45'

select  A.HASH_RUT as A_HASH_RUT , A.ID_OFERTA AS A_ID_OFERTA, B.HASH_RUT AS B_HASH_RUT, B.ID_OFERTA AS B_ID_OFERTA
from        
(SELECT * FROM
DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI where LOAD_DATE ='2021-08-17 18:39:45') A
RIGHT join 
(SELECT * FROM
DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI where LOAD_DATE ='2021-08-19 13:25:56' ) B
ON B.HASH_RUT = A.HASH_RUT
 WHERE A.HASH_RUT is null

758
14705

truncate table DESA_CLIENTES.CT.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI_CT
INSERT INTO  DESA_CLIENTES.CT.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI_CT
select  B.*
from        
(SELECT * FROM
DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI where LOAD_DATE ='2021-08-17 18:39:45' ) A
FULL join 
(SELECT * FROM
DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI where LOAD_DATE ='2021-07-15 16:57:24'  ) B
ON B.HASH_RUT = A.HASH_RUT
 WHERE A.HASH_RUT is null
 
 TRUNCATE 
 CREATE TABLE  DESA_CLIENTES.CT.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI_CT AS
 SELECT * FROM    DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI
 
 SELECT * FROM NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER
 
-- TRUNCATE TABLE NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER

select count(*) from NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER
INSERT INTO  NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER
select  	
 	 B.NOMBRE_ARCHIVO 
	,B.ID_FORMATO 
	,B.GEO_CUSTOMER 
	,B.HASH_RUT 
	,B.ID_PERIODO 
	,B.ID_CICLO  
	,B.FECHA_INICIO_CICLO 
	,B.FECHA_FIN_CICLO  
	,B.ID_OFERTA  
	,B.ID_OFERTA_GEO  
	,B.TIPO_OFERTA 
	,B.RANKING_OFERTA 
	,B.IMAGEN  
	,B.IMAGEN_DEFECTO   
	,B.MAX_USES  
from        -- select * from 
(SELECT * FROM
DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI where LOAD_DATE ='2021-08-17 18:39:45' ) A
FULL join 
(SELECT * FROM
DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI where LOAD_DATE ='2021-08-19 13:25:56' ) B
ON B.HASH_RUT = A.HASH_RUT
 WHERE A.HASH_RUT is null
 
 
 
 
 select count(*) from DESA_CLIENTES.CT.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI_CT
  select * from DESA_CLIENTES.CT.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI_CT
  
  
  
  	SELECT * FROM NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
  
  