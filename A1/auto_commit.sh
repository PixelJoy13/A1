#!/bin/bash

repo_path="/Users/andriishtuler/Desktop/A1/A1"  # Укажите путь к вашему репозиторию

cd "$repo_path"

# Переменные для даты
start_date="2023-12-01"
end_date="2023-12-20"
current_date="$start_date"

while [ "$current_date" != "$end_date" ]; do
  # Получение изменений с удаленного репозитория и интеграция их с локальными изменениями
  git pull origin main

  # Удаление всех файлов в репозитории
  git rm -r --cached .

  # Если файл auto_commit.sh был изменен, отменяем изменения
  git checkout -- "A1/auto_commit.sh"
  
  # Создание новых файлов (или ваших изменений)
  echo "Some content" > "file.txt"
  
  # Добавление всех изменений
  git add .
  
  # Создание коммита с указанием даты
  export GIT_COMMITTER_DATE="$current_date"
  git commit -m "Auto commit: $current_date"
  
  # Отправка изменений на сервер с использованием --force
  git push origin main --force
  
  # Пауза от 45 секунд до 1 минуты 30 секунд
  sleep $((45 + RANDOM % 46))
  
  # Инкрементирование текущей даты
  current_date=$(date -jf "%Y-%m-%d" -v+1d "$current_date" "+%Y-%m-%d")
done

