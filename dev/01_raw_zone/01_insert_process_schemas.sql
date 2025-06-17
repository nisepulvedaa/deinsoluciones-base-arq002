INSERT INTO `dev_config_zone.process_schemas` (
    process_name, 
    params, 
    estatus
) VALUES (
    'process-{{nombre_proceso}}',
    JSON '''
    [
        {"name": "", "mode": "", "type": ""},
        {"name": "", "mode": "", "type": ""},
        {"name": "", "mode": "", "type": ""},
        {"name": "", "mode": "", "type": ""},
        {"name": "", "mode": "", "type": ""},
    ]
    ''',
    1
);


----
SELECT
    process_name,
    params,
    estatus
FROM dev_config_zone.process_schemas
WHERE process_name = 'process-{{nombre_proceso}}';