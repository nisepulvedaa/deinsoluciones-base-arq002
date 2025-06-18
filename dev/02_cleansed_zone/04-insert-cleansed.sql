--SAT
INSERT INTO `dev_config_zone.process_insert` (
    process_name, 
    table_type, 
    insert_statement, 
    is_active
) VALUES (
    'process-{{nombre_proceso}}',
    'satelite',
    "INSERT INTO `deinsoluciones-serverless.dev_cleansed_zone.{nombre_tabla_satelite}` SELECT DISTINCT SAFE_CAST(TO_HEX(MD5(UPPER(CONCAT({campo_principal})))) AS BYTES) AS hk_,{campos_satelite},CAST(CURRENT_DATETIME('America/Santiago') AS TIMESTAMP) AS fhr_carga FROM `dev_raw_zone.{tabla_raw}` raw WHERE raw.{campo_fecha_tabla_raw} = DATE('${fecha_param}');",
    TRUE
);


--HUB
INSERT INTO `dev_config_zone.process_insert` (
    process_name, 
    table_type, 
    insert_statement, 
    is_active
) VALUES (
    'process-{{nombre_proceso}}',
    'hub',
    "INSERT INTO `deinsoluciones-serverless.dev_cleansed_zone.{nombre_tabla_hub}` SELECT SAFE_CAST(TO_HEX(MD5(UPPER(CONCAT({campo_principal})))) AS BYTES) AS hk_,{campos_hub}, CAST(CURRENT_DATETIME('America/Santiago') AS TIMESTAMP) AS fhr_carga FROM `dev_raw_zone.{tabla_raw}` raw LEFT JOIN `deinsoluciones-serverless.dev_cleansed_zone.{tabla_hub}` hub ON hub.{llave_hub} = SAFE_CAST(TO_HEX(MD5(UPPER(CONCAT(raw.{llave_raw}})))) AS BYTES) WHERE hub.{llave_hub} IS NULL and raw.{campo_fecha_tabla_raw} = DATE('${fecha_param}');",
    TRUE
);


--LINK
INSERT INTO `dev_config_zone.process_insert` (
    process_name, 
    table_type, 
    insert_statement, 
    is_active
) VALUES (
    'process-{{nombre_proceso}}',
    'link',
    "INSERT INTO `deinsoluciones-serverless.dev_cleansed_zone.{nombre_tabla_link}` SELECT SAFE_CAST(TO_HEX(MD5(UPPER(CONCAT({campo_principal})))) AS BYTES) AS hk_,{campos_link},CAST(CURRENT_DATETIME('America/Santiago') AS TIMESTAMP) AS fhr_carga FROM `dev_raw_zone.{tabla_raw}` raw LEFT JOIN `dev_cleansed_zone.tabla_link}` link ON link.hk_l_derivado = SAFE_CAST(TO_HEX(MD5(UPPER(CONCAT(raw.{llave_link})))) AS BYTES) WHERE link.{llave_link} IS NULL and raw.{campo_fecha_tabla_raw} = DATE('${fecha_param}');",
    TRUE
);

