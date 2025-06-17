import pyarrow.parquet as pq
import pyarrow as pa

# === Cargar archivo Parquet ===
archivo_parquet = ""
tabla = pq.read_table(archivo_parquet)
esquema_arrow = tabla.schema

# === Mapear tipos PyArrow a tipos BigQuery ===
def mapear_tipo_arrow_a_bq(tipo_arrow):
    if pa.types.is_string(tipo_arrow):
        return "STRING"
    elif pa.types.is_date32(tipo_arrow):
        return "DATE"
    elif pa.types.is_timestamp(tipo_arrow):
        return "TIMESTAMP"
    else:
        return "STRING"  # default

# === Generar y mostrar el esquema BQ como lista JSON ===
print("[")
for i, campo in enumerate(esquema_arrow):
    tipo_bq = mapear_tipo_arrow_a_bq(campo.type)
    coma = "," if i < len(esquema_arrow) - 1 else ""
    print(f'    {{"name": "{campo.name}", "mode": "NULLABLE", "type": "{tipo_bq}"}}{coma}')
print("]")
