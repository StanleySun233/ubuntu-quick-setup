apt-get install docker-ce docker-ce-cli containerd.io -y

sudo usermod -aG docker $USER

systemctl start docker

apt-get -y install apt-transport-https ca-certificates curl software-properties-common

service docker restart

sudo docker version

sudo apt install docker-compose -y
