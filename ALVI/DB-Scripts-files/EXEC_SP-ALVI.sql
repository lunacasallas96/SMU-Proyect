/**********************EJECUTAR SP*************************************/
--CICLO,PERIODO
EXEC DESA_CLIENTES.RU.SP_LOAD_APP_ALLOCATION_FILES_OP_PC();
EXEC DESA_CLIENTES.RU.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_CUSTOMER(14);
EXEC DESA_CLIENTES.RU.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_OFFER(14,13);
EXEC DESA_CLIENTES.RU.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER(14,13);

/**********************CAMBIARSE DE BD*********************************/
SET CATALOG NZ_CLIENTES;
EXEC NZ_CLIENTES.STG.SP_LOAD_STG_OUTPUT_RD_FILES_BETATEST_ALVI();
/************************TRUNCAR TABLAS********************************/
TRUNCATE TABLE NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER;
TRUNCATE TABLE NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_OFFER;
TRUNCATE TABLE NZ_CLIENTES.STG.STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER;

