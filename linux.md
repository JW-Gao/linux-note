# 2023/1/1

- awesome 的**字体**问题

    - *step 1* , check that if **fontconfig** package installed, if not, then install it
    - *step 2* , check that if **ttf-dejavu** package installed, if not , then install it
    - *step 3* , runs **sudo fc-cache**

- touchpad can not **tab** 的问题

    - 原因：未修改**xorg**的配置文件

    - 方法：**vim /etc/X11/xorg.conf.d/40-libinput.conf**

    - ```conf
        Section "InputClass"
                Identifier "libinput touchpad catchall"
                MatchIsTouchpad "on"
                MatchDevicePath "/dev/input/event*"
                Option "Tapping" "on"
                Option "ScrollMethod" "twofinger"
                Option "HorizontalScrolling" "on"
                Option "DisableWhileTyping" "on"
                Driver "libinput"
        EndSection
        ```
    
- using ordinary user

- **xf86OpenConsole: cannot open virtual console 1 (permission denied)**

    - *problem*:  If your logged in as a different user and su to the user starting X. You will get an permission denied as tty1 is occupied by the original user. In short reboot or completely log out the current user then issue "startx".  **即退出，以另一个用户重新登录**

- **xmodmap does not work**

    - *remember that lines following a command using exec would be ignored*



# 2023/1/2

- **man-db & man-pages**
    - *man-db and man-pages are different* 
    - Solved: *sudo pacman -S man*  and *sudo pacman -S man-pages*
- **proxy configuration**
    - https://blog.linioi.com/posts/clash-on-arch/
- **更改默认的shell**
    - chsh -s /path/to/your/shell ***user***



# 2023/1/3

- Todo List
    - systemd原理
    - lua学习
    - arch linux美化
    - csapp
    - tty and pts difference
- **公钥加密算法**
    - RSA

