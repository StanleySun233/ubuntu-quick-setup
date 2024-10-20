# 提示用户输入域名
read -p "请输入您的域名: " DOMAIN
# 提示用户输入电子邮件地址
read -p "请输入您的电子邮件地址: " EMAIL
# 安装 Certbot 和 Nginx 插件
sudo apt install certbot python3-certbot-nginx -y

# 生成 SSL 证书并配置 Nginx
sudo certbot --nginx -d $DOMAIN -d www.$DOMAIN --non-interactive --agree-tos --email $EMAIL

# 测试自动续期
sudo certbot renew --dry-run

# 自动续期由 Certbot 的 cronjob 处理，无需额外操作
echo "SSL 证书已成功配置，并已设置为自动续期。"
