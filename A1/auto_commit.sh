#!/bin/bash

repo_path="/Users/andriishtuler/Desktop/A1/A1"  # Укажите путь к вашему репозиторию

cd "$repo_path"

# Переменные для даты
start_date="2023-12-02"
end_date="2023-12-21"
current_date="$start_date"

while [ "$current_date" != "$end_date" ]; do
  # Получение изменений с удаленного репозитория и интеграция их с локальными изменениями
  git pull origin main

  # Создание нового файла
  new_file="file_${current_date}.txt"
  echo "Some content" > "$new_file"

  # Добавление нового файла
  git add "$new_file"
  
  # Создание коммита с указанием даты
  git commit --date="$current_date" -m "Auto commit: $current_date"
  
  # Отправка изменений на сервер с использованием --force
  git push origin main --force
  
  # Пауза в интервале от 30 секунд до 1 минуты 30 секунд
  sleep $((30 + RANDOM % 60))
  
  # Инкрементирование текущей даты
  current_date=$(date -v+1d -jf "%Y-%m-%d" "$current_date" "+%Y-%m-%d")
done

