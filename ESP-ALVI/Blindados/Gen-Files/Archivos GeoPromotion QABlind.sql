DROP TABLE DESA_CLIENTES.JL.TMP_ARCHIVO_QA_ALVI_BLIND IF EXISTS;
CREATE TABLE DESA_CLIENTES.JL.TMP_ARCHIVO_QA_ALVI_BLIND AS
--REGION ARCHIVO QA PARA APP
SELECT DISTINCT
	AOP.EAN::VARCHAR(200) AS "EANS"
	, DPH.NM AS "Descripción Producto"
	, NULL AS "Criticidad"
	, NULL AS "Unidad Medida Venta"
	, AOP.MODAL AS "Precio Normal"
	, CASE
		when UPPER(OF.DCTO) LIKE '%X%' THEN substr(UPPER(OF.DCTO),0,strpos(UPPER(OF.DCTO),'X'))
		ELSE '1'
		END AS "Factor"--"Max_Unit(TOPE)"
	, OF.MAX_UNITS AS "Max_Unit(TOPE)"
	, NULL AS "Factor Tarjeta"
	, CASE WHEN NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(OF.DCTO),',','.'),'X','') > 100 THEN NULL ELSE (NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(OF.DCTO),',','.'),'X','')::FLOAT*100)::INTEGER||'%' END AS "%Descuento"
	, NULL AS "Descuento Tarjeta"
	, CASE
		WHEN NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(OF.DCTO),',','.'),'X','')::INT > 100
		and UPPER(OF.DCTO) NOT LIKE '%X%' then (NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(OF.DCTO),'X',''), ',','.')::INT)::NVARCHAR(255)
		when NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(OF.DCTO),',','.'),'X','')::INT < 100
		THEN ((AOP.MODAL*(1-NZ_CLIENTES.ADMIN.REPLACE(NZ_CLIENTES.ADMIN.REPLACE(UPPER(OF.DCTO),',','.'),'X','')::FLOAT))::INTEGER)::NVARCHAR(255)
		ELSE UPPER(OF.DCTO)
	END AS "Precio Oferta por Factor"
	, NULL AS "Escala"
	, NULL AS "PACK/ Pack Virtual"
	, NULL AS "Agrupación Pack Virtual"
	, R.ID_PROMOTION AS "ID Promoción"
	, NULL AS "ID Promoción Tarjeta"
	, NULL AS "Bonificación"
	, '145411254' AS "RUT"
	, NULL AS "Medio de Pago"
	, NULL AS "Código Cupon"
	, NULL AS "Monto Restricción Al Medio de pago"
	, R.LISTAS_PRODUCTOS AS "Lista de Productos"
	, NULL AS "Lista Locales"
	, LTRIM(DPH.SKU_PRODUCT,'0') AS "Codigo SAP"
	, R.ID_GEOLOYALTY AS "CTA CTE"
FROM --SELECT 1 FROM  
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND OF
INNER JOIN --SELECT * FROM
	DESA_CLIENTES.JL.APP_ALVI_REL_IDS_BLIND R
ON
	OF.OFFER_ID = CASE WHEN R.LISTAS_PRODUCTOS LIKE '-' THEN NULL ELSE SQLEXT..REPLACE(R.LISTAS_PRODUCTOS,'APP'||LPAD(OF.ORGANIZATION_ID,2,0)||LPAD(OF.ID_PERIODO,2,0)||LPAD($CICLO,3,0), '')::INTEGER END
	--OF.OFFER_ID = SUBSTR(R.LISTAS_PRODUCTOS,11,length(R.LISTAS_PRODUCTOS))::INTEGER
	AND OF.CYCLE = $CICLO
INNER JOIN--SELECT * FROM
	(
--REGION OFERTA - EAN
		SELECT
			DISTINCT 
			OFFER_ID
			, TRIM(EAN)::BIGINT AS EAN
			, MODAL
		FROM
			DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND AOP
		WHERE
			AOP.CYCLE = $CICLO
		--END REGION
	) AOP
ON
	OF.OFFER_ID = AOP.OFFER_ID
LEFT JOIN
	PROD_AMP_MART.AMP.DIM_PRODUCT_HIERARCHY DPH
ON
	TRIM(AOP.EAN)::VARCHAR(200) = TRIM(DPH.EAN)::VARCHAR(200)
WHERE
	OF.CYCLE = $CICLO
	AND AOP.EAN IS NOT NULL
	
--END REGION
;


DROP TABLE DESA_CLIENTES.JL.TMP_RANKING_EAN_ALVI_BLIND IF EXISTS;
CREATE TABLE DESA_CLIENTES.JL.TMP_RANKING_EAN_ALVI_BLIND AS
--REGION RANKING EAN
SELECT
	DISTINCT
	A.OFFER_ID
	, A.EAN
	, A.RANKING_EAN
FROM
	(
		--REGION RANKING EAN X VENTA X OFERTA
		SELECT
			A.OFFER_ID
			, A.EAN
			, B.SALES_AMT
			, ROW_NUMBER() OVER(PARTITION BY OFFER_ID ORDER BY B.SALES_AMT DESC) AS RANKING_EAN
		FROM
			(
				--REGION EAN X OFERTA
				SELECT
					DISTINCT
					A.OFFER_ID
					, TRIM(A.EAN) AS EAN
				FROM
					DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
				WHERE
					A.CYCLE = $CICLO
				--END REGION
			) A
		INNER JOIN
			(
				--REGION VENTA X EAN ULT 3 MESES
				SELECT
					TRIM(FD.EAN) AS EAN
					, SUM(FD.SALES_AMT) AS SALES_AMT
				FROM
					NZ_PRODUCCION.BDF.FACT_DETAIL_MONTH_DAY_CUSTOMER_CENTER_ARTICLE FD
				WHERE
					FD.HED_FECHATRX BETWEEN NOW()::DATE-90 AND NOW()::DATE-1
					AND FD.ORGANIZATION_ID = 5
				GROUP BY 1
			--END REGION
			) B
		ON
			A.EAN = B.EAN
		GROUP BY 1,2,3
	--END REGION
	) A
ORDER BY 1,3
--END REGION
;

--REGION ARCHIVO QA
SELECT
	EANS
	, "Descripción Producto"
	, B.RANKING_EAN AS "Criticidad"
	, "Unidad Medida Venta"
	, "Precio Normal"
	, "Factor"
	, "Max_Unit(TOPE)"
	, "Factor Tarjeta"
	, "%Descuento"
	, "Descuento Tarjeta"
	, "Precio Oferta por Factor"
	, "Escala"
	, "PACK/ Pack Virtual"
	, "Agrupación Pack Virtual"
	, "ID Promoción"
	, "ID Promoción Tarjeta"
	, "Bonificación"
	, RUT
	, "Medio de Pago"
	, "Código Cupon"
	, "Monto Restricción Al Medio de pago"
	, "Lista de Productos"
	, "Lista Locales"
	, "Codigo SAP"
	, "CTA CTE" 
FROM --SELECT * FROM
	DESA_CLIENTES.JL.TMP_ARCHIVO_QA_ALVI_BLIND A
INNER JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND PLU
ON
	PLU.EAN = A.EANS
LEFT JOIN
	--SELECT * FROM
	DESA_CLIENTES.JL.TMP_RANKING_EAN_ALVI_BLIND B
ON
	A.EANS = B.EAN
	AND PLU.OFFER_ID  = B.OFFER_ID
WHERE
	PLU.CYCLE = $CICLO
;
--END REGION

select * from DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND--274

--REGION ARCHIVO RANKING
SELECT
    DISTINCT
    A.CYCLE
    , A.OFFER_ID
    , ROW_NUMBER() OVER(PARTITION BY CYCLE ORDER BY A.SALES_AMT DESC) AS RANKING_OFFER
FROM
    (
        --REGION RANKING EAN X VENTA X OFERTA
        SELECT
            A.CYCLE
            , A.OFFER_ID
            , SUM(B.SALES_AMT) AS SALES_AMT
        FROM
            (
                --REGION EAN X OFERTA
                SELECT
                    DISTINCT
                    A.CYCLE
                    , A.OFFER_ID
                    , TRIM(A.EAN) AS EAN
                FROM
                    DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
                WHERE
                    A.CYCLE = $CICLO
                --END REGION
            ) A
        INNER JOIN
            (
                --REGION VENTA X EAN ULT 3 MESES
                SELECT
                    TRIM(FD.EAN) AS EAN
                    , SUM(FD.SALES_AMT) AS SALES_AMT
                FROM
                    NZ_PRODUCCION.BDF.FACT_DETAIL_MONTH_DAY_CUSTOMER_CENTER_ARTICLE FD
                WHERE
                    FD.HED_FECHATRX BETWEEN NOW()::DATE-2000 AND NOW()::DATE-1
                    AND FD.ORGANIZATION_ID = 5
                GROUP BY 1
            --END REGION
            ) B
        ON
            A.EAN = B.EAN
        GROUP BY 1,2
    --END REGION
    ) A
ORDER BY 3 ASC
;

--END REGION