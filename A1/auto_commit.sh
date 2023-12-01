#!/bin/bash

repo_path="/Users/andriishtuler/Desktop/A1/A1"  # Укажите путь к вашему репозиторию

cd "$repo_path"

# Переменные для даты
start_date="2023-12-01"
end_date="2023-12-20"
current_date="$start_date"

while [ "$current_date" != "$end_date" ]; do
  # Удаление всех файлов в репозитории
  git rm -r --cached .
  
  # Создание новых файлов (или ваших изменений)
  echo "Some content" > "file.txt"
  
  # Добавление всех изменений
  git add .
  
  # Создание коммита с указанием даты
  git commit --date="$current_date" -m "Auto commit: $current_date"
  
  # Пуш изменений с указанием origin и main
  git push origin main
  
  # Пауза в 1 минуту
  sleep 60
  
  # Инкрементирование текущей даты
  current_date=$(date -jf "%Y-%m-%d" -v+1d "$current_date" "+%Y-%m-%d")
done

