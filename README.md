# ubuntu-quick-setup

```shell
git clone https://github.com/StanleySun233/ubuntu-quick-setup.git
cd ubuntu-quick-setup
sh setup.bash
```
install miniconda
```shell
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all

pip install jupyter notebook
nohup jupyter lab --ip=0.0.0.0 --port=2333 --no-browser > ~/.jupyter.log 2>&1 &
```

## Current Usage:
1. apt setup
2. docker setup
  2.1. add some docker containers

## 1. mysql 5.7
### for shell
```shell
docker run -p 3306:3306 --name mysql \
  --restart=always \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -d mysql:5.7
```
### for cmd
```cmd
docker run -p 3306:3306 --name mysql -v /mydata/mysql/log:/var/log/mysql -v /mydata/mysql/data:/var/lib/mysql --restart=always -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
```

## 2. portainer
### for shell
```shell
docker run -d -p 8005:9000 \
  --restart=always \
  --name portainer \
  -v /var/run/docker.sock:/var/run/docker.sock \
   portainer/portainer-ce
```
### for cmd
```cmd
docker run -d -p 8005:9000 --restart=always --name portainer -v /var/run/docker.sock:/var/run/docker.sock -v /home/sjsun/docker/portainer/data:/data portainer/portainer-ce
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
  --restart always \
  linuxserver/heimdall
```

## 7. neo4j
```shell
docker run -d -p 7474:7474 -p 7687:7687 --name neo4j \
-e "NEO4J_AUTH=neo4j/123456" \
neo4j:3.5.22-community
```

## 8. labelstudio
```shell
docker run -itd -u root -p 8080:8080 -e DATA_UPLOAD_MAX_NUMBER_FILES=10000 --name labstu heartexlabs/label-studio:latest
```

## 9. minecraft-server
```shell
docker run -d -it -p 6666:25565 --name mcsv -e TYPE=FORGE -e VERSION=1.20.1 -e EULA=TRUE -m 8g -v /data:/data -e ONLINE_MODE=FALSE -e INIT_MEMORY=2G -e MAX_MEMORY=8G itzg/minecraft-server
```

## 10. filebrowser
```shell
docker run -d \
  --name filebrowser \
  -v /data:/srv \
  -p 8080:80 \
  --restart always \
  filebrowser/filebrowser
```
## 11. postgresql
### for shell
```shell
docker run -d  \
  --name postgres \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_USER=root \
  postgres
```
### for cmd
```cmd
docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=password -e POSTGRES_USER=root postgres
```

## 12. registry
```shell
docker run -d --name registry-mirror \
  -p 8004:5000 \
  -v /opt/docker-registry:/var/lib/registry \
  -e REGISTRY_PROXY_REMOTEURL="https://registry-1.docker.io" \
  --restart=always \
  registry:2
```

## 13. nginx-proxy-manager
```shell
docker run -d \
  --name=nginx-proxy-manager \
  -p 80:80 \
  -p 81:81 \
  -p 443:443 \
  -v /data:/data \
  -v /letsencrypt:/etc/letsencrypt \
  --restart=always \
  jc21/nginx-proxy-manager
```

## 14. Windows
```shell
docker run -d --name win10 -p 8006:8006 -p 8007:3389 --device=/dev/kvm --device=/dev/net/tun -e DISK_SIZE=256G -e RAM_SIZE=16G -e CPU_CORES=4 -e USERNAME=ACC -e PASSWORD=PWD -e LANGUAGE=Chinese --cap-add NET_ADMIN -v ${PWD:-.}/windows:/storage --memory 2g --memory-swap 14g  --stop-timeout 120 dockurr/windows
```
