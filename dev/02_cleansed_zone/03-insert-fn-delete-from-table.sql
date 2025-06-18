INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-delete-from-table',
    JSON '''
    [
        {"table_name": "{{nombre_tabla_cleansed}}" ,"dataset_name": "{{dataset_cleansed_zone}}","fecha_columna": "{{campo_fecha_tabla_raw}}", "fecha_param": "{{fecha_ejecucion}}", "periodicidad": "{{periodicidad}}"}
    ]
    ''',
    'workflow-arquetipo-ingesta-cleansed',
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
AND process_fn_name = 'fn-delete-from-table'
AND arquetype_name = 'workflow-arquetipo-ingesta-cleansed';
