#!/bin/bash

# 2. 生成 Jupyter 配置文件
JUPYTER_CONFIG_DIR="$HOME/.jupyter"
mkdir -p "$JUPYTER_CONFIG_DIR"

if [ ! -f "$JUPYTER_CONFIG_DIR/jupyter_lab_config.py" ]; then
    echo "生成 Jupyter Lab 配置..."
    jupyter lab --generate-config
fi

# 3. 设置 Jupyter Lab 允许远程访问
JUPYTER_CONFIG="$JUPYTER_CONFIG_DIR/jupyter_lab_config.py"

echo "配置 Jupyter Lab 允许远程访问..."
cat <<EOT >> "$JUPYTER_CONFIG"
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 2333
c.ServerApp.open_browser = False
c.ServerApp.allow_remote_access = True
EOT

# 4. 创建 systemd 服务文件
SERVICE_FILE="/etc/systemd/system/jupyterlab.service"

echo "创建 systemd 服务文件..."
sudo bash -c "cat > $SERVICE_FILE" <<EOT
[Unit]
Description=Jupyter Lab
After=network.target

[Service]
Type=simple
User=$USER
Group=$USER
ExecStart=$(which jupyter) lab --config=$JUPYTER_CONFIG
WorkingDirectory=$HOME
Restart=always

[Install]
WantedBy=multi-user.target
EOT

# 5. 重新加载 systemd，启用并启动 Jupyter Lab 服务
echo "启动 Jupyter Lab 服务..."
sudo systemctl daemon-reload
sudo systemctl enable jupyterlab
sudo systemctl start jupyterlab

echo "Jupyter Lab 服务已成功安装并启动！"
echo "访问地址: http://$(hostname -I | awk '{print $1}'):2333"
