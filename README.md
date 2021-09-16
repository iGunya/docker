### Создание образа
```
docker build -t s3-log .
```
### Запуск контейнера
```
docker run --privileged -v $PWD/result-log:/var/log/nginx -p 2020:2020 s3-log 
```
### Сохранение ключей AWS
Выполнить скрипт create-aws-key.sh: 
```
./create-aws-key.sh
```
P.S. установить s3fs по ссылке: [инструкция](https://github.com/s3fs-fuse/s3fs-fuse#installation) 

### Монтирование диска
```
s3fs oct5-agency <путь монтирования>/docker/s3disk/ -o passwd_file=$HOME/.passwd-s3fs -o url=http://localhost:2020 -o use_path_request_style
```

В папке s3disk появляются файлы из бакета

В папке result-log 3 файла с логами Nginx