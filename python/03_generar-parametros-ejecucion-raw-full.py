import json
import sys
import os

ruta_archivo = ""

def generar_parametros_json(ruta_archivo):
    if not os.path.exists(ruta_archivo):
        print(f"El archivo {ruta_archivo} no existe.")
        return

    with open(ruta_archivo, "r", encoding="utf-8") as f:
        datos = json.load(f)

    for entrada in datos:
        cfg = entrada.get("configuracion_del_proceso", {})
        if cfg.get("cfg_wf") == "workflow-arquetipo-ingesta-raw-full":
            salida = {
                "cfg_wf": cfg.get("cfg_wf"),
                "cfg_proc": cfg.get("cfg_proc"),
                "cfg_pe": cfg.get("cfg_pe"),
                **entrada.get("valores_fn_move_file_on_bucket", {}),
                **entrada.get("valores_fn_validacion_de_archivo_gcs", {}),
                **entrada.get("valores_fn_create_table_from_schema", {}),
                **entrada.get("valores_fn_creacion_json_schema_file", {}),
                **entrada.get("valores_fn_delete_from_table", {}),
                "dfraw_input": entrada.get("valores_ejecucion_cf", {}).get("dfraw_input"),
                "dfraw_output": entrada.get("valores_ejecucion_cf", {}).get("dfraw_output"),
                "dfraw_mt": entrada.get("valores_ejecucion_cf", {}).get("dfraw_mt"),
                **entrada.get("valores_fn_validacion_registros_bg", {})
            }

            # Guardar archivo de salida
            nombre_archivo_salida = f"parametros_{cfg.get('cfg_proc')}-raw.json"
            with open(nombre_archivo_salida, "w", encoding="utf-8") as out:
                json.dump(salida, out, indent=4, ensure_ascii=False)
            print(f"Archivo generado: {nombre_archivo_salida}")
        else:
            print(f"Se omitió entrada con cfg_wf: {cfg.get('cfg_wf')}")

if __name__ == "__main__":
    generar_parametros_json(ruta_archivo)
