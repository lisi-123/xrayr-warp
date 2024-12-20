#!/bin/bash

# 更新软件包列表
apt-get update

# 安装必需的软件包
apt install sudo -y
sudo apt install curl -y
sudo apt-get install ufw -y
sudo apt install nano -y

# 安装xrayr
wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh v0.9.4

# 替换配置文件
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/config.yml -P /etc/XrayR/
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/custom_outbound.json -P /etc/XrayR/
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/dns.json -P /etc/XrayR/
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/route.json -P /etc/XrayR/


echo "已自动配置warp解锁，在config.yml搭建节点后生效"
