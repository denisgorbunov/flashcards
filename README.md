[![Build Status](https://travis-ci.org/denisgorbunov/flashcards.svg?branch=sixth-task)](https://travis-ci.org/denisgorbunov/flashcards)

# Флэшкарточкер

Первый в мире удобный менеджер флеш-карточек.

## Требования и зависимости
* Ruby version: >= 2.2.5
* PostgreSQL: >= 9.4
* rails >= 5.0.0.1

## Установка и запуск
Загрузить кодовую базу из репозитория:
```
git clone https://github.com/denisgorbunov/flashcards.git
```
Перейти в каталог приложения
```
cd flashcards
```
Установить/обновить зависимости
```
bundle install
```
Создать базу данных и прогнать миграции.
```
rails db:setup
rails db:migrate
```
Запустить приложение на локальном веб-сервере:
```
rails s
```
