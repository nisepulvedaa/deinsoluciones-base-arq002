INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-validacion-de-registros-bq',
    JSON '''
    [
        {"dataset_id": "{{dataset_raw_zone}}","table_id": "{{nombre_tabla_raw}}", "fecha_columna": "{{campo_fecha_tabla_raw}}", "fecha_param": "{{fecha_ejecucion}}", "periodicidad": "{{periodicidad}}"}
    ]
    ''',
    'workflow-arquetipo-ingesta-raw-{{version_arquetipo_raw}}',
    TRUE
);


----
SELECT
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
FROM dev_config_zone.process_params
WHERE process_name = 'process-{{nombre_proceso}}'
AND process_fn_name = 'fn-validacion-de-registros-bq'
AND arquetype_name = 'workflow-arquetipo-ingesta-raw-{{version_arquetipo_raw}}';