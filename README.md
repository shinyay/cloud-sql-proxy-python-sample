# Access to Cloud SQL via Cloyd SQL Proxy

Overview

## Description

## Demo
### Connect Cloud SQL Instance
```
$ gcloud sql connect <INSTANCE_NAME> --user=root --quiet
```

### Prepare database
```
CREATE DATABASE library;
USE library;
CREATE TABLE books (title VARCHAR(100));
INSERT into books (title) VALUES ("Cloud SQL");
```

### Create Docker Bridge Network
```
$ docker network create -d bridge proxy
```

### Create Docker image for python app
```
$ docker built -t <CONTAINER_NAME> .
```

### Run Cloud SQL Proxy container
```
$ docker run --name cloud_sql_proxy --net=proxy -d --rm -p 3306:3306 gcr.io/cloudsql-docker/gce-proxy:1.16 /cloud_sql_proxy -instances=<CLOUD_SQL_CONNECTION_STRING>=tcp:0.0.0.0:3306
```

### Run Sample Python App with Docker Network
```
$ docker run --rm -it --net=proxy <CONTAINER_NAME>
```


## Features

- feature:1
- feature:2

## Requirement

## Usage

## Installation

## Licence

Released under the [MIT license](https://gist.githubusercontent.com/shinyay/56e54ee4c0e22db8211e05e70a63247e/raw/34c6fdd50d54aa8e23560c296424aeb61599aa71/LICENSE)

## Author

[shinyay](https://github.com/shinyay)
