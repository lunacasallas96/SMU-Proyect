/**********************EJECUTAR SP*************************************/
--CC/PP
EXEC DESA_CLIENTES.JL.SP_LOAD_APP_ALLOCATION_FILES_MAIPU_M10();
EXEC DESA_CLIENTES.JL.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_OFFER_MAIPU_M10(1,9);
EXEC DESA_CLIENTES.JL.SP_LOAD_STG_OUTPUT_DIGITAL_FILE_CUSTOMER_OFFER_MAIPU_M10(1,9);

/**********************CAMBIARSE DE BD*********************************/
