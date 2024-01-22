#### 换源

```properties
# 中科大镜像站
deb http://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
deb http://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
deb http://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free
deb http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free

# 阿里云源
deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb http://mirrors.aliyun.com/debian-security buster/updates main
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib

# 腾讯云镜像站
deb http://mirrors.tencent.com/debian/ bullseye main non-free contrib
deb http://mirrors.tencent.com/debian-security/ bullseye-security main
deb http://mirrors.tencent.com/debian/ bullseye-updates main non-free contrib
deb http://mirrors.tencent.com/debian/ bullseye-backports main non-free contrib
```

#### 安装常用软件

```shell
sudo apt install vim wget curl git gcc g++ systemctl net-tools 
sudo apt install neofetch openjdk-17-jdk maven nodejs npm ssh nmap redis mariadb
```

#### 修改分辨率

```shell
# 列出可用的分辨率
xrandr -q
# 修改分辨率
xrandr --output <显示器名称> --mode <分辨率>

# 例如：
xrandr --output HDMI-1 --mode 1920x1080_60.00

# 添加分辨率
# 使用 cvt 命令生成新的模式行。例如，要创建一个 1920x1080 的分辨率：
cvt 1920 1080
# 这将输出一个类似于以下内容的模式行：
# 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
# Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync

# 复制输出中的整个 Modeline 行（不包括 # 号），然后使用 xrandr 命令添加新的模式：
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync

# 然后，使用 xrandr 命令将新模式添加到您的显示器上：

xrandr --addmode <显示器名称> 1920x1080_60.00

# 如果您的显示器是主显示器，则可以使用 --output 参数指定它的名称。例如，如果您的显示器名称为 HDMI-1，则可以使用以下命令将新分辨率添加到显示器上：

xrandr --output HDMI-1 --mode 1920x1080_60.00
请注意，这些命令可能需要根据您的系统和硬件进行调整。W
```

#### nmap扫描

```shell
# nmap扫描所有端口
nmap -p- 127.0.0.1
# 扫描指定端口是否开启
nmap -p 6379 127.0.0.1
```

chatGpt-docker

https://www.bilibili.com/video/BV1po4y1t7CY/

```shell
docker run -d -p 3000:3000 \
    -e OPENAI_API_KEY="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" \
    -e PROXY_URL="http:192.168.68.1:7890" \
    --restart=always \
    --name chatgpt-next-web \
    yidadaa/chatgpt-next-web
```

#### 修改用户目录的中文文件夹为英文

```shell
# xdg-user-dirs-gtk-update 是一个用于更新用户目录的工具，通常情况下已经预装在大多数 Linux 发行版中。如果您使用的是 Debian、Ubuntu、Fedora、openSUSE 或 Arch Linux 等主流发行版，那么 xdg-user-dirs-gtk-update 应该已经预装在您的系统中了，无需手动安装。如果您使用的是其他发行版或者自己编译的系统，则可能需要手动安装该工具
sudo apt install xdg-user-dirs-gtk



export LANG=en_US
xdg-user-dirs-gtk-update
# 跳出对话框询问是否将目录转化为英文路径,同意并关闭

export LANG=zh_CN.UTF-8
```

### 在 Debian 上安装 MySQL

```shell
# 将 MySQL APT 存储库添加到系统，先到MySQL存储库下载页面，并使用以下wget命令下载最新的发行包：
wget http://repo.mysql.com/mysql-apt-config_0.8.25-1_all.deb

# 下载完成后，通过以下命令安装:
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
# 你将会看到MySQL配置安装菜单，选择你要安装的版本。
# 默认选择了 MySQL 8.0，如果要安装 MySQL 5.7，请选择 MySQL Server ＆ Cluster（当前选择：mysql-8.0），然后选择对应的 MySQL 版本。
# 通过按 Tab 键选择 “确定”，然后按 Enter 键

# 更新软件包，并安装MySQL
sudo apt update
sudo apt install mysql-server
```


Node Version Manager (nvm) 笔记

下载
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

source ~/.bashrc

nvm --version
安装最新版本的Node.js
使用 nvm install latest 命令可以安装最新版本的Node.js。

安装指定版本的Node.js
使用 nvm install node 命令后，需要输入要安装的版本号，例如 nvm install node 20.11.0。

查看当前已安装的Node.js版本
使用 nvm list 命令可以查看当前已安装的Node.js版本，可以缩写为 nvm ls。

切换到指定版本的Node.js
使用 nvm use 命令后，需要输入要切换到的版本号，例如 nvm use 20.11.0。

删除指定版本的Node.js
使用 nvm uninstall 命令后，需要输入要删除的版本号，例如 nvm uninstall 14.17.0。

设置Node镜像地址
使用 nvm node_mirror [url] 命令可以设置Node镜像地址
nvm node_mirror https://npmmirror.com/mirrors/node/

设置npm镜像地址
使用 nvm npm_mirror [url] 命令可以设置npm镜像地址
nvm npm_mirror https://npmmirror.com/mirrors/npm/


npm查看当前源
npm config get registry

npm更换国内源镜像
npm config set registry https://registry.npmmirror.com/

npm 官方原始镜像网址是：https://registry.npmjs.org/
淘宝 NPM 镜像：https://registry.npmmirror.com
阿里云 NPM 镜像：https://npm.aliyun.com
腾讯云 NPM 镜像：https://mirrors.cloud.tencent.com/npm/
华为云 NPM 镜像：https://mirrors.huaweicloud.com/repository/npm/
网易 NPM 镜像：https://mirrors.163.com/npm/
中科院大学开源镜像站：http://mirrors.ustc.edu.cn/


JAVA环境安装

apt install openjdk-17-jdk
apt install openjdk-21-jdk


查看安装jdk的版本
update-java-alternatives --list
jdk版本更换
update-java-alternatives --set /usr/lib/jvm/java-1.17.0-openjdk-arm64
