SELECT ddl FROM dev_raw_zone.INFORMATION_SCHEMA.TABLES
WHERE table_name = "";

ALTER TABLE dataset.table_name_old
RENAME TO table_name_new;