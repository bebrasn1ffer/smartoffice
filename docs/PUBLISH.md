# Публикация изменений в GitHub

В репозитории подготовлены два коммита (ветка `main`, база — текущий `bb69ad6`):

- `36fc0c3` Работы 5-8: очистка потока Node-RED, исправление приёмника БД,
  Prometheus и Grafana, правила и SMTP, документы и доказательства
- `f7864b9` Отчёты 5-8: актуализированы в составе документов

Токен `github_pat_11COCGY6Q...` даёт доступ только на чтение (GitHub отвечает
`403 Resource not accessible by personal access token`), поэтому отправка не выполнена.

## Как отправить

Нужен fine-grained token с правом **Contents: Read and write** на репозиторий
`bebrasn1ffer/smartoffice` (или классический token со scope `repo`).

```powershell
cd "C:\Users\10240796\Documents\deepseek-harness\default-workspace\repo-clone"
$env:GIT_TERMINAL_PROMPT = "0"
$token = "<НОВЫЙ_ТОКЕН>"
git push "https://$token@github.com/bebrasn1ffer/smartoffice.git" main
```

После успешной отправки удалить токен из истории команд и не хранить его в файлах
репозитория. Отдельно проверено, что в репозиторий не попадают рабочая база
`telemetry.sqlite3`, каталоги данных контейнеров, резервные копии и пароли.
