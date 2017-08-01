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
* 1.展示性良好，动态模拟排序过程
* 2.高度封装，一句调用排序方法
* 3.算法设计合理，教科书式


## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 选择排序实现
```
- (void)rs_selectionSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    if (self.count == 0) {
        return;
    }
    for (NSInteger i = 0; i < self.count - 1; i ++) {
        for (NSInteger j = i + 1; j < self.count; j ++) {
            if (comparator(self[i], self[j]) == NSOrderedDescending) {
                [self rs_exchangeWithIndexA:i indexB:j didExchange:exchangeCallback];
            }
        }
    }
}
```
### 冒泡排序实现
```
- (void)rs_bubbleSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    if (self.count == 0) {
        return;
    }
    for (NSInteger i = self.count - 1; i > 0; i --) {
        for (NSInteger j = 0; j < i; j ++) {
            if (comparator(self[j], self[j + 1]) == NSOrderedDescending) {
                [self rs_exchangeWithIndexA:j indexB:j + 1 didExchange:exchangeCallback];
            }
        }
    }
}
```
### 插入排序实现
```
#pragma mark - 插入排序
- (void)rs_insertionSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    for (NSInteger i = 1; i < self.count; i ++) {
        for (NSInteger j = i; j > 0 && comparator(self[j], self[j - 1]) == NSOrderedAscending; j --) {
            [self rs_exchangeWithIndexA:j indexB:j - 1 didExchange:exchangeCallback];
        }
    }
}
```
### 快速排序实现
```
- (void)rs_quickSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    if (self.count == 0) {
        return;
    }
    [self rs_quickSortWithLowIndex:0 highIndex:self.count - 1 usingComparator:comparator didExchange:exchangeCallback];
}
```
### 堆排序实现
```
- (void)rs_heapSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    // 排序过程中不使用第0位
    [self insertObject:[NSNull null] atIndex:0];
    
    // 构造大顶堆
    // 遍历所有非终结点，把以它们为根结点的子树调整成大顶堆
    // 最后一个非终结点位置在本队列长度的一半处
    for (NSInteger index = self.count / 2; index > 0; index --) {
        // 根结点下沉到合适位置
        [self sinkIndex:index bottomIndex:self.count - 1 usingComparator:comparator didExchange:exchangeCallback];
    }
    
    // 完全排序
    // 从整棵二叉树开始，逐渐剪枝
    for (NSInteger index = self.count - 1; index > 1; index --) {
        // 每次把根结点放在列尾，下一次循环时将会剪掉
        [self rs_exchangeWithIndexA:1 indexB:index didExchange:exchangeCallback];
        // 下沉根结点，重新调整为大顶堆
        [self sinkIndex:1 bottomIndex:index - 1 usingComparator:comparator didExchange:exchangeCallback];
    }
    
    // 排序完成后删除占位元素
    [self removeObjectAtIndex:0];
}
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSSortAlgorithmDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
