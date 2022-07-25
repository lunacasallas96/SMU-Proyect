-- SELECT * FROM DESA_CLIENTES.RU.APP_TOTAL_BOLETA_CUENTAS_CORRIENTES WHERE CUENTA_CORRIENTE = 'DIGALV01000890065'

INSERT INTO DESA_CLIENTES.JL.APP_TOTAL_BOLETA_CUENTAS_CORRIENTES_JD
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
		'DIGALV'||LPAD(A.ID_PERIODO, 3, '0')||LPAD($CICLO, 3, '0')||LPAD(OFFER_ID, 5, '0') AS CUENTA_CORRIENTE
	FROM--SELECT * FROM
		DESA_CLIENTES.JL.APP_ALVI_JOURNEYDOWN A
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
			DESA_CLIENTES.JL.APP_ALVI_JOURNEYDOWN
		WHERE
			CYCLE = $CICLO
		--END REGION
	) B
--END REGION
;
-- CUENTAS CORRIENTES
SELECT 
	A.CUENTA_CORRIENTE AS CAMPANA
	, TO_CHAR(A.FECHA_INICIO, 'DD-MM-YYYY') AS "FECHA ACTIVACION"
	, TO_CHAR(A.FECHA_FIN, 'DD-MM-YYYY') AS "DIAS DE VIGENCIA O FECHA DE VENCIMIENTO"
	--, '09-09-2021' AS "DIAS DE VIGENCIA O FECHA DE VENCIMIENTO"
	, 99004 AS "RESTRICCIONES DE FORMATO"
	, NULL AS "RESTRICCIONES DE LOCALES"
	, 0 AS "SALDO INICIAL"
	, NULL AS PERIODO
	, NULL AS "RESETEO DE SALDO"
	, 1 AS MULTIPLICADOR
FROM--SELECT * FROM
	DESA_CLIENTES.JL.APP_TOTAL_BOLETA_CUENTAS_CORRIENTES_JD A
INNER JOIN
	(
		--REGION MAX LOAD_DATE
		SELECT
			MAX(LOAD_DATE) AS LOAD_DATE  --select *  
		FROM
			DESA_CLIENTES.JL.APP_TOTAL_BOLETA_CUENTAS_CORRIENTES_JD
		--END REGION
	) B
ON
	A.LOAD_DATE = B.LOAD_DATE
;

-/*REGION BANDA
SELECT
CC.CUENTA_CORRIENTE AS CTA_CTE
--, LB.BANDS AS BANDA
,tbo.OFFER_ID as BANDA
, TBO.PRECIO_REFERENCIAL AS MINIMO_COMPRA
, NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(TBO.DCTO,',','.'),'X','')::INTEGER AS DSCTO
, TBO.FECHA_INICIO_CICLO AS INICIO
, TBO.FECHA_FIN_CICLO AS FIN
, TBO.TIPO_FINANCIAMIENTO
FROM -- select * from
--DESA_CLIENTES.CT.LOAD_BANDAS_ALVI LB
--INNER JOIN -- select * from
DESA_CLIENTES.CT.APP_ALVI_TOTAL_BOLETA_OFERTAS TBO
--ON DCTO = DISCOUNT
INNER join -- SELECT * FROM
DESA_CLIENTES.RU.APP_TOTAL_BOLETA_CUENTAS_CORRIENTES CC
on CC.CUENTA_CORRIENTE LIKE '%%'||TBO.OFFER_ID
WHERE CC.LOAD_DATE = (SELECT MAX(LOAD_DATE) FROM DESA_CLIENTES.RU.APP_TOTAL_BOLETA_CUENTAS_CORRIENTES)
--END REGION
*/


--REGION BANDAS 
SELECT 
	A.CTA_CTE,
	B.OFFER_ID
	, A.BANDA
	, B.PRECIO_REFERENCIAL AS MINIMO_COMPRA
	, NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(B.DCTO,',','.'),'X','')::INTEGER AS DSCTO
	, B.FECHA_INICIO_CICLO AS INICIO
	, B.FECHA_FIN_CICLO AS FIN
	, B.TIPO_FINANCIAMIENTO
FROM --SELECT * FROM
	DESA_CLIENTES.JL.STG_INPUT_BANDA_TOTAL_BOLETA_FUGADOS_ALVI_SYD A
INNER JOIN
	DESA_CLIENTES.JL.APP_ALVI_JOURNEYDOWN B
ON
	A.OFFER_ID = B.OFFER_ID
ORDER BY A.CTA_CTE ASC
;
--END REGION
;
DIGALV01101090065