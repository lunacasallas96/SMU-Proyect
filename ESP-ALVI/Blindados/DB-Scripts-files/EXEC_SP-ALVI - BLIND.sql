/**********************EJECUTAR SP*************************************/
--CICLO,PERIODO
EXEC DESA_CLIENTES.JL.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_OFFER_BLIND(3,13);
EXEC DESA_CLIENTES.JL.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_BLIND(3,13);
/**********************CAMBIARSE DE BD*********************************/


