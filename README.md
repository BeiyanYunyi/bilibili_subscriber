# Bilibili Subscriber

> In memory of my 6-digit UID account which was permanently banned by bilibili at 2021-06-11  
> 谨以此纪念我在 2021 年 6 月 11 日被 B 站永久封禁的 6 位数 UID 大号

[bilibili-valkyrie](https://github.com/bilibili-valkyrie/bilibili-valkyrie) 的继承者。纯客户端实现，无需服务器，因此取消了多用户功能。

## 🏭 功能简介

该项目旨在提供一个第三方的关注 / 订阅功能，以在被封号的情况下对自己希望关注的用户进行关注 / 订阅。

以 Flutter 编写，原生跨平台（Windows / Linux / MacOS / Android / iOS / 网页），提供预构建的 Windows 和 Android 版本，其它平台请自行构建。需要部署在网页平台时，请自行搭建反向代理并修改代码中的 API 地址，以绕过浏览器的跨域限制。

## 📱 界面预览

![home](previews/home.png)

主页（查看视频更新）

![update](previews/update.png)

更新（更新所有关注的 UP 主）

![manage](previews/manage.png)

管理（管理关注的 UP 主）

![addUper](previews/addUper.png)

添加 UP 主

![settings](previews/settings.png)

设置（数据导入导出）
