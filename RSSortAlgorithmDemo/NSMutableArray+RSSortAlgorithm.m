//
//  NSMutableArray+RSSortAlgorithm.m
//  RSSortAlgorithmDemo
//
//  Created by WhatsXie on 2017/7/31.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "NSMutableArray+RSSortAlgorithm.h"

@implementation NSMutableArray (RSSortAlgorithm)
// 交换两个元素
- (void)rs_exchangeWithIndexA:(NSInteger)indexA indexB:(NSInteger)indexB didExchange:(RSSortExchangeCallback)exchangeCallback {
    id temp = self[indexA];
    self[indexA] = self[indexB];
    self[indexB] = temp;
    
    if (exchangeCallback) {
        exchangeCallback(temp, self[indexA]);
    }
}

#pragma mark - 选择排序
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

#pragma mark - 冒泡排序
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

#pragma mark - 插入排序
- (void)rs_insertionSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    for (NSInteger i = 1; i < self.count; i ++) {
        for (NSInteger j = i; j > 0 && comparator(self[j], self[j - 1]) == NSOrderedAscending; j --) {
            [self rs_exchangeWithIndexA:j indexB:j - 1 didExchange:exchangeCallback];
        }
    }
}

#pragma mark - 快速排序
- (void)rs_quickSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    if (self.count == 0) {
        return;
    }
    [self rs_quickSortWithLowIndex:0 highIndex:self.count - 1 usingComparator:comparator didExchange:exchangeCallback];
}

- (void)rs_quickSortWithLowIndex:(NSInteger)low highIndex:(NSInteger)high usingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    if (low >= high) {
        return;
    }
    NSInteger pivotIndex = [self rs_quickPartitionWithLowIndex:low highIndex:high usingComparator:comparator didExchange:exchangeCallback];
    [self rs_quickSortWithLowIndex:low highIndex:pivotIndex - 1 usingComparator:comparator didExchange:exchangeCallback];
    [self rs_quickSortWithLowIndex:pivotIndex + 1 highIndex:high usingComparator:comparator didExchange:exchangeCallback];
}

- (NSInteger)rs_quickPartitionWithLowIndex:(NSInteger)low highIndex:(NSInteger)high usingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    id pivot = self[low];
    NSInteger i = low;
    NSInteger j = high;
    
    while (i < j) {
        // 略过大于等于pivot的元素
        while (i < j && comparator(self[j], pivot) != NSOrderedAscending) {
            j --;
        }
        if (i < j) {
            // i、j未相遇，说明找到了小于pivot的元素。交换。
            [self rs_exchangeWithIndexA:i indexB:j didExchange:exchangeCallback];
            i ++;
        }
        
        /// 略过小于等于pivot的元素
        while (i < j && comparator(self[i], pivot) != NSOrderedDescending) {
            i ++;
        }
        if (i < j) {
            // i、j未相遇，说明找到了大于pivot的元素。交换。
            [self rs_exchangeWithIndexA:i indexB:j didExchange:exchangeCallback];
            j --;
        }
    }
    return i;
}

#pragma mark - 堆排序
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

/// 下沉，传入需要下沉的元素位置，以及允许下沉的最底位置
- (void)sinkIndex:(NSInteger)index bottomIndex:(NSInteger)bottomIndex usingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback {
    for (NSInteger maxChildIndex = index * 2; maxChildIndex <= bottomIndex; maxChildIndex *= 2) {
        // 如果存在右子结点，并且左子结点比右子结点小
        if (maxChildIndex < bottomIndex && (comparator(self[maxChildIndex], self[maxChildIndex + 1]) == NSOrderedAscending)) {
            // 指向右子结点
            ++ maxChildIndex;
        }
        // 如果最大的子结点元素小于本元素，则本元素不必下沉了
        if (comparator(self[maxChildIndex], self[index]) == NSOrderedAscending) {
            break;
        }
        // 否则
        // 把最大子结点元素上游到本元素位置
        [self rs_exchangeWithIndexA:index indexB:maxChildIndex didExchange:exchangeCallback];
        // 标记本元素需要下沉的目标位置，为最大子结点原位置
        index = maxChildIndex;
    }
}

@end
