/***********************************
REVISAR RANKING Y 
OFFER ID DUPLICADOS
************************************/

SELECT
	A.CUSTOMER_ID
	, A.OFFER_ID
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--43732583
GROUP BY 1,2
HAVING COUNT > 1
;--0

SELECT
	A.CUSTOMER_ID
	, A.OFFER_ID
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A--43732583
GROUP BY 1,2
HAVING COUNT > 1
;--0

SELECT COUNT(DISTINCT CUSTOMER_ID) FROM (
SELECT
	A.CUSTOMER_ID
	, A.OFFER_ID
	, COUNT(*)
FROM
	(
		SELECT
			*
		FROM 
			DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A
		UNION ALL
		SELECT
			*
		FROM 
			DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC B
	) A--43732583
GROUP BY 1,2
HAVING COUNT > 1) A
;--0

SELECT
	A.CUSTOMER_ID
	, A.OFFER_RANK
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A
GROUP BY 1,2
HAVING COUNT > 1
;

SELECT
	A.CUSTOMER_ID
	, A.OFFER_RANK
	, COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A
GROUP BY 1,2
HAVING COUNT > 1
;

/************************************************************/
SELECT
	COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--652574
;


SELECT
	COUNT(DISTINCT A.CUSTOMER_ID)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--144863
;

SELECT
	COUNT(DISTINCT A.OFFER_ID)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--
;--115

 UPDATE 
 --SELECT * FROM
 DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
 WHERE TIPO_OFERTA = 'Personalizada'
 SET TIPO_OFERTA = 'Personalizada'
-- REGION VAL OFERTAS ALVI
SELECT
	COUNT(1),
	'Total'--SELECT *
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = $CICLO
UNION
SELECT
	COUNT(1),
	'Personalizada'
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = $CICLO
	AND UPPER(TIPO_OFERTA) = UPPER('Personalizada')
UNION
SELECT
	COUNT(1),
	'Kiosco'
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = $CICLO
	AND TIPO_OFERTA = 'Kiosco'
UNION
SELECT
	COUNT(1),
	'Personalizada'
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = $CICLO
	AND TIPO_OFERTA = 'Personalizada'
UNION
SELECT
	COUNT(1),
	'Masivas'
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = $CICLO
	AND TIPO_OFERTA = 'Masivas'
--END REGION
;
--3
-- PERSONALIZADAS 0
-- MASIVAS 39
-- KIOSCO 0

SELECT
	COUNT(1)
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
WHERE
	A.CYCLE = 3
--273

SELECT
	--COUNT(DISTINCT A.OFFER_ID)
	DISTINCT A.OFFER_ID
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--175
INNER JOIN--SELECT * FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P--201
ON--37284
	A.OFFER_ID = P.OFFER_ID
WHERE
	P.CYCLE = $CICLO--186
	AND P.TIPO_OFERTA LIKE 'Personalizada%'
;-- 112


SELECT
	DISTINCT
	A.OFFER_ID
	, P.OFFER_ID
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--257
LEFT JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P--227
ON
	A.OFFER_ID = P.OFFER_ID
	AND P.CYCLE = $Ciclo
	AND P.TIPO_OFERTA LIKE 'Personalizada%'
;--146

/*--
ofertas OP están en los archivos de DH, pero no en el archivo de ofertas
237
782
1979
*/
SELECT OFFER_ID FROM 
DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC
--DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND
WHERE OFFER_ID IN (
7172
)
AND CYCLE = 9

SELECT
	DISTINCT
	A.OFFER_ID
	, P.OFFER_ID
FROM -- select * from 
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--257
RIGHT JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P--227
ON
	A.OFFER_ID = P.OFFER_ID
WHERE
	P.CYCLE = $CICLO
	AND P.TIPO_OFERTA LIKE 'Personalizada%'
;--146

/*Estan en el archivo oferta, pero no en el ALLOCATION
7172
*/

SELECT
	COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A--246
WHERE
	A.OFFER_ID IN ('920')
;--144

SELECT
	*
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A--184
WHERE
	A.CYCLE = 2
	AND A.OFFER_ID IN ('2009',
'237',
'2576',
'1814')
;
/*
OFFER_ID	OFFER_DESC
7162	QUESO CHEDDAR BARRA DOS ALAMOS 
*/

/************************PENETRACIÓN CATEGORIA**********************/
SELECT
	COUNT(*)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A--1196942
;

SELECT
	COUNT(DISTINCT A.CUSTOMER_ID)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A--163424
;

SELECT
	COUNT(DISTINCT A.OFFER_ID)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A--94
;

SELECT
	COUNT(DISTINCT A.OFFER_ID)
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = $CICLO
	AND A.TIPO_OFERTA LIKE 'Personalizada%'
;--0

SELECT
	COUNT(DISTINCT A.OFFER_ID)
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A--134
INNER JOIN--SELECT * FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P--183
ON--37284
	A.OFFER_ID = P.OFFER_ID
WHERE
	P.CYCLE = $CICLO--141
	AND P.TIPO_OFERTA LIKE 'Personalizada%'
;--92

SELECT
	DISTINCT
	A.OFFER_ID
	, P.OFFER_ID
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A--257
LEFT JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P--227
ON
	A.OFFER_ID = P.OFFER_ID
	AND P.CYCLE = $CICLO
	AND P.TIPO_OFERTA LIKE 'Personalizada%'
;--124

/*
Ofertas PC están en los archivos de DH, pero no en el archivo de ofertas
782
237
*/


SELECT
	DISTINCT
	A.OFFER_ID
	, P.OFFER_ID
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A--257
RIGHT JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P--227
ON
	A.OFFER_ID = P.OFFER_ID
WHERE 
	P.CYCLE = $CICLO
	AND P.TIPO_OFERTA LIKE 'Personalizada%'
;--187
/*
Ofertas PC 
estan en el archivo oferta, pero no en DH
2023
1987
2076
2138
1776
1218
2807
1997
1694
1976
1714
785
1705
1718
1699
2272
7172
2016
1757
1726
2197
*/
SELECT
	DISTINCT
	OFFER_ID
FROM
	DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP
WHERE OFFER_ID IN (

7172
)
SELECT
	*
FROM
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A--246
WHERE
	A.OFFER_ID in (7172)
	AND A.CYCLE = 10
;

/*

*/

--REGION OBTENER OFERTAS QUE NO ESTAN EN ALLOCATION OP NI PC 

SELECT
	B.OFFER_ID
FROM
	(
	SELECT
		DISTINCT
		P.OFFER_ID
	FROM
		DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_OP A
	RIGHT JOIN
		DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P
	ON
		A.OFFER_ID = P.OFFER_ID
	WHERE
		P.CYCLE = $CICLO
		AND UPPER(P.TIPO_OFERTA) = UPPER('Personalizada')
		AND A.OFFER_ID IS NULL
	)A
INNER JOIN
	(
	SELECT
		DISTINCT
		P.OFFER_ID
	FROM
		DESA_CLIENTES.RU.APP_ALVI_TMP_ALLOCATION_FILE_PC A
	RIGHT JOIN
		DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND P
	ON
		A.OFFER_ID = P.OFFER_ID
	WHERE 
		P.CYCLE = $CICLO
		AND UPPER(P.TIPO_OFERTA) = UPPER('Personalizada')
		AND A.OFFER_ID IS NULL
	)B
ON
	A.OFFER_ID = B.OFFER_ID 
--END REGION	
;

/************************VALIDA CRUCE DE OFERTAS************************************/
--VALIDACION DE CARGAS DE CRM

SELECT
	A.OFFER_ID
	, COUNT(*)
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = 3
GROUP BY 1
;--137

SELECT OFFER_ID, TIPO_OFERTA FROM 
DELETE FROM
DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND 
WHERE OFFER_ID IN (
1979,
782,
237,
2009)
AND TIPO_OFERTA = 'Personalizada'



SELECT
	DISTINCT A.OFFER_ID
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = 3
;--184

SELECT
	DISTINCT A.OFFER_ID
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
WHERE
	A.CYCLE = 3
;--184

/*************************REVISAR EANS DUPLICADOS*********************************+*/
SELECT B.EAN
FROM
(SELECT
	A.EAN
	, COUNT(*)
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
WHERE
	A.CYCLE = 2
GROUP BY 1
HAVING COUNT > 1) B
;

SELECT 
	A.ROWID,
	A.OFFER_ID,
	A.EAN
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
INNER JOIN
	(
	SELECT 
		ROW_NUMBER()OVER(PARTITION BY A.EAN ORDER BY A.EAN)AS POS,
		A.EAN,
        A.ROWID
        FROM 
			DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
        INNER JOIN 
        	(
            SELECT 
            	A.EAN,
            	COUNT(*)
            FROM 
				DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A 
			WHERE
				A.CYCLE = $CICLO
            GROUP BY A.EAN
            HAVING COUNT(*) > 1
        ) TB
        ON A.EAN = TB.EAN
		WHERE
		A.CYCLE = $CICLO
	)B
	ON	A.ROWID = B.ROWID
	AND B.POS > 1
;--OBTENER DUPLICADOS       

DELETE
FROM
	DESA_CLIENTES.RU.APP_ALVI_OFERTAS_PLU A
WHERE
	ROWID IN 
			(
			SELECT 
				A.ROWID
			FROM 
				DESA_CLIENTES.RU.APP_ALVI_OFERTAS_PLU A
			INNER JOIN
			(
			SELECT 
				ROW_NUMBER()OVER(PARTITION BY A.EAN ORDER BY A.EAN)AS POS,
				A.EAN,
		        A.ROWID
		        FROM 
					DESA_CLIENTES.RU.APP_ALVI_OFERTAS_PLU A
		        INNER JOIN 
		        	(
		            SELECT 
		            	A.EAN,
		            	COUNT(*)
		            FROM 
						DESA_CLIENTES.RU.APP_ALVI_OFERTAS_PLU A 
					WHERE
						A.CYCLE = $CICLO
		            GROUP BY A.EAN
		            HAVING COUNT(*) > 1
		        ) TB
		        ON A.EAN = TB.EAN
				WHERE
				A.CYCLE = $CICLO
			)B
			ON	A.ROWID = B.ROWID
			AND B.POS > 1  
			)
;

DELETE--select * 
FROM
	DESA_CLIENTES.RU.APP_ALVI_OFERTAS_PLU A
WHERE
EAN = 7808743601903
	ROWID IN (169116016302730,169116016302732,169116016302735,169116016302733,169116016302727,169116016302726)
;

SELECT
	DISTINCT
	A.OFFER_ID
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
WHERE
	A.CYCLE = 3
;--184

--TOTAL DE EAN, QUE CUADRE CON ARCHIVO GEO LISTA DE PRODUCTOS
SELECT
	DISTINCT
	COUNT(A.EAN)
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A
WHERE
	A.CYCLE = 3
;--273


--INNER
SELECT
	DISTINCT
	A.OFFER_ID
	, B.OFFER_ID
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
INNER JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND B
ON
	A.OFFER_ID = B.OFFER_ID
	AND A.CYCLE = B.CYCLE
WHERE
	B.CYCLE = 2
;--39

SELECT
	DISTINCT
	A.OFFER_ID
	, B.OFFER_ID
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
LEFT JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND B
ON
	A.OFFER_ID = B.OFFER_ID
	AND A.CYCLE = B.CYCLE
WHERE
	A.CYCLE = 2
;--39

SELECT
	DISTINCT
	A.OFFER_ID
	, B.OFFER_ID
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
RIGHT JOIN
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND B
ON
	A.OFFER_ID = B.OFFER_ID
	AND A.CYCLE = B.CYCLE
WHERE
	B.CYCLE = 2
;--39

SELECT
	COUNT(*)
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_PLU_BLIND A 
WHERE
	A.CYCLE = 3
;--273

SELECT
	*
FROM 
	DESA_CLIENTES.JL.APP_ALVI_OFERTAS_BLIND A
WHERE
	A.CYCLE = 2
	AND OFFER_ID IN (2263,
	1010)
;--39

--PRECIO REFERENCIAL, SIEMPRE ES NULL, A MENOS QUE TENGA PRECIO FIJO
--ID WORKFLOW PUEDE SER NULL PERO TIENE QUE SER TIPO_FINANCIAMIENTO S/F
--DCTO NO PUEDE SER NULL
--MARCA NO PUEDE SER NULL, 
--OFFER DESC NO PUEDE SER NULL
-- OFFER LEGAR NO PUEDE SER NULO