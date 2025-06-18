INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name,
    params,
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-insert-data',
    JSON '''
    [
        {"dataset_name": "{{dataset_raw_zone}}","table_name": "{{nombre_tabla_raw}}","zone_name": "RAW"}
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
AND process_fn_name = 'fn-insert-data'
AND arquetype_name = 'workflow-arquetipo-ingesta-raw-{{version_arquetipo_raw}}';