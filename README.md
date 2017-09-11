# csky_buildroot_yy
Forked from [c-sky/buildroot](https://github.com/c-sky/buildroot) and add sth. to make csky gx6605s more fun.  
The platform for this buildroot is  ```Nationalchip GX6605S```, we want to make this tiny & cheap board becomes a litte python learning board or code reading tool with vim.  
Maybe more than those.  
The csky gx6605s introduction can visit [C-SKY Linux Arch介绍](https://c-sky.github.io/).

## Requirements
* USB disk at least 2GB, maybe 4GB or 8GB better.
* Install env: ```sudo apt-get install  build-essential git lzip ncurses-dev minicom texinfo```  

## Compile & Configuration
* run ```make csky_gx6605s_defconfig``` or ```make csky_gx6605s_fbcon_defconfig```.   
<table>
    <tr>
        <td align="center">Config</td>
		<td align="center">Usage</td>
    </tr>
	<tr>
        <td align="left">csky_gx6605s_defconfig</td>
		<td align="center">use uart</td>
    </tr>
	<tr>
        <td align="left">csky_gx6605s_fbcon_defconfig</td>
		<td align="center">use framebuffer console</td>
    </tr>
</table>  
&nbsp;&nbsp;&nbsp;&nbsp;If no error, it will generate usb.img in the output/images path.  

*  Plugin USB disk, If the USB disk recognized as the /dev/sdc, then you should run:
   <pre>
   $ sudo umount /dev/sdc*     （× means the number of your partitions of the USB disk）
   $ sudo dd if=output/images/usb.img of=/dev/sdb bs=8192 (4G:4096, 8G:8192, 16G:16384)
   $ sync
   Then you should unplug the USB disk and re-plugin  it, then run commands:
   $ sudo fdisk /dev/sdc
     m to show the menu
     p to show the partition table
     n to add a new partition, keep the default setting just press Enter
     w to write table to disk and exit
   </pre>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Or you can just run the ```disk``` tool to add a new partition of your USB disk, which is /dev/sdc3.  

* Remove your USB disk and plug it into your csky board, then you can hava a fun.

*****
  **Notice： Please make sure the /dev/sd?(maybe sdb, sdc or other)，to avoid to format your harddrive.** 
*****

## Updates
* Add ctags   
* Modify the default PS1 like ```USER@TIMEPATH:[#|$]``` 
* Set the ptyhon version to 3.6 as the default version  
* Modify the welcome info and hostname  
* Enable some apps & libs  
* Fix p7zip BB  
* Add csky user & passwd  
* Change the owner of the home path to csky  
* Mount the /dev/sda3 as the /home/csky  
* Move all the .vim* & wifi_work.sh files into /tmp  
* Copy .vim* & wifi_work.sh files to /home/csky  
* Modify the .vimrc to set some configs
* Move /tmp/.vim* & /tmp/wifi_work.sh to /temp/
* Copy those files to /home/csky when the 1st time booting
* Copy /temp/remove.sh to /usr/bin/removeINIT & chmod 755
* Add csky in /etc/sudoers, then it can use sudo command to grant permission
* Run ```remove.sh``` to remove above command from /etc/inittab to avoid exec them every booting time
* Add ```cacert.pem``` which downloaded from [curl](https://curl.haxx.se/docs/caextract.html) to fix HTTPS cannot access issue  
* Add ```get-pip.py``` which downloaded from [pypa](https://bootstrap.pypa.io/get-pip.py) to install pip and wheel 
* Remove Minecaft & future-0.16.0 & pyglet-1.3.0rc1-py2.py3-none-any.whl files to decrease the delay during booting
* Exec Xorg & in rcS during startup
* Exec matchbox-window-manager & and xterm & when login in
* Add eth_work.sh to enable ethernet connect work
* Add .Xresources & xinitrc & xserverrc & xorg.conf files for xterm/xinit/Xorg
* Add CONFIG_SWAP=y in linux-ext-csky-arch.mk
* Add swapfile.sh for create 128M swap file & mkswap then swapon it to fix "out of memory" issue
* Copy X window reference files when enable "BR2_PACKAGE_XORG7", not exec Xorg & xterm during booting
* User can take ~/swapfile.sh as a reference, create 128M SWAP may be better
* csky user exec sudo no need enter password

# 中文说明(README in Chinese version)
本源码基于[c-sky/buildroot](https://github.com/c-sky/buildroot)，同时增加了一些东西，尝试将csky gx6605s配置成一个Python学习开发的环境或者vim的编辑和阅读代码的工具等等使其更加丰富好玩。  
因为csky gx6605s拥有一个```HDMI```接口，可以直接连接一个便携式的显示器作为输出，通过USB HUB连接键盘及U盘，无线网卡等就可以移动开发，最主要的是csky gx6605s只需要RMB 39.00元，低成本却能够对学习Linux，rootfs，buildroot有一定的帮助，算得上是低成本学习的一个方案。  
csky gx6605s平台是国芯推出的一款开发板，我们希望能够将这个小巧而便宜的开发板打造成一个Python学习开发环境或者代码阅读器。  
也许能够比上面提到的做得更多更好。  
可以通过访问[C-SKY Linux Arch介绍](https://c-sky.github.io/)了解更多关于csky gx6605s的信息。  

## 要求
* U盘容量至少2GB，最好是4GB或者8GB，太小的容量对开发是瓶颈，太大的容量分区格式化又较浪费时间。
* 编译环境： ```sudo apt-get install  build-essential git lzip ncurses-dev minicom texinfo```  

## 编译和配置
* 运行```make csky_gx6605s_defconfig```或者```make csky_gx6605s_fbcon_defconfig```.   
<table>
    <tr>
        <td align="center">config文件</td>
		<td align="center">用途</td>
    </tr>
	<tr>
        <td align="left">csky_gx6605s_defconfig</td>
		<td align="center">通过USB串口作为终端输出</td>
    </tr>
	<tr>
        <td align="left">csky_gx6605s_fbcon_defconfig</td>
		<td align="center">通过HDMI作为终端输出</td>
    </tr>
</table>  
&nbsp;&nbsp;&nbsp;&nbsp;如果编译成功，会在output/images目录生成usb.img。 

*  插入U盘，如果U盘被识别为```/dev/sdc```，则可以执行下面步骤：
   <pre>
   $ sudo umount /dev/sdc*     （*表示的是该U盘的分区数）
   $ sudo dd if=output/images/usb.img of=/dev/sdb bs=8192 (4G:4096, 8G:8192, 16G:16384)
   $ sync
    当sync返回的时候可以拔出U盘，然后再次插入该U盘，执行下面步骤：
   $ sudo fdisk /dev/sdc
     m 显示fdisk菜单
     p 显示当前U盘的所有分区表
     n 新增一个分区，直接按照默认不断回车即可
     w 写入分区表信息并退出
   </pre>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或者你可以通过运行```disk```工具来进行sda3的分区。  

* 安全移除U盘，然后在csky gx6605s上插入该U盘，之后就可以享受学习开发之旅啦！
*****
  **注意： 请确保插入的U盘所属的/dev/sd?，避免硬盘被格式化导致重要资料流失** 
*****


## 更新
* 添加ctags   
* 修改默认的PS1，是终端的显示如"USER@TIMEPATH:[#|$]"  
* 设置默认的python版本为3.6  
* 修改欢迎信息和主机名  
* 使能了一些应用程序和库  
* 使能p7zip同时修复编译错误  
* 添加csky用户及密码csky  
* 修改了/home/csky的所属者为csky  
* 挂载/dev/sda3到/home/csky，这样可以避免存储空间限制  
* 移动.vim*和wifi_work.sh等文件到/temp  
* 开机启动的时候会拷贝.vim*和wifi_work.sh等文件到/home/csky  
* 添加了一些配置到.vimrc
* 移动/temp/remove.sh到/usr/bin/removeINIT并且设置权限为755
* 添加csky用户到/etc/sudoers,这样csky用户就可以使用sudo来获取root权限
* 执行remove.sh来删除掉在/etc/inittab里用于执行上述工作的一些命令，避免这些命令重复执行
* 添加```cacert.pem```，通过[curl](https://curl.haxx.se/docs/caextract.html)下载的证书文件，用于解决HTTPS无法访问的问题。  
* 添加```get-pip.py```，通过[pypa](https://bootstrap.pypa.io/get-pip.py)下载的用于安装pip和wheel。
* 删除Minecaft，future-0.16.0和pyglet-1.3.0rc1-py2.py3-none-any.whl以减少开机延迟，通过创建swap文件解决安装pyglet等发生的out of memory问题。
* 在rcS里执行Xorg &，这个文件会在开机阶段执行，可以察看inittab
* 当用户登陆时会执行matchbox-window-manager &和xterm &，可以通过Ctrl + Alt + F2进入xterm
* 添加eth_work.sh脚本来开启有线上网
* 为xterm添加.Xresources, 为xinit添加xinitrc和xserverrc，为Xorg添加xorg.conf
* 在linux-ext-csky-arch.mk添加CONFIG_SWAP=y，这样在编译内核时会开启该功能
* 添加swapfile.sh脚本，该脚本可以创建128M大小的swap文件， 用于开启swap功能，来解决内核"out of memory"问题。
* 针对开启X11 CONFIG的时候才去拷贝X window相关文件，同时移除默认执行Xorg和xterm，用户自行手动开启
* 用户可以参考~/swapfile.sh来创建swap文件，推荐创建128M大小的SWAP
* csky用户sudo无需密码
