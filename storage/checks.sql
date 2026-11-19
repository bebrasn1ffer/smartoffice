-- Запросы проверки записей (выполнять на DB-01).
.tables
SELECT COUNT(*) FROM measurements;
SELECT COUNT(*) FROM actuator_events;
SELECT id, source, device_id, metric, zone, value, unit,
       datetime(timestamp/1000, 'unixepoch') AS ts
  FROM measurements ORDER BY id DESC LIMIT 10;
SELECT id, source, device_id, state, mode, datetime(timestamp/1000, 'unixepoch') AS ts
  FROM actuator_events ORDER BY id DESC LIMIT 10;
-- Периодичность датчика: интервал между соседними записями должен быть около 5 секунд.
SELECT (timestamp - lag(timestamp) OVER (ORDER BY id)) / 1000.0 AS dt_seconds
  FROM measurements WHERE device_id = 'TEMP-01' ORDER BY id DESC LIMIT 10;
