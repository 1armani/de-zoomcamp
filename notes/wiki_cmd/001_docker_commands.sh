docker vs virtual
	virtual:
		os withing os. consume a lot of resources
	docker:
		isolated env. uses os of the host computer => more lightweight

- run container from "hello-world" image:
	docker run -it hello-image #<-it>=interactive mode, <hello-image>=name of the image in the repo
- create python container from python container
	`docker run -it python:3.9`
- connect with bash to Python container :
	`docker run -it --entrypoint=bash python:3.9`
- install pandas in container Python
	- pip install pandas

docker run -it google/cloud-sdk:latest

- list all the containers:
	docker ps

- creat a new image!!
	1) create dockerfile in VSCOde:

		FROM python:3.9  #specifies image name from which to create

		RUN pip install pandas #installs panda

		ENTRYPOINT [ "bash" ]  #overrides entry point

	2) build image (within the folder with Dockerfile):
		`docker build -t test:pandas . `  #<-t>=tag; <test>=name of image; <pandas>=tag; <.> current dir with dockerfile

	3) run the image:
		docker run -it test:pandas

		- check if pandas already installed:
			python
			import pandas #should work!
			pandas.__version__


- dockerfile for pipeline (to execute py script within container)

	FROM python:3.9  #specifies image name from which to create

	RUN pip install pandas #installs panda

	WORKDIR /app   # this line creates dir /app in container and the cd to it
	COPY pipeline.py pipeline.py #this copies the file from host to container

	ENTRYPOINT = ['python','pipeline.py']



- run docker with postgres:
	docker run -it \
		-e POSTGRES_USER="root" \
		-e POSTGRES_PASSWORD="root" \
		-e POSTGRES_DB="ny_taxi" \
		-v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
		-p 5432:5432 \
		postgres:13

	<-e> = for specifieng env variables
	<-v> = for mounting local host folders to the docker image/container

- connect with pgcli to our database
	pgcli -h localhost -p 5432 -U root -d ny_taxi 	#successful connection!


- launch jupyter notebook
	jupyter notebook	

- create network
	docker network create pg-network

# run docker with postgres withing network
	docker run -it \
	    -e POSTGRES_USER="root" \
	    -e POSTGRES_PASSWORD="root" \
	    -e POSTGRES_DB="ny_taxi" \
	    -v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
	    -p 5432:5432 \
	    --network=pg-network \
	    --name pg-database \
	    postgres:13

# copy from the docker to localhost
docker cp ba7b0b00941e:/root/response.json .


docker exec -it hive-server /bin/bash
docker exec -it bdb41caa9f5d /bin/bash

# see the logs of particular container
docker logs hive-metastore

# connect to 
docker-compose exec hive-server bash 

docker pull bde2020/hive-metastore-postgresql:latest

# remove docker volumes
docker system prune --volumes    

# list the networks
docker network ls

