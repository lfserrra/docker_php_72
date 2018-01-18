# Docker Nginx + PHP 7.2 + Sqlsrv

## First, edit "/path/to/codes" in the docker-compose.yml file for the path of your project
```
#(PHP Section)
volumes:
    - /path/to/codes:/usr/share/nginx/html

#and (WEB Section)
volumes:
    - /path/to/codes:/usr/share/nginx/html
```

### To recompile when changing Dockerfile (both PHP and Nginx)
```
docker-compose build 
```

### To start the docker-compose in the background (-d)
```
docker-compose up -d 
```

### To stop docker-compose
```
docker-compose stop
```

### To stop and exclude docker-compose
```
docker-compose down
```

### To open the bash of one of the images, in this case is the "web"
```
docker-compose exec web /bin/bash 
```

### To create a virtual host
```
docker-compose exec web ./serve.sh app.test /usr/share/nginx/html/app 
```
