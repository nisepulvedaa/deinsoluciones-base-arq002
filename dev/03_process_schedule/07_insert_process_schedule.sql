INSERT INTO `dev_config_zone.process_schedule` (
    process_name, 
    periodicidad, 
    dias_semana, 
    dias_mes, 
    solo_dia_habil,
    json_config_raw,
    json_config_cleansed,
    active
) VALUES (
    'process-{nombre_proceso}',
    '', --DIARIO | MENSUAL | ESPORADICO
    [1,2,3,4,5], -- [1,2,3,4,5,6,7]
    [], -- algun dia mes en espefico
    TRUE,
    JSON '''
    [
        {campos_arquetipo_zona_raw}
    ]
    ''',
    JSON '''
    [
        {campos_arquetipo_zona_cleansed}
    ]
    ''',
    TRUE
);
