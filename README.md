# RSSortAlgorithmDemo
iOS 程序猿也是要搞搞算法的，这里列举了5种你可能用到、用不到的排序，仅供参考。

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-791K-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

之前又看到过一篇文章《搞 iOS 学算法有意义吗？》，讨论iOS开发人员需不需要研究算法，知识这种东西无论你研究与否，它就在那。

| 名称 |1.列表页 |2.选择排序页 |3.冒泡排序页 |4.插入排序页 |5.快速排序页 |6.堆排序页 |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/80827278.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/94568013.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/88059359.jpg) |![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/60153806.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/91402760.jpg) |![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/96664830.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 选择排序展示 | 冒泡排序展示 | 插入排序展示 | 快速排序展示 | 堆排序展示 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.同时支持本地图片/Gif及网络图片/Gif
* 4.自带图片下载与缓存
* 5.具备较高自定义性

## Installation 安装
### 1.手动安装:
`下载Demo后,将功能文件夹拖入到项目中, 导入头文件后开始使用。`
### 2.CocoaPods安装:
修改“Podfile”文件
```
pod 'AutoAlignButtonTools',:git => 'https://github.com/ReverseScale/AutoAlignButtonToolsCocoapodsDemo.git'
```
控制台执行 Pods 安装命令 （ 简化安装：pod install --no-repo-update ）
```
pod install
```
> 如果 pod search 发现不是最新版本，在终端执行pod setup命令更新本地spec镜像缓存，重新搜索就OK了

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 引入头文件
```
#import "OrderDic.h"
```
### 第二步 简单调用
```
[OrderDic order:dic]
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSSortAlgorithmDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
