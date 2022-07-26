SELECT
	MAX(A.LOAD_DATE)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
;--'2022-07-12 16:18:35'

SELECT 
	COUNT(DISTINCT A.OFFER_ID)
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_M10_TMP_ALLOCATION_FILE_OP A--272
;--130	2557884

SELECT 
	COUNT(DISTINCT A.OFFER_ID)
	, COUNT(*)--select * 
FROM
	DESA_CLIENTES.RU.APP_M10_TMP_ALLOCATION_FILE_PC A--189
;--97	3164991

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
WHERE
	A.TIPO_OFERTA = 2
	AND A.LOAD_DATE = '2022-07-12 16:18:35'
;--130	2557884

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
WHERE
	A.TIPO_OFERTA = 6
	AND A.LOAD_DATE = '2022-07-12 16:18:35'
;--97	3164090

--REGION VAL
SELECT
	OFFER_ID
FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS A
WHERE
	A.CYCLE = 46
	AND A.TIPO_OFERTA LIKE '%Masiva%'
AND OFFER_ID NOT IN (
SELECT
	A.ID_OFERTA
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
WHERE
	A.TIPO_OFERTA = 4
	AND A.LOAD_DATE = '2022-07-12 16:18:35'
	)
;--26 26
--END REGION
SELECT
	A.ID_OFERTA
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
WHERE
	A.TIPO_OFERTA = 4
	AND A.LOAD_DATE = '2022-07-12 16:18:35';
	--20


SELECT
	COUNT(DISTINCT A.ID_OFERTA)
	, COUNT(*)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
WHERE
	A.TIPO_OFERTA = 2
;--130	2557884

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
	, COUNT(*)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
WHERE
	A.TIPO_OFERTA = 6
;--138	29000104

SELECT
	COUNT(*)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
;--47636725--carga a mongo

/***********************************************************/
SELECT
	COUNT(DISTINCT A.OFFER_ID)
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_M10_TMP_ALLOCATION_FILE_PC A
;--97	3164090

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
	, COUNT(*)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
WHERE
	A.TIPO_OFERTA = 4
;--118	3617898
/***********************************************************/
SELECT
	COUNT(*)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
WHERE
	A.TIPO_OFERTA = 2
;--18636576

SELECT
	COUNT(DISTINCT A.HASH_RUT)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
WHERE
	A.TIPO_OFERTA = 2
;--4903555

SELECT
	COUNT(DISTINCT A.HASH_RUT)
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER A
;--4903555

SELECT
	COUNT(A.OFFER_ID)
FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS A
WHERE
	A.CYCLE = 46
	AND UPPER(A.TIPO_OFERTA) LIKE UPPER('Personalizada%')
--143
;

SELECT
	DISTINCT A.ID_OFERTA
	, A.TIPO_OFERTA
FROM
	NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER A
WHERE
	A.ID_OFERTA IN (1536, 285);
/***********************************************************/

SELECT
	COUNT(*)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
WHERE
	A.LOAD_DATE = '2022-07-12 16:18:35'
;--5721994 -> carga a mongo

SELECT
	DISTINCT A.ID_OFERTA
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
WHERE
	A.LOAD_DATE = '2022-07-12 16:18:35'
;--151

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_OP_M10 A
;--127

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_PC_M10 A
;--97

SELECT
	COUNT(DISTINCT A.ID_OFERTA)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_MAS_M10 A
;--20

SELECT
	COUNT(*)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_M10 B
;--681313

SELECT
	COUNT(DISTINCT A.HASH_RUT)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_OP_M10 A
;--681313

SELECT
	COUNT(DISTINCT A.HASH_RUT)
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_PC_M10 A
;--873532

SELECT
	DISTINCT B.ID_FORMATO
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 B
WHERE
	B.LOAD_DATE = '2022-07-12 10:54:26'
LIMIT 10000
;--4

SELECT
	DISTINCT A.NOMBRE_ARCHIVO
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_M10 A
UNION ALL
SELECT
	DISTINCT A.NOMBRE_ARCHIVO
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_M10 A
WHERE
	A.LOAD_DATE = '2022-07-12 10:54:26'
UNION ALL
SELECT
	DISTINCT A.NOMBRE_ARCHIVO
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_OFFER_M10 A
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
	, A.MAX_UNIDADES_X_USO	
	, A.UNIDAD_MEDIDA	
	, A.DESCRIPCION_OFERTA	
	, A.ID_MECANICA	
	, A.CONTENIDO_MECANICA	
	, A.LEGAL	
	, A.CANAL	
	, A.ID_CATALOGO	
	, A.DESCRIPCION_TIPO	
	, A.ORDEN_DCTO	
	
FROM
	DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_OFFER_M10 A
;

UPDATE DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_OFFER_M10 
SET ORDEN_DCTO = 0.50000
WHERE ID_OFERTA = 7055
/************************************************************/