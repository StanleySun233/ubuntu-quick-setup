# ubuntu-quick-setup

```shell
git clone https://github.com/StanleySun233/ubuntu-quick-setup.git
cd ubuntu-quick-setup
sh setup.sh
```

## Current Usage:
1. apt setup
2. docker setup
  2.1. add some docker containers

## 1. mysql 5.7
### for shell
```shell
docker run -p 3306:3306 --name mysql \
  -v /mydata/mysql/log:/var/log/mysql \
  -v /mydata/mysql/data:/var/lib/mysql \
  --restart=always \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -d mysql:5.7
```
### for cmd
```cmd
docker run -p 3306:3306 --name mysql -v /mydata/mysql/log:/var/log/mysql -v /mydata/mysql/data:/var/lib/mysql --restart=always -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
```

## 2. portainer
```shell
docker run -d -p 8005:9000 \
  --restart=always \
  --name portainer \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/sjsun/docker/portainer/data:/data \
   portainer/portainer-ce
```

## 3. redis
```shell
docker run --restart=always -p 6379:6379 --name redis -d redis:6.2.1  --requirepass pwd
```

## 4. minio
```shell
docker run --name minio -d \
  --restart=always \
  -p 9000:9000 -p 9090:9090 \
  -e MINIO_ROOT_USER=minioadmin \
  -e MINIO_ROOT_PASSWORD=minioadmin \
  minio/minio server /data --console-address ":9090" --address ":9000"
```
## 5. sshwifty
```shell
docker run --detach --restart always --publish 8182:8182 --name sshwifty niruix/sshwifty:latest
```
## 6.heimdall
```shell
docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -p 8001:80 \
  -p 8002:443 \
  -v /path/to/config:/config \
  --restart unless-stopped \
  linuxserver/heimdall
```
