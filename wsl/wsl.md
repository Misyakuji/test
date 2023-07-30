# 开启WSL

（1）打开 **虚拟机平台功能**：

```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

（2）打开 **适用于Linux的Windows子系统** 功能：

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

### 1.2 更新Linux内核

下载最新安装包：

- [适用于x64计算机的 WSL2 Linux内核更新包](https://link.zhihu.com/?target=https%3A//wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)。

### 1.3 设置WSL2为默认版本

以管理员方式运行PowerShell运行命令，输入命令。

```
wsl --set-default-version 2
```

## 安装发行版Linux

 微软商店直接安装

[【WSL】WSL折腾之旅（2）安装ZSH和Docker - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/355493751)

# WSL2配置

###  列出WSL子系统

```
wslconfig /list
wslconfig /l
wsl --list
wsl -l -v
```

### 关闭Debian子系统

```
wsl --terminate debian
wsl -t debian
```

### 关闭WSL

```
wsl --shutdown
```

### 启动WSL

```
wsl
```

### 注销指定的子系统

```
wslconfig /u Debian
```

### 切换登录默认用户

```powershell
C:\Users\28100\AppData\Local\Microsoft\WindowsApps\debian.exe config --default-user root
```





# 发行版配置



### wsl sudo 免密码

1、新建 sudoer 配置文件

```cobol
sudo vim /etc/sudoers.d/<用户名>
```

2、在上面的文件里添加 sudo 免密配置

```properties
<用户名> ALL=(ALL) NOPASSWD:ALL
```



#### debian换源

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

### 在 Debian 上安装MySQL

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

### Ubuntu安装配置mysql

```sql
apt install mysql-server

mysql_secure_installation
# 命令查看MySQL数据库自动设置的随机账户与密码
cat /etc/mysql/debian.cnf
# 使用这组账户与密码进行MySQL登录
mysql -u user -p pass
use mysql;
update user set authentication_string='' where user='root';

# 查看所有用户及其权限
SELECT user,host FROM mysql.user;

# 修改MySQL用户密码
alter user 'root'@'localhost' identified with mysql_native_password by 'password';
# 刷新权限
flush privileges;
# 退出mysql命令行
exit
# 重启mysql服务
systemctl restart mysql
service mysql restart

# 创建用户
CREATE USER 'username'@'host' IDENTIFIED BY 'password';

# 修改host
update user set host = '%' where user = 'root';

RENAME USER 'root'@'localhost' TO 'root'@'%';

# 赋予用户权限
GRANT privileges ON databasename.tablename TO 'username'@'host'；
# 例(在table1库中的user 授权miko用户):
GRANT SELECT,INSERT ON table1.user TO 'miko'@'%';
GRANT ALL ON *.* TO 'username'@'host';
grant all privileges on *.* to 'username'@'host';

# 撤销用户权限命令:
REVOKE privilege ON databasename.tablename FROM 'username'@'host';

# 权限种类privileges
# select,insert,update,delete,create,drop,index,alter,grant,references,reload,shutdown,process,file

# 通过mysqladmin修改密码
mysqladmin -u username -h hostname -p password "newpwd"
# Enter password: oldpwd

# 删除用户命令:
DROP USER 'username'@'host';

## linux修改配置文件实现远程连接（寻找bind-address所在的文件位置）
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
## 默认情况下，为127.0.0.1
## bind-address = 0.0.0.0
```

#### 

#### zsh-kali theme

```shell
local current_dir='%{$fg_bold[red]%}[%{$reset_color%}%~% %{$fg_bold[red]%}]%{$reset_color%}'
local git_branch='$()%{$reset_color%}'


PROMPT="
%(?,%{$fg[blue]%}┌──╼%{$fg_bold[blue]%}(%{$fg_bold[red]%}%n%{$fg_bold[red]%}㉿%{$fg_bold[red]%}Debian%{$fg_bold[blue]%})%{$fg_bold[white]%}-%{$fg_bold[blue]%}[%{$fg_bold[green]%}%(5~|%-1~/…/%2~|%4~)%{$fg_bold[blue]%}]%{$reset_color%} ${git_branch}
%{$fg[blue]%}└─╼%{$fg_bold[white]%} ❯%{$fg_bold[blue]%}❯%{$fg_bold[cyan]%}❯%{$reset_color%} ,
%{$fg[blue]%}┌─╼%{$fg_bold[red]%}[%{$fg_bold[green]%}%(5~|%-1~/…/%2~|%4~)%{$fg_bold[blue]%}]%{$reset_color%}
%{$fg[blue]%}└╼%{$fg_bold[white]%} ❯%{$fg_bold[blue]%}❯%{$fg_bold[cyan]%}❯%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
```





### Git配置

```shell
# windows下防止克隆文件时自动转换换行符
git config --global core.autocrlf input

# git记住用户名密码
git config --global credential.helper store
```



### 配置代理服务-v2ray

```shell
# 一键安装脚本
https://github.com/233boy/v2ray

su -

bash <(curl -s -L https://git.io/v2ray.sh)
# 或者
bash <(wget -qO- -o- https://git.io/v2ray.sh)
# 下载clash连接的yaml模板
http://v2xtls.org/clash_template2.yaml
```

```shell

```





















