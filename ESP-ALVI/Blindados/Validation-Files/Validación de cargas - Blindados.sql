--REGION ARCHIVO VALIDACION
SELECT
	B.OFFER_ID
	, A.ID_OFERTA_GEO
	, B.OFFER_DESC
	, ROUND(NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(B.DCTO,',','.'),'X','')::FLOAT,2) AS DESCUENTO
	, C.ID_PROMOTION
	, C.LISTAS_PRODUCTOS
	, B.MAX_UNITS::INTEGER AS MAX_UNITS
	, B.TIPO_OFERTA
	, P.CANTIDAD_PRODUCTOS
FROM--SELECT * FROM
	(
	SELECT
		DISTINCT A.ID_OFERTA_GEO
		, ID_OFERTA
	FROM --SELECT DISTINCT A.LOAD_DATE FROM
		DESA_CLIENTES.JL.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_BLIND A
	WHERE
		A.LOAD_DATE = (select max(load_date) from DESA_CLIENTES.JL.TMP_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_BLIND)
	) A
INNER JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND B
ON
	A.ID_OFERTA = B.OFFER_ID
	AND B.CYCLE = $CICLO
INNER JOIN--SELECT * FROM
	DESA_CLIENTES.JL.APP_ALVI_REL_IDS_BLIND C
ON
	C.CICLO = B.CYCLE
	AND CASE WHEN LENGTH(C.LISTAS_PRODUCTOS) > 0 THEN SQLEXT..REPLACE(C.LISTAS_PRODUCTOS,'APP'||LPAD(B.ORGANIZATION_ID,2,0)||LPAD(B.ID_PERIODO,2,0)||LPAD($CICLO,3,0), '')::INT END= B.OFFER_ID
INNER JOIN
	(
	SELECT
		DISTINCT
		A.OFFER_ID
		,A.COUNT(A.EAN) AS CANTIDAD_PRODUCTOS
	FROM 
		DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND	 A
	WHERE
		A.CYCLE = $CICLO
	GROUP BY 1
	)P
ON
	P.OFFER_ID = B.OFFER_ID	
	--END REGION
;