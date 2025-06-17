import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import os

# === Configuraciones ===
archivo_parquet = ''
archivo_salida = ''





rename_dict = {
    '': '',

}


# === Leer parquet ===
df = pd.read_parquet(archivo_parquet)


# Filtrar y renombrar columnas
columnas_disponibles = [col for col in rename_dict if col in df.columns]
df = df[columnas_disponibles].rename(columns={k: v for k, v in rename_dict.items() if k in columnas_disponibles})

'''
periodo_mes = '2025-05-01'
# Agregar columna de periodo
df['periodo_mes'] = pd.to_datetime(periodo_mes)
'''

# Forzar tipo string (solo pandas) para columnas que no contienen 'fec' ni 'periodo'
for col in df.columns:
    if not any(keyword in col.lower() for keyword in ['fec', 'periodo']):
        df[col] = df[col].astype(str)

# Creamos una tabla Arrow con todos los campos como string explícitamente (excepto fechas)
fields = []
for col in df.columns:
    if any(keyword in col.lower() for keyword in ['fec', 'periodo']):
        df[col] = pd.to_datetime(df[col], errors='coerce').dt.date  #  convertir a date
        fields.append(pa.field(col, pa.date32()))                   #  schema como date32
    else:
        df[col] = df[col].astype(str)
        fields.append(pa.field(col, pa.string()))
schema = pa.schema(fields)

# Convertimos DataFrame a tabla Arrow con schema definido
table = pa.Table.from_pandas(df, schema=schema, preserve_index=False)

# === Guardar como Parquet con schema controlado ===
pq.write_table(table, archivo_salida)

print("Archivo Parquet guardado con schema forzado a STRING (y fechas) en:", archivo_salida)
print("Schema físico del archivo:")
print(table.schema)
