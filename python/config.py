# Ruta base donde están los archivos a modificar
directorio_objetivo = "../dev"
directorio_raw = "../dev/01_raw_zone"
directorio_cleansed = "../dev/02_cleansed_zone"
##Config Zone
nombre_proceso=""
version_arquetipo_raw=""
periodicidad=""# diario|mensual|esporadico
##Raw Zone
correos_destinatarios=""
nombre_tabla_raw=""
campo_fecha_tabla_raw="" #vacio si no viene nada
fecha_ejecucion="0"  #debe ser 0 sino viene nada
##Cleansed Zone
ejecutar_sat="1" #1=true|0=false
ejecutar_hub="0" #1=true|0=false
ejecutar_link="0" #1=true|0=false
nombre_tabla_satelite=""
nombre_tabla_hub=""
nombre_tabla_link=""
campo_fecha_tabla_satelite="" #vacio si no viene nada