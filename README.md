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
&nbsp;&nbsp;&nbsp;&nbsp;If no error, it will generate ```usb.img``` in the ```output/target``` path.  

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


## Updates
* Add ctags   
* Modify the default PS1 like "USER@TIMEPATH:[#|$]"  
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
* Run remove.sh to remove above command from /etc/inittab to avoid exec them every booting time
