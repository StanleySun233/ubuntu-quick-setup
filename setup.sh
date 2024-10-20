# update ubuntu kernel
sudo apt update
sudo apt upgrade -y

# add docker key
read -p "是否添加阿里云镜像，输入y或者回车表示添加，其他表示不添加..." input

if [[ "$input" == "y" || -z "$input" ]]; then
    echo "执行命令..."
    curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
else
    echo "不添加阿里云镜像。"
fi

apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
systemctl start docker
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
service docker restart
sudo docker version
sudo apt install docker-compose -y
