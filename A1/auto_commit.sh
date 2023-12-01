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
  
  # Создание новых файлов (или ваших изменений)
  echo "Some content" > "file.txt"
  
  # Добавление всех изменений
  git add .
  
  # Создание коммита с указанием даты
  git commit --date="$current_date" -m "Auto commit: $current_date"
  
  # Отправка изменений на сервер с использованием --force
  git push origin main --force
  
  # Пауза в 1 минуту
  sleep 60
  
  # Инкрементирование текущей даты
  current_date=$(date -v+1d -jf "%Y-%m-%d" "$current_date" "+%Y-%m-%d")
done

