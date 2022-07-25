--3
-- 'CUPONES CRM' -> NIVEL 1000  PROMOCIONES QUE COMPITEN CON LAS PROMOCIONES DEL CATALOGO
--  'Nivel 2000' --> 2000  DESCUENTO ADICIONAL QUE NO COMPITE CON LAS PROMOCIONES DE CATALOGO 
--  'Nivel 3000'TARJETA UNIMARC (DESCUENTO ADICIONAL) -> NIVEL 3000   DESCUENTOS DE TOTAL BOLETA
--REVISA CABECERA PRIMERO
--REGION INFO PRECIO FIJO
SELECT DISTINCT
	  NULL AS "Id"
	, A.ID_WORKFLOW AS "Id Alternativo"
	, 'CUPONES CRM' AS "Tipo de Promoción"
	, 0 AS "Prioridad"  -- cuando no compiten aplica mayor prioridad (menor a mayor 0 -> mayor prioridad)
	, 0 AS "Eliminada"
	, NULL AS "Campaña"
	, NULL AS "SubCampaña"
	, 'APP CLUB AHORRO' AS "Nombre Promocion"
	, CASE
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('Sin financiamiento')
	  THEN
	  'S/F'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('sell out')
	  THEN
	  'S/O'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  ELSE
	  A.TIPO_FINANCIAMIENTO||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  END
	  AS "Descripción"
	, TO_CHAR(A.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(A.FECHA_FIN_CICLO::DATE, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, null AS "Hora Inicio (hhMMss)"
	, null AS "Hora Fin (hhMMss)"
	, NULL AS "Dias"
	, 1 AS "Cliente"
	, NULL AS "Tipo de cliente"
	, NULL AS "Locales Positiva"
	, NULL AS "Locales Negativa"
	, NULL AS "Listas Locales Positiva"
	, NULL AS "Listas Locales Negativa"
	, NULL AS "Forma de Pago Positivas"
	, NULL AS "Forma de Pago Negativas"
	, NULL AS "No Existe Forma de Pago"
	, NULL AS "Bin"
	, NULL AS "EANS"
	,'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0)  AS "Listas Productos" -------------------------------------ID_PERIODo
	, NULL AS "Cantidad"
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, 1 as "Cantidad Beneficio"
	, 2 AS Estrategia
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	, NZ_CLIENTES.ADMIN.REPLACE(substr(UPPER(A.DCTO),strpos(UPPER(A.DCTO),'X')+1,LENGTH(UPPER(A.DCTO))),',','.' )::INT AS "Precio Final"
	, NULL AS "Precio Final Hijo"
	, NULL AS "Porcentaje"
	, NULL AS "Máximo Unidades"
	, NULL AS "Monto Dto."
	, 1 AS "Por Unidad" --> deben ir con 1
	, NULL AS "RUT Liquidador"
	, NULL AS "%Liquidacion"
	, 1 AS "Compite"
	, 'DIGMAY'||LPAD(A.ID_PERIODO, 3, 0)||LPAD(A.CYCLE, 3, 0)||LPAD(A.OFFER_ID, 5, '0') AS "Campaña Geoloyalty"
	, NULL AS "Sub Campaña Geoloyalty"
	, NULL AS "Cuenta Corriente"
	, NULL AS "Saldo Cuenta Corriente"
	, 1 AS "Campaña Por Transacción"
	, 1 AS "Campaña Por Promoción"
	, A.MAX_UNITS AS "Tope Productos"
	, NULL AS "Grupo|Valor"
	, NULL AS "Grupo|Valor Negativos"
	, NULL AS "Código Cupon Externo"
	, NULL AS "ERROR"
FROM--SELECT CICLO_COMERCIAL FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS A
	--Where cycle = 41
	--AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') > 100
WHERE
	A.CYCLE IN ($CICLO)
	AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') > 100
	AND A.OFFER_ID IN (6016,6373,6053,6060,6061,6083,6116)
--END REGION
;
--REVISA CABECERA SEGUNDO
--REGION INFO PRECIO FIJO
SELECT DISTINCT
	NULL AS "Id"
	, A.ID_WORKFLOW AS "Id Alternativo"
	, 'CUPONES CRM' AS "Tipo de Promoción"
	, 0 AS "Prioridad"  -- cuando no compiten aplica mayor prioridad (menor a mayor 0 -> mayor prioridad)
	, 0 AS "Eliminada"
	, NULL AS "Campaña"
	, NULL AS "SubCampaña"
	, 'APP CLUB AHORRO' AS "Nombre Promocion"
	, CASE
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('Sin financiamiento')
	  THEN
	  'S/F'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('sell out')
	  THEN
	  'S/O'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  ELSE
	  A.TIPO_FINANCIAMIENTO||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  END
	  AS "Descripción"
	, TO_CHAR(A.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(A.FECHA_FIN_CICLO::DATE, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, null AS "Hora Inicio (hhMMss)"
	, null AS "Hora Fin (hhMMss)"
	, NULL AS "Dias"
	, 1 AS "Cliente"
	, NULL AS "Tipo de cliente"
	, NULL AS "Locales Positiva"
	, NULL AS "Locales Negativa"
	, NULL AS "Listas Locales Positiva"
	, NULL AS "Listas Locales Negativa"
	, NULL AS "Forma de Pago Positivas"
	, NULL AS "Forma de Pago Negativas"
	, NULL AS "No Existe Forma de Pago"
	, NULL AS "Bin"
	, NULL AS "EANS"
	,CASE 
	WHEN OFERTA_NUEVA IS NOT NULL
	THEN 'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0) 
	ELSE
	'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO_P,3,0)||LPAD(A.OFFER_ID,5,0) 
	END AS "Listas Productos" -------------------------------------ID_PERIODO
	, NULL AS "Cantidad"
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, 1 as "Cantidad Beneficio"
	, 2 AS Estrategia
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	, NZ_CLIENTES.ADMIN.REPLACE(substr(UPPER(A.DCTO),strpos(UPPER(A.DCTO),'X')+1,LENGTH(UPPER(A.DCTO))),',','.' )::INT AS "Precio Final"
	, NULL AS "Precio Final Hijo"
	, NULL AS "Porcentaje"
	, NULL AS "Máximo Unidades"
	, NULL AS "Monto Dto."
	, 1 AS "Por Unidad" --> deben ir con 1
	, NULL AS "RUT Liquidador"
	, NULL AS "%Liquidacion"
	, 1 AS "Compite"
	, 'DIGMAY'||LPAD(A.ID_PERIODO, 3, 0)||LPAD(A.CYCLE, 3, 0)||LPAD(A.OFFER_ID, 5, '0') AS "Campaña Geoloyalty"
	, NULL AS "Sub Campaña Geoloyalty"
	, NULL AS "Cuenta Corriente"
	, NULL AS "Saldo Cuenta Corriente"
	, 1 AS "Campaña Por Transacción"
	, 1 AS "Campaña Por Promoción"
	, A.MAX_UNITS AS "Tope Productos"
	, NULL AS "Grupo|Valor"
	, NULL AS "Grupo|Valor Negativos"
	, NULL AS "Código Cupon Externo"
	, NULL AS "ERROR"
FROM--SELECT * FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS A
WHERE
	A.CYCLE IN ($CICLO)
	AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') > 100
--END REGION
;

--REVISA CABECERA PRIMERO
--REGION INFO DESCUENTO PORCENTUAL
SELECT DISTINCT
	NULL AS "Id"
	, A.ID_WORKFLOW AS "Id Alternativo"
	, 'CUPONES CRM' AS "Tipo de Promoción"
	, 0 AS "Prioridad"
	, 0 AS "Eliminada"
	, NULL AS "Campaña"
	, NULL AS"SubCampaña"
	, 'APP CLUB AHORRO' AS "Nombre Promocion"
	, CASE
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('Sin financiamiento')
	  THEN
	  'S/F'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('sell out')
	  THEN
	  'S/O'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  ELSE
	  A.TIPO_FINANCIAMIENTO||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  END
	  AS "Descripción"
	, TO_CHAR(A.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(A.FECHA_FIN_CICLO::DATE, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, null AS "Hora Inicio (hhMMss)"
	, null AS "Hora Fin (hhMMss)"
	, NULL AS "Dias"
	, 1 AS "Cliente"
	, NULL AS "Tipo de cliente"
	, NULL AS "Locales Positiva"
	, NULL AS "Locales Negativa"
	, NULL AS "Listas Locales Positiva"
	, NULL AS "Listas Locales Negativa"
	, NULL AS "Forma de Pago Positivas"
	, NULL AS "Forma de Pago Negativas"
	, NULL AS "No Existe Forma de Pago"
	, NULL AS "BIN"
	, NULL AS "EANS"
	, 'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0) AS "Listas Productos" -------------------------------------ID_PERIODO
	, NULL AS "Cantidad"
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, 1 AS "Cantidad Beneficio"
	, 2 AS Estrategia
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	, NULL AS "Precio Final"
	, NULL AS "Precio Final Hijo"	
	--, A.DCTO
	, CASE
       WHEN 
       sqlext..replace(A.DCTO, '0,', '') > 100
       THEN A.DCTO::INT 
       ELSE
       sqlext..replace(A.DCTO, ',', '.')::FLOAT * 1::INT
    END AS "Porcentaje" 
	, NULL AS "Máximo Unidades"
	, NULL AS "Monto Dto."
	, NULL AS "Por Unidad"
	, NULL AS "RUT Liquidador"
	, NULL AS "%Liquidacion"
	, 1 AS "Compite"
	, 'DIGMAY'||LPAD(A.ID_PERIODO, 3, 0)||LPAD(A.CYCLE, 3, 0)||LPAD(A.OFFER_ID, 5, '0') AS "Campaña Geoloyalty"
	, NULL AS "Sub Campaña Geoloyalty"
	, NULL AS "CUENTA CORRIENTE"
	, NULL AS " SALDO CUENTA CORRIENTE"
	, 1 AS "Campaña Por Transacción"
	, 1 AS "Campaña Por Promoción"
	, A.MAX_UNITS AS "Tope Productos"
	, NULL AS "Grupo|Valor"
	, NULL AS "Grupo|Valor Negativos"
	, NULL AS "Código Cupon Externo"
	, NULL AS "ERROR"
FROM--SELECT * FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS A
WHERE
	A.CYCLE IN ($CICLO)
	AND sqlext..replace(A.DCTO, '0,', '') < 100
	AND A.OFFER_ID IN (6016,6373,6053,6060,6061,6083,6116)
	--AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') < 100
--END REGION

--REVISA CABECERA SEGUNDO
--REGION INFO DESCUENTO PORCENTUAL
SELECT DISTINCT
	NULL AS "Id"
	, A.ID_WORKFLOW AS "Id Alternativo"
	, 'CUPONES CRM' AS "Tipo de Promoción"
	, 0 AS "Prioridad"
	, 0 AS "Eliminada"
	, NULL AS "Campaña"
	, NULL AS"SubCampaña"
	, 'APP CLUB AHORRO' AS "Nombre Promocion"
	, CASE
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('Sin financiamiento')
	  THEN
	  'S/F'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  WHEN UPPER(A.TIPO_FINANCIAMIENTO) = UPPER('sell out')
	  THEN
	  'S/O'||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  ELSE
	  A.TIPO_FINANCIAMIENTO||' CRM_M10_APP_'||UPPER(A.CICLO_COMERCIAL)||'_'||A.OFFER_ID 
	  END
	  AS "Descripción"
	, TO_CHAR(A.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(A.FECHA_FIN_CICLO::DATE, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, null AS "Hora Inicio (hhMMss)"
	, null AS "Hora Fin (hhMMss)"
	, NULL AS "Dias"
	, 1 AS "Cliente"
	, NULL AS "Tipo de cliente"
	, NULL AS "Locales Positiva"
	, NULL AS "Locales Negativa"
	, NULL AS "Listas Locales Positiva"
	, NULL AS "Listas Locales Negativa"
	, NULL AS "Forma de Pago Positivas"
	, NULL AS "Forma de Pago Negativas"
	, NULL AS "No Existe Forma de Pago"
	, NULL AS "BIN"
	, NULL AS "EANS"
	,CASE 
	WHEN OFERTA_NUEVA IS NOT NULL
	THEN 'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0) 
	ELSE
	'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO_P,3,0)||LPAD(A.OFFER_ID,5,0) 
	END AS "Listas Productos" -------------------------------------ID_PERIODO
	, NULL AS "Cantidad"
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, 1 AS "Cantidad Beneficio"
	, 2 AS Estrategia
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	, NULL AS "Precio Final"
	, NULL AS "Precio Final Hijo"	
	--, A.DCTO
	, CASE
       WHEN 
       sqlext..replace(A.DCTO, '0,', '') > 100
       THEN A.DCTO::INT 
       ELSE
       sqlext..replace(A.DCTO, ',', '.')::FLOAT * 1::INT
    END AS "Porcentaje" 
	, NULL AS "Máximo Unidades"
	, NULL AS "Monto Dto."
	, NULL AS "Por Unidad"
	, NULL AS "RUT Liquidador"
	, NULL AS "%Liquidacion"
	, 1 AS "Compite"
	, 'DIGMAY'||LPAD(A.ID_PERIODO, 3, 0)||LPAD(A.CYCLE, 3, 0)||LPAD(A.OFFER_ID, 5, '0') AS "Campaña Geoloyalty"
	, NULL AS "Sub Campaña Geoloyalty"
	, NULL AS "CUENTA CORRIENTE"
	, NULL AS " SALDO CUENTA CORRIENTE"
	, 1 AS "Campaña Por Transacción"
	, 1 AS "Campaña Por Promoción"
	, A.MAX_UNITS AS "Tope Productos"
	, NULL AS "Grupo|Valor"
	, NULL AS "Grupo|Valor Negativos"
	, NULL AS "Código Cupon Externo"
	, NULL AS "ERROR"
FROM--SELECT * FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS A
WHERE
	A.CYCLE IN ($CICLO)
	AND sqlext..replace(A.DCTO, '0,', '') < 100
	--AND A.OFFER_ID IN (6016,6373,6053,6060,6061,6083,6116)
	--AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') < 100
--END REGION

;
--validar ofertas nuevas
	SELECT * FROM 
	DESA_CLIENTES.RU.APP_M10_OFERTAS
	WHERE CYCLE = $CICLO
	AND OFFER_ID NOT IN (
	SELECT OFFER_ID
	FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS
	WHERE CYCLE = $ciclo-1)
	AND OFERTA_NUEVA IS NOT NULL

--REVISA CABECERA
--REGION INFO LISTA PRODUCTOS 
SELECT DISTINCT
	'APP'||LPAD(AO.ORGANIZATION_ID,2,0)||LPAD(AO.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(AO.OFFER_ID,5,0) AS "Nombre de lista"
	, TO_CHAR(AO.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(AO.FECHA_FIN_CICLO_MENSUAL, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, AOP.EAN AS "EAN Productos"
	, NULL AS "ERROR"
FROM--SELECT * FROM
	--DESA_CLIENTES.RC.APP_OFERTAS_PLU AOP
	(
		--REGION PARCHE
		SELECT 
			DISTINCT
			CYCLE
			, OFFER_ID 
			, TRIM(EAN) AS EAN
		FROM
			DESA_CLIENTES.RU.APP_M10_OFERTAS_PLU
		--END REGION
	) AOP
INNER JOIN--SELECT * FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS AO
ON
	AOP.OFFER_ID = AO.OFFER_ID
	AND AOP.CYCLE = AO.CYCLE
WHERE
	AO.CYCLE IN ($CICLO)
	AND AOP.OFFER_ID IN (6016,6373,6053,6060,6061,6083,6116)
--END REGION
--LA CANTIDAD DE REGISTROS DE LISTA DE PRODUCTOS TIENE QUE SER IGUAL A LA CANTIDAD DE APP_M10_OFERTAS_PLU
;
--REVISA CABECERA
--REGION INFO LISTA PRODUCTOS MENSUAL NUEVOS
SELECT DISTINCT
	'APP'||LPAD(AO.ORGANIZATION_ID,2,0)||LPAD(AO.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(AO.OFFER_ID,5,0) AS "Nombre de lista"
	, TO_CHAR(AO.FECHA_INICIO_CICLO::DATE, 'YYYYMMDD') AS "Desde  (aaaaMMdd)"
	, TO_CHAR(AO.FECHA_FIN_CICLO_MENSUAL, 'YYYYMMDD') AS "Hasta  (aaaaMMdd)"
	, AOP.EAN AS "EAN Productos"
	, NULL AS "ERROR"
FROM--SELECT * FROM DESA_CLIENTES.RU.APP_M10_OFERTAS AOP
	(
		--REGION PARCHE
		SELECT 
			DISTINCT
			CYCLE
			, OFFER_ID 
			, TRIM(EAN) AS EAN
		FROM
			DESA_CLIENTES.RU.APP_M10_OFERTAS_PLU
		--END REGION
	) AOP
INNER JOIN--SELECT * FROM
	DESA_CLIENTES.RU.APP_M10_OFERTAS AO
ON
	AOP.OFFER_ID = AO.OFFER_ID
	AND AOP.CYCLE = AO.CYCLE
WHERE
	AO.CYCLE IN ($CICLO)
	AND AO.OFERTA_NUEVA = 'X'
--END REGION
--LA CANTIDAD DE REGISTROS DE LISTA DE PRODUCTOS TIENE QUE SER IGUAL A LA CANTIDAD DE APP_M10_OFERTAS_PLU (ES LO MISMO)
;