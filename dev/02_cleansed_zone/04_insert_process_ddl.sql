INSERT INTO `dev_config_zone.process_ddl` (
    process_name, 
    table_type, 
    ddl_statement, 
    is_active
) VALUES (
    'process-{{nombre_proceso}}',
    'satelite',
    '{ddl_sat}',
    TRUE
);

INSERT INTO `dev_config_zone.process_ddl` (
    process_name, 
    table_type, 
    ddl_statement, 
    is_active
) VALUES (
    'process-{{nombre_proceso}}',
    'hub',
    '{ddl_hub}',
    TRUE
);


INSERT INTO `dev_config_zone.process_ddl` (
    process_name, 
    table_type, 
    ddl_statement, 
    is_active
) VALUES (
    'process-{{nombre_proceso}}',
    'link',
    '{ddl_link}',
    TRUE
);


