SELECT
	MAX(A.LOAD_DATE)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI A
;--'2022-07-19 12:25:42'
/*****
DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
DELETE
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI A
WHERE
	A.LOAD_DATE = '2022-02-24 17:02:52'
*/
SELECT 
	COUNT(DISTINCT A.OFFER_ID)
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.TMP_TB_APP_ALVI_TMP_ALLOCATION_FILE A--272
;--8	77096
SELECT
	COUNT(DISTINCT A.ID_OFERTA)
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI A
WHERE
	A.LOAD_DATE ='2022-07-19 12:25:42'
;--8	77096
/***********************************************************/

SELECT
	COUNT(DISTINCT A.OFFER_ID)
FROM
	DESA_CLIENTES.CT.APP_ALVI_TOTAL_BOLETA_OFERTAS A
WHERE
	A.CYCLE = 14
--8
;

SELECT
	COUNT(*)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
;--77096
/***********************************************************/
SELECT
	*
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_OFFER_TB_ALVI A
;--8

UPDATE
NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER 
SET IMAGEN = 'Billete'
SELECT
	*
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_OFFER A
;--1

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI A
WHERE
	A.LOAD_DATE = '2022-07-19 12:25:42'
;--8

SELECT
	COUNT(*)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_ALVI B
WHERE
	B.LOAD_DATE ='2022-07-19 12:25:42'
;--77096 --CARGA A MONGO

/***
UPDATE
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB
SET
	FECHA_INICIO_CICLO = '2021-03-11 09:13:19'
WHERE
	LOAD_DATE = '2021-03-11 09:13:19'
;
/**************EXPORT ARCHIVO OFERTA***********************/
SELECT
	--A.NOMBRE_ARCHIVO,
	A.ID_FORMATO	
	, A.ID_APLICA_OFERTA	
	, A.ID_OFERTA	
	, A.ID_PERIODO	
	, A.FECHA_INICIO_PERIODO	
	, A.FECHA_FIN_PERIODO	
	, A.MAX_USO	
	, A.MAX_UNIDADES_X_USO::INTEGER AS 	MAX_UNIDADES_X_USO
	, A.UNIDAD_MEDIDA	
	, A.DESCRIPCION_OFERTA	
	, A.ID_MECANICA	
	, A.CONTENIDO_MECANICA	
	, A.LEGAL	
	, A.CANAL	
	, A.ID_CATALOGO	
	, A.DESCRIPCION_TIPO	
	, A.ORDEN_DCTO	
	, A.UNICARD_DCTO
	, 'FALSE' AS UNIPAY
	, 'ONLY_STORE' AS CHANNEL
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_OFFER_TB_ALVI A
;