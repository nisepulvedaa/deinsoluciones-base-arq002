INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-load-to-parquet-to-bq',
    JSON '''
    [
        {"input": "{{input}}","output": "{{output}}",  "periodicidad": "{{periodicidad}}"}
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
AND process_fn_name = 'fn-load-to-parquet-to-bq'
AND arquetype_name = 'workflow-arquetipo-ingesta-raw-{{version_arquetipo_raw}}';