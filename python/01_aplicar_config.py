import os
import re
import config
from pathlib import Path

# === Cargar variables desde config.py ===
variables = {k: v for k, v in config.__dict__.items() if not k.startswith("__")}

# Cargar rutas desde config
rutas = {
    "raw": Path(config.directorio_raw),
    "cleansed": Path(config.directorio_cleansed),
}

# Validar existencia de directorios
for zona, path_dir in rutas.items():
    if not path_dir.exists():
        print(f" El directorio '{path_dir}' no existe.")
        exit(1)

# Detectar archivo RAW correspondiente
if config.version_arquetipo_raw.lower() == "slim":
    nombre_objetivo_raw = "03_json_file_raw_slim.json"
elif config.version_arquetipo_raw.lower() == "full":
    nombre_objetivo_raw = "03_json_file_raw_full.json"
else:
    print(f" Versión de arquetipo inválida: {config.version_arquetipo_raw}")
    exit(1)

# === Recorrer y reemplazar variables ===
for zona, path_dir in rutas.items():
    print(f"\n Procesando zona {zona.upper()} en: {path_dir.resolve()}")

    for archivo in path_dir.rglob("*"):
        if not archivo.is_file() or archivo.suffix not in [".sql", ".json"]:
            continue

        # Saltar archivo RAW incorrecto
        if zona == "raw" and "03_json_file_raw" in archivo.name and archivo.name != nombre_objetivo_raw:
            print(f"  Omitido: {archivo.name}")
            continue

        print(f"🔧 Reemplazando variables en: {archivo.name}")

        with open(archivo, "r", encoding="utf-8") as f:
            contenido = f.read()

        # Reemplazo de {{variable}} por valor correspondiente
        for var, valor in variables.items():
            valor_str = str(valor).strip().lower()

            if valor_str in ["true", "1"]:
                valor_final = "true"
            elif valor_str in ["false", "0"]:
                valor_final = "false"
            else:
                valor_final = str(valor)

            contenido = re.sub(rf"\{{\{{\s*{var}\s*\}}\}}", valor_final, contenido)

        # Guardar directamente sobrescribiendo
        with open(archivo, "w", encoding="utf-8") as f:
            f.write(contenido)

print("\n Reemplazo de variables completado exitosamente.")
