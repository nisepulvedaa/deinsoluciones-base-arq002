INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-move-file-on-bucket',
    JSON '''
    [
        {"path_origen": "origin-files/","path_destino": "files/{{path_destino}}/", "nombre_archivo": "{{nombre_archivo}}.parquet", "periodicidad": "{{periodicidad}}"}
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
AND process_fn_name = 'fn-move-file-on-bucket'
AND arquetype_name = 'workflow-arquetipo-ingesta-raw-{{version_arquetipo_raw}}';