FROM python:3.7

# Update the system and install redis server
RUN apt-get update && apt-get -y install redis-server

# Creating Application Source Code Directory
RUN mkdir -p /k8s_python_demo_code/

# Setting Home Directory for containers
WORKDIR /k8s_python_demo_code/

# Installing python dependencies
COPY requirements.txt /k8s_python_demo_code/
RUN pip install --no-cache-dir -r requirements.txt

# Copying src code to Container
COPY ./app/ /k8s_python_demo_code/app


# Setting Persistent data
WORKDIR /k8s_python_demo_code/app

# Running Python Application