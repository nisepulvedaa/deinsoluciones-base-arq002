# Ruta base donde están los archivos a modificar
directorio_objetivo = "../dev"
directorio_raw = "../dev/01_raw_zone"
directorio_cleansed = "../dev/02_cleansed_zone"
##RAW ZONE
nombre_proceso="" #nombre-proceso
version_arquetipo_raw="" ##slim|full
periodicidad="" # diario|mensual|esporadico
path_destino=""#path-name
nombre_archivo="" #file-name
correos_destinatarios=""
##
dataset_raw_zone=""
nombre_tabla_raw=""
campo_fecha_tabla_raw="" #debe ser  "" si no viene nada
fecha_ejecucion=""  #debe ser  "" sino viene nada
##
input="" #fomarto gs://bucket/path/filename.ext
output="" #formato project.dataset.table



##CLEANSED ZONE
ejecutar_sat="1" #1=true|0=false
ejecutar_hub="0" #1=true|0=false
ejecutar_link="0" #1=true|0=false
nombre_tabla_satelite=""
nombre_tabla_hub=""
nombre_tabla_link=""
campo_fecha_tabla_satelite="" #vacio si no viene nada