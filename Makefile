help:
	@cat Makefile

DATA?="${HOME}/data"
GPU?=0
DOCKER_FILE=Dockerfile
DOCKER=GPU=$(GPU) nvidia-docker
BACKEND=theano
SRC=$(shell dirname `pwd`)

build:
	docker build -t quintasan/deeplearning:local -f $(DOCKER_FILE) .

test:
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) --net=host quintasan/deeplearning:latest python3 test.py

bash:
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) --net=host quintasan/deeplearning:latest /bin/bash

ipython:
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) --net=host quintasan/deeplearning:latest ipython

.DEFAULT_GOAL := test
