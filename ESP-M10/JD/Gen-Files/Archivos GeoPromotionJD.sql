

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
	, CASE 
	   WHEN A.OFERTA_NUEVA = 'X'
	   THEN 'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0)
	   ELSE
	   'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO-1,3,0)||LPAD(A.OFFER_ID,5,0) END AS "Listas Productos" -------------------------------------ID_PERIODO
	, case 
	 	when UPPER(A.DCTO) LIKE '%X%' THEN  substr(UPPER(A.DCTO),0,strpos(UPPER(A.DCTO),'X'))
		ELSE  '1'
		END AS CANTIDAD 
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, null as "Cantidad Beneficio"
	, 2 AS Estrategia
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	--, (NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(A.DCTO,',','.'),'X',''))::INT AS "Precio Final"
	, NZ_CLIENTES.ADMIN.REPLACE(substr(UPPER(A.DCTO),strpos(UPPER(A.DCTO),'X')+1,LENGTH(UPPER(A.DCTO))),',','.' )::INT AS "Precio Final"
	, NULL AS "Precio Final Hijo"
	, NULL AS "Porcentaje"
	, NULL AS "Máximo Unidades"
	, NULL AS "Monto Dto."
	, 0 AS "Por Unidad" --> deben ir con 0
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
	DESA_CLIENTES.JL.APP_M10_OFERTAS_JD A
	--Where cycle = 41
	--AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') > 100
WHERE
	A.CYCLE IN ($CICLO)
	AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') > 100
--END REGION
;

--119
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
	, CASE 
	   WHEN A.OFERTA_NUEVA = 'X'
	   THEN 'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO,3,0)||LPAD(A.OFFER_ID,5,0)
	   ELSE
	   'APP'||LPAD(A.ORGANIZATION_ID,2,0)||LPAD(A.ID_PERIODO,2,0)||LPAD($CICLO-1,3,0)||LPAD(A.OFFER_ID,5,0) END AS "Listas Productos" -------------------------------------ID_PERIODO
	, NULL AS "Cantidad"
	, NULL AS "EANS Hijo"
	, NULL AS "Lista Hijo"
	, 1 AS "Cantidad Beneficio"
	, 2 AS Estrategia
	, NULL AS "EANs Negativos"
	, NULL AS "Lista Productos Negativos"
	, NULL AS "Precio Final"
	, NULL AS "Precio Final Hijo"	
	, CASE
       WHEN 
       sqlext..replace(A.DCTO, '0,', '') > 100
       THEN A.DCTO::INT 
       ELSE
       sqlext..replace(A.DCTO, ',', '.')::FLOAT * 100::INT
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
	DESA_CLIENTES.JL.APP_M10_OFERTAS_JD A
WHERE
	A.CYCLE IN ($CICLO)
	AND sqlext..replace(A.DCTO, '0,', '') < 100
	--AND NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(A.DCTO),',','.'),'X','') < 100
--END REGION
;
