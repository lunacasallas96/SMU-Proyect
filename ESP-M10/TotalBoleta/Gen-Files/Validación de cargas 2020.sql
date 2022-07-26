SELECT
	B.OFFER_ID
	, A.ID_OFERTA_GEO
	, B.OFFER_DESC
	, ROUND(NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(B.DCTO,',','.'),'X','')::FLOAT,2) AS DESCUENTO
	, C.ID_PROMOTION
	, NULL AS ID_TARJETA
	, C.LISTAS_PRODUCTOS
	, B.TIPO_OFERTA
FROM--SELECT * FROM
	(
	SELECT
		DISTINCT A.ID_OFERTA_GEO
		, ID_OFERTA
	FROM
		DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_m10 A
	WHERE
		A.LOAD_DATE = (SELECT MAX(A.LOAD_DATE) FROM 
				DESA_CLIENTES.RU.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_TB_m10 A)
	) A
INNER JOIN-- select * from 
	DESA_CLIENTES.CT.APP_M10_TOTAL_BOLETA_OFERTAS B
ON
	A.ID_OFERTA = B.OFFER_ID
	AND B.CYCLE = $CYCLE
INNER JOIN--SELECT * FROM
	DESA_CLIENTES.ct.APP_m10_REL_IDS_TB C
ON
	C.CICLO = B.CYCLE
	AND 
	NZ_CLIENTES.ADMIN.replace(C.ID_GEOLOYALTy,'DIGMAY'||LPAD(B.ID_PERIODO, 3, 0)||LPAD(B.cycle, 3, 0), '')::INT = B.OFFER_ID
;

SELECT
	*
FROM
	DESA_CLIENTES.RC.APP_OFERTAS A
WHERE
	A.CYCLE = 2
	