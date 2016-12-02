# Deep learning with Docker

This directory contains a `Dockerfile` that will prevent your from gouging your eyes out with a rusty spoon when trying to set up all that stuff.

## Requirements

1. (Docker)[https://docs.docker.com/engine/installation/linux/ubuntulinux/]
2. (NVIDIA Docker)]https://github.com/NVIDIA/nvidia-docker] if you want GPU (you probably do)
3. NVIDIA drivers on your host if you installed NVIDIA Docker.

## How to use this?

There's a `Makefile` here. Use it.

To start an iPython shell:

`$ make ipython`

Want a shell? Invoke:

`$ make bash`

By default this image uses Theano, if you want TensorFlow then invoke:

`make [ipython, bash] BACKEND=tensorflow`

If you want to bring your own data to the container then invoke:

`make [ipython, bash] DATA=/path/to/your/data/`

Your stuff will be available under `/src` inside the container.

If you invoke `make` without any target then it will try running a simple LSTM. Use this to see if it is actually using the damn GPU.

You can get a list of all tasks by running `make help`.
