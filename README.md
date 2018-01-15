# Docker Nginx+PHP 7.2+Sqlsrv 

### Para recompilar quando alterar o Dockerfile (Tanto do PHP quanto do Nginx)
```
docker-compose build 
```

### Para iniciar o container docker em background (-d)
```
docker-compose up -d 
```

### Para parar o container
```
docker-compose stop
```

### Pra parar e excluir os containers
```
docker-compose down
```

### Para abrir o bash de uma das imagens, nesse caso é o "web"
```
docker-compose exec web /bin/bash 
```

### Para criar um virtual host
```
docker-compose exec web ./serve.sh app.test /usr/share/nginx/html/app 
```
