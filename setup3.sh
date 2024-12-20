#!/bin/bash

# 确保脚本以 root 用户运行
if [ "$(id -u)" -ne 0 ]; then
  echo "请以 root 用户或使用 sudo 运行此脚本"
  exit 1
fi

# 更新软件包列表
apt-get update

# 安装必需的软件包
apt-get install sudo curl ufw nano -y

# 安装 xrayr
wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh v0.9.4

# 替换配置文件
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/config.yml -P /etc/XrayR/
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/custom_outbound.json -P /etc/XrayR/
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/dns.json -P /etc/XrayR/
wget -N https://raw.githubusercontent.com/lisi-123/xrayr-warp/main/route.json -P /etc/XrayR/

# 安装 warp 并搭建 socks 代理
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh <<< $'2\n13\n40000\n1\n'

echo "已自动配置 warp 解锁，在 config.yml 搭建节点后生效"
