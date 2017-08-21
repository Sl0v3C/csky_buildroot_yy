# csky_buildroot_yy
Forked from [c-sky/buildroot](https://github.com/c-sky/buildroot) and add sth. to make csky gx6605s more fun.  
The platform for this buildroot is  ```Nationalchip GX6605S```, we want to make this tiny & cheap board becomes a litte python learning board or code reading tool with vim.  
Maybe more than those.  
The csky gx6605s introduction can visit [C-SKY Linux Arch介绍](https://c-sky.github.io/).

## Updates
1. Add ctags   
2. Modify the default PS1 like "USER@TIMEPATH:[#|$]"  
3. Set the ptyhon version to 3.6 as the default version  
4. Modify the welcome info and hostname  
5. Enable some apps & libs  
6. Fix p7zip BB  
7. Add csky user & passwd  
8. Change the owner of the home path to csky  
9. Mount the /dev/sda3 as the /home/csky  
10. Move all the .vim* & wifi_work.sh files into /tmp  
11. Copy .vim* & wifi_work.sh files to /home/csky  
12. Modify the .vimrc to set some configs
