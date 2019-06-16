```shell
linux diary 
```

> contents

[TOC]



## 1.文件处理命令

```
ls -a -l -d -h
```

all long directory  human inode    -d 查看目录的详细信息

`cd`     `pwd`

`cp` 原 目标   -r 意思是目录 -p复制文件信息

`rm -rf` 文件或目标  -r 目录 -f 强制删除

`mkdir -p`  新建目录 -p递归创建

`touch` 文件名   新建文件

`mv` 改名，剪切 -b 覆盖前backup -d强制覆盖 -u update



## 2.文本查看命令

- ### `less` 查看长文本

  `f` 向前 front

  `b`向后 back

  `/` 后输入 查找  按n  下一个查找内容

  左右箭头，pagedown up都能用

- ### `cat` -n 显示文件 -n行号

  tac 倒着显示

- head -n  7

  看前7行，不加-n是前10行

- tail -n 7   

  看后7行，不加-n后10行

  -f 动态显示文件末尾，用于查看变化的日志

- ### `ln`链接命令

  `ln -s 源  目标`  建立软链接 快捷方式

  *`ln` 源 目标 硬链接  等于`cp -p` 加同步更新，硬链接的 `inode`与原文件相同，软链接不同*

- echo “hello” >> 文件目录文件名

  写 到文件中

## 3.权限更改命令

```
chmod [{ugoa}{＋－＝}{rwx}] [文件或目录] -R 递归修改
```

改变文件或目录的权限

``chmod u＋x， g－r, o－r  文件或目录`

u表示所有者，g表示所属组，o表示其它人

``chmod g＝rwx`

r表示为4，w表示为2，x表示为1

rwxrw-r--

7 6 4

<span style="color:red">`chmod 640 文件名目录名`</span>

把权限改为 rw- r-- ---

`adduser username` `passwd username` 

**对一个文件有写权限，可以修改文件的内容vim**

**`directory rwx 的意义`**

1. 对一个目录的读 可以ls
2. 如果对一个目录有写权限 ，可以删除，创建 这个目录下的文件或目录touch，mkdir，rmdir，rm
3. 对一个目录的执行 可以 cd这个目录



**文件的创建者和root都可以改变一个文件的权限**

- 改变所有者

  `chown 用户 文件或目录`

  把所有者改为指定用户

  *只有root能改变文件所有者*



- 改变所属组，

  `chgrp 组名  文件或目录名` 

  `groupadd 组名  添加组`

`umask -S` 显示新建文件的缺省权限

## 4.文件搜索

### `find [搜索范围] [匹配条件]`

`find / -name *haha*`

*匹配任意字符



| find [option]    | description                                                  |
| ---------------- | ------------------------------------------------------------ |
| -name            | 名称                                                         |
| -iname           | 不区分大小写                                                 |
| -size      - 100 | 文件大小  -100后面的属性单位是0.5 `kB`  +是大于 -是小于 =是等于 |
| -user            | 按所有者查找                                                 |
| -amin            | 访问时间 access                                              |
| -cmin            | change  修改文件属性                                         |
| -mmin            | modify 修改文件内容                                          |
| -a               | and                                                          |
| -o               | or                                                           |
| -type            | 文件类型 f是file d是directory                                |

**对find找到的结果直接进行操作**

`-exec` `-ok  -ok`会每个进行确认

`find /etc -name inittab -exec ls -l {} \;`

*在/etc 目录下查找 name为initab 的文件或目录，执行 ls -l操作*

*{} \; 是固定格式*

*-inum 根据i结点查找*

### 其它的搜索命令

#### locate 文件名

根据文件资料库快速查找

但新文件，不会那么快收录，所以

`updatedb` 来更新文件资料库

-i 不区分大小写



#### which 来查找命令，显示别名

- 所有用户都能使用的命令目录

`/bin         /usr/bin`

- root用户使用的命令目录

`/sbin      /usr/sbin`

*`which cd` 显示目录与帮助文档*

`whereis`  只显示目录

#### grep -i -v [查找的内容]  [文件]

-i 不区分大小写  -v 排除有查找内容所在的行

#### 帮助命令 `man` `info` `help `  --help

`man [命令或者配置文件]`

`man ls`

`man services      配置文件的帮助信息`



<span style="color:red">`whatis` </span>简短的命令解释



`命令--help   比如 ls --help`



`info` 相当于`man`

`help` 查看`shell`内置的命令的帮助  `pwd cd umask`

也可以查看 `if` `while` 等信息



## 5.用户管理

`useradd` username   添加用户

`passwd` username   更改用户密码

*普通用户只可以更改自己的密码，不能过于简单*

`who` 查看系统中有哪些用户

`w` 可以查看更详细的内容，比如，系统启动时间，几个用户，15，5，1分钟内的负载情况

用户名，终端，终端ip 登录时间，空闲时间，cpu使用时间 正在执行的操作



## 6.压缩解压命令

`gzip` [文件] 压缩

`gunzip` 或者`gzip -d` [文件]

`gzip` *只能压缩文件，不能压缩目录，不保留源文件*

**压缩**

`tar` [-cvfz] [压缩后的文件名] [目录]  *比如 要打包test目录为test.tar        `tar -cvf test.tar tes`t*

-c 打包

-v 显示详细信息

-f 指定文件名

-z 打包时同时压缩  比如 `tar -zcf test.tar.gz test`

功能：打包目录

压缩后的文件格式 .tar.gz

**解压**

`tar [-zxvf] test.tar.gz`

-x 解包

-v 显示详细信息

-f 指定文件名

-z 解压缩
