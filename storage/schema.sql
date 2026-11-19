-- Схема базы telemetry.sqlite3 (DB-01). Создаётся вручную до первого запуска приёмника.
CREATE TABLE measurements (
  id INTEGER PRIMARY KEY,
  source TEXT NOT NULL,
  device_id TEXT NOT NULL,
  metric TEXT NOT NULL,
  zone TEXT NOT NULL,
  timestamp INTEGER NOT NULL,
  received_at INTEGER NOT NULL,
  value REAL NOT NULL,
  unit TEXT NOT NULL,
  labels TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE actuator_events (
  id INTEGER PRIMARY KEY,
  source TEXT NOT NULL,
  device_id TEXT NOT NULL,
  zone TEXT NOT NULL,
  timestamp INTEGER NOT NULL,
  received_at INTEGER NOT NULL,
  state TEXT NOT NULL,
  mode TEXT NOT NULL
);

-- Индексы добавлены при подготовке к защите: без них запросы истории сортировали всю таблицу
-- и удерживали блокировку записи.
CREATE INDEX IF NOT EXISTS idx_measurements_ts ON measurements(timestamp);
CREATE INDEX IF NOT EXISTS idx_measurements_dev_metric_ts
  ON measurements(device_id, metric, timestamp DESC);
CREATE INDEX IF NOT EXISTS idx_actuator_ts ON actuator_events(timestamp DESC);
