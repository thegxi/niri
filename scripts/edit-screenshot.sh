#!/usr/bin/env bash

# 声明一个变量，值是根据wl-paste输出的当前剪贴板的数据计算的哈希值
CLIPNOW=$(wl-paste | sha1sum)

# 启动niri截图
niri msg action screenshot

# 循环，不断的打印当前剪贴板数据计算哈希值，和之前的哈希值进行比较
while [ "$(wl-paste | sha1sum )" = "$CLIPNOW" ]; do
	sleep .05
done

# 将新的剪贴板内容数据传给satty打开
wl-paste | satty -f -
