# Публикация изменений в GitHub

Репозиторий: https://github.com/bebrasn1ffer/smartoffice (ветка `main`).
Актуальное состояние на 19.11.2026 — коммит `97feda7`; он уже отправлен на GitHub.
Рабочая копия на WIN-01: `C:\Users\Administrator\Desktop\repo` (синхронизирована с `origin/main`).

## Как опубликовать будущие изменения

Нужен fine-grained token с правом **Contents: Read and write** на этот репозиторий
или классический token со scope `repo`. Токен в файлы репозитория не добавлять.

```powershell
cd "C:\Users\Administrator\Desktop\repo"
$env:GIT_TERMINAL_PROMPT = "0"
$token = "<ТОКЕН С ПРАВОМ ЗАПИСИ>"
git add -A
git commit -m "краткое описание изменений"
git push "https://$token@github.com/bebrasn1ffer/smartoffice.git" main
```

После отправки токен из истории команд удалить. В репозиторий не попадают:
рабочая база `telemetry.sqlite3`, каталоги данных контейнеров, резервные копии,
пароли и токены.
