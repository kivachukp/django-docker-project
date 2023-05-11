# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3
# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONUNBUFFERED 1
# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /django-docker
# Копирует все файлы из нашего локального проекта в контейнер
# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
#помещаем в корневую папку образа
# первая точка - копирует все папки и файлы находящиеся в директории с Dockerfile
# вторая точка - копирует в корневую папку, чтобы закинуло в нужную нужно прописать name/

CMD [ "python", "djangodocker/your-deamon-or-script.py" ]