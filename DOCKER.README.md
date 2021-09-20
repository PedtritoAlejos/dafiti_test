### Para efectos de prueba se creo una base de datos a partir del diagrama

### Para ejecutarlo con docker-compose :

estructura del directorio :
```bash
pealejosb@MacBook-Pro-de-pealejosb docker-db % tree .
.
├── data
│   ├── dump
│   │   └── 01.sql
│   └── mysql
└── docker-compose.yml

3 directories, 2 files
pealejosb@MacBook-Pro-de-pealejosb docker-db % 

```
Comando :
```bash
pealejosb@MacBook-Pro-de-pealejosb docker-db % docker-compose up -d    
Creating equipo-db ... done
pealejosb@MacBook-Pro-de-pealejosb docker-db % 
```
```bash
pealejosb@MacBook-Pro-de-pealejosb docker-db % docker ps 
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS          PORTS                                                  NAMES
cefc928333fd   mysql:5.7   "docker-entrypoint.s…"   38 seconds ago   Up 38 seconds   33060/tcp, 0.0.0.0:3307->3306/tcp, :::3307->3306/tcp   equipo-db
88aad59a3328   mysql       "docker-entrypoint.s…"   6 days ago       Up 6 days       0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   survey-db
pealejosb@MacBook-Pro-de-pealejosb docker-db % 

```