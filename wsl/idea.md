### 官方环境搭建参照
https://learn.microsoft.com/zh-cn/windows/wsl/setup/environment



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

### 设置默认发行版
```shell
wsl --set-default debian
```














