INSERT INTO `dev_config_zone.process_email` (
    process_name, 
    params, 
    zone_name,
    estatus
) VALUES (
    'process-{{nombre_proceso}}',
    JSON '''
    [
        {
        "email_to_0": "{{correos_destinatarios}}",
        "email_subj_err": "Resultado Ejecución Proceso: process-{{nombre_proceso}}-raw-{{version_arquetipo_raw}} [ERROR]", 
        "email_subj_ok": "Resultado Ejecución Proceso: process-{{nombre_proceso}}-raw-{{version_arquetipo_raw}} [OK]", 
        "email_body_err": "Proces : process-{{nombre_proceso}}-raw de Arquetipo: workflow-arquetipo-ingesta-raw Ejecutado Con Errores!", 
        "email_body_ok": "Proces : process-{{nombre_proceso}}-raw de Arquetipo: workflow-arquetipo-ingesta-raw Ejecutado Ok!"
        }
    ]
    ''',
    'RAW',
    1
);


INSERT INTO `dev_config_zone.process_email` (
    process_name, 
    params, 
    zone_name,
    estatus
) VALUES (
    'process-{{nombre_proceso}}',
    JSON '''
    [
        {
        "email_to_0": "{{correos_destinatarios}}",
        "email_subj_err": "Resultado Ejecución Proceso: process-{{nombre_proceso}}-cleansed [ERROR]", 
        "email_subj_ok": "Resultado Ejecución Proceso: process-{{nombre_proceso}}-cleansed [OK]", 
        "email_body_err": "Proces : process-{{nombre_proceso}}-cleansed de Arquetipo: workflow-arquetipo-ingesta-cleansed Ejecutado Con Errores!", 
        "email_body_ok": "Proces : process-{{nombre_proceso}}-cleansed de Arquetipo: workflow-arquetipo-ingesta-cleansed Ejecutado Ok!"
        }
    ]
    ''',
    'CLEANSED',
    1
);


----
SELECT
    process_name,
    params,
    zone_name,
    estatus
FROM dev_config_zone.process_email
WHERE process_name = 'process-{{nombre_proceso}}';