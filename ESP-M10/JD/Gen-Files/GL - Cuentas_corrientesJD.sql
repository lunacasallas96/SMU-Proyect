INSERT INTO DESA_CLIENTES.RU.APP_M10_CUENTAS_CORRIENTES
--REGION INSERT DATOS DEL CICLO
SELECT
	DISTINCT
	A.CUENTA_CORRIENTE
	, B.FECHA_INICIO
	, B.FECHA_FIN
	, NOW()::DATETIME AS LOAD_DATE
FROM
	(
		--REGION OFERTAS DEL CICLO + TOTAL BOLETA
	SELECT
		DISTINCT
		'DIGMAY'||LPAD(A.ID_PERIODO, 3, '0')||LPAD($CICLO, 3, '0')||LPAD(OFFER_ID, 5, '0') AS CUENTA_CORRIENTE
	FROM--SELECT * FROM
		DESA_CLIENTES.RU.APP_M10_OFERTAS A
	WHERE
		A.CYCLE = $CICLO 
	--END REGION
	) A
CROSS JOIN
	(
		--REGION FECHAS 
		SELECT
			DISTINCT 
			FECHA_INICIO_CICLO AS FECHA_INICIO
			, FECHA_FIN_CICLO AS FECHA_FIN
		FROM
			DESA_CLIENTES.RU.APP_M10_OFERTAS
		WHERE
			CYCLE = $CICLO
		--END REGION
	) B
--END REGION
;
--REGION GEN ARCHIVO CUENTACOR
SELECT 
	A.CUENTA_CORRIENTE AS CAMPANA
	, TO_CHAR(A.FECHA_INICIO, 'DD-MM-YYYY') AS "FECHA ACTIVACION"
	, TO_CHAR(A.FECHA_FIN, 'DD-MM-YYYY') AS "DIAS DE VIGENCIA O FECHA DE VENCIMIENTO"
	, 99003 AS "RESTRICCIONES DE FORMATO"
	, NULL AS "RESTRICCIONES DE LOCALES"
	, 0 AS "SALDO INICIAL"
	, NULL AS PERIODO
	, NULL AS "RESETEO DE SALDO"
	, 1 AS MULTIPLICADOR
FROM--SELECT * FROM
	DESA_CLIENTES.RU.APP_M10_CUENTAS_CORRIENTES  A
INNER JOIN
	(
		--REGION MAX LOAD_DATE
		SELECT
			MAX(LOAD_DATE) AS LOAD_DATE
		FROM
			DESA_CLIENTES.RU.APP_M10_CUENTAS_CORRIENTES 
		--END REGION
	) B
ON
	A.LOAD_DATE = B.LOAD_DATE
;
--END REGION
