--0
--REGION INFO PRECIO FIJO
SELECT DISTINCT
	NULL AS "Id"
	, A.ID_WORKFLOW AS "Id Alternativo"
	, 'CUPONES CRM' AS "Tipo de Promoción"
	, 0 AS "Prioridad"
	, 0 AS "Eliminada"
	, NULL AS "Campaña"
	, NULL AS"SubCampaña"
	, 'APP CLUB ALVI' AS "Nombre Promocion"
	, A.TIPO_FINANCIAMIENTO||' CRM_ALVI_APP_'||A.CICLO_COMERCIAL||'_'||A.OFFER_ID AS "Descripción"---------------------Validar
	, TO_CHAR(A.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(A.FECHA_FIN_CICLO::DATE, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, NULL AS "Hora Inicio (hhMMss)"
	, NULL AS "Hora Fin  (hhMMss)"
	, NULL AS "Dias"
	, 1 AS "Cliente"
	, NULL AS "Tipo de cliente"
	, NULL AS "Locales Positiva"
	, NULL AS "Locales Negativa"
	, NULL AS "Listas Locales Positiva"
	, NULL AS "Listas Locales Negativa"
	, NULL AS "Forma de Pago Positivas"
	, NULL AS "Forma de Pago Negativas"
	, NULL AS "EANS"
	, 'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0) AS "Listas Productos" -------------------------------------ID_PERIODO
	, case
	when UPPER(A.DCTO) LIKE '%X%' THEN substr(UPPER(A.DCTO),0,strpos(UPPER(A.DCTO),'X'))
	ELSE '1'
	END AS CANTIDAD
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, NULL AS "Cantidad Hijo"
	, 1 AS "Estrategia"
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	, NZ_CLIENTES.ADMIN.REPLACE(substr(UPPER(A.DCTO),strpos(UPPER(A.DCTO),'X')+1,LENGTH(UPPER(A.DCTO))),',','.' )::INT AS "Precio Final"
	, NULL AS "Precio Final Hijo"
	, NULL AS "Porcentaje"
	, NULL AS "Máximo Unidades"
	, NULL AS "Monto Dto."
	, 0 AS "Por Unidad"
	, NULL AS "RUT Liquidador"
	, NULL AS "%Liquidacion"
	, 1 AS "Compite"
	, 'DIGALV'||LPAD(A.ID_PERIODO, 3, 0)||LPAD(A.CYCLE, 3, 0)||LPAD(A.OFFER_ID, 5, '0') AS "Campaña Geoloyalty"
	, NULL AS "Sub Campaña Geoloyalty"
	, NULL AS "Cuenta Corriente"
	, NULL AS "Saldo Cuenta Corriente"
	, 1 AS "Campaña por Transaccion"
	, 1 AS "Campaña por Promocion"
	, A.MAX_UNITS AS "Tope Productos"
	, NULL AS "Grupo|Valor"
	, NULL AS "Grupo|Valor Negativo"
	, NULL AS "Código Cupon Externo"
	, NULL AS "ERROR"
FROM--SELECT * FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE IN ($CICLO)
	AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(A.DCTO,',','.'),'X','') > 100
--END REGION
;
--END REGION
;

--246
--REGION INFO DESCUENTO PORCENTUAL
SELECT DISTINCT
	NULL AS "Id"
	, A.ID_WORKFLOW AS "Id Alternativo"
	, 'CUPONES CRM' AS "Tipo de Promoción"
	, 0 AS "Prioridad"
	, 0 AS "Eliminada"
	, NULL AS "Campaña"
	, NULL AS"SubCampaña"
	, 'APP O KIOSCO ALVI' AS "Nombre Promocion"
	, A.TIPO_FINANCIAMIENTO||' CRM_ALVI_APP_'||A.CYCLE||'_'||A.OFFER_ID AS "Descripción"
	, TO_CHAR(A.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(A.FECHA_FIN_CICLO::DATE, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, NULL AS "Hora Inicio (hhMMss)"
	, NULL AS "Hora Fin  (hhMMss)"
	, NULL AS "Dias"
	, 1 AS "Cliente"
	, NULL AS "Tipo de cliente"
	, NULL AS "Locales Positiva"
	, NULL AS "Locales Negativa"
	, NULL AS "Listas Locales Positiva"
	, NULL AS "Listas Locales Negativa"
	, NULL AS "Forma de Pago Positivas"
	, NULL AS "Forma de Pago Negativas"
	, NULL AS "EANS"
	, 'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0) AS "Listas Productos" -------------------------------------ID_PERIODO
	, NULL AS "Cantidad"
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, 1 AS "Cantidad Beneficio"
	, 1 AS "Estrategia"
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	, NULL AS "Precio Final"
	, NULL AS "Precio Final Hijo"
	, (NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(A.DCTO,',','.'),'X','')::FLOAT*100)::INT AS "Porcentaje"
	, NULL AS "Máximo Unidades"
	, NULL AS "Monto Dto."
	, NULL AS "Por Unidad"
	, NULL AS "RUT Liquidador"
	, NULL AS "%Liquidacion"
	, 0 AS "Compite"
	, 'DIGALV'||LPAD(A.ID_PERIODO, 3, 0)||LPAD(A.CYCLE, 3, 0)||LPAD(A.OFFER_ID, 5, '0') AS "Campaña Geoloyalty"
	, NULL AS "Sub Campaña Geoloyalty"
	, NULL AS "CUENTA CORRIENTE"
	, NULL AS " SALDO CUENTA CORRIENTE"
	, 1 AS "Campaña por Transaccion"
	, 1 AS "Campaña por Promocion"
	, A.MAX_UNITS::INTEGER AS "Tope Productos"
	, NULL AS "Grupo|Valor"
	, NULL AS "Grupo|Valor Negativo"
	, NULL AS "Código Cupon Externo"
	, NULL AS "ERROR"
FROM--SELECT * FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE IN ($CICLO)
	AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') < 100
--END REGION
;


--REGION INFO LISTA PRODUCTOS 
SELECT DISTINCT
	'APP'||LPAD(AO.ORGANIZATION_ID,2,0)||LPAD(AO.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(AO.OFFER_ID,5,0) AS "Nombre de lista"
	, TO_CHAR(AO.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(AO.FECHA_FIN_CICLO::DATE, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, AOP.EAN::BIGINT AS "EAN Productos"
	, NULL AS "ERROR"
FROM--SELECT * FROM
	(
		--REGION OFERTAS CYCLE
		SELECT 
			DISTINCT
			CYCLE
			, OFFER_ID 
			, TRIM(EAN::BIGINT) AS EAN
		FROM--select * from
			DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND
		WHERE
			CYCLE = $CICLO
		--END REGION
	) AOP
INNER JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND AO
ON
	AOP.OFFER_ID = AO.OFFER_ID
	AND AOP.CYCLE = AO.CYCLE
WHERE
	AO.CYCLE IN ($CICLO)
--END REGION
;





