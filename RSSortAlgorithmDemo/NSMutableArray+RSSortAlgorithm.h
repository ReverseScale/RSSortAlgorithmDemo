//
//  NSMutableArray+RSSortAlgorithm.h
//  RSSortAlgorithmDemo
//
//  Created by WhatsXie on 2017/7/31.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSComparisonResult(^RSSortComparator)(id obj1, id obj2);
typedef void(^RSSortExchangeCallback)(id obj1, id obj2);

@interface NSMutableArray (RSSortAlgorithm)

// 选择排序
- (void)rs_selectionSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback;

// 冒泡排序
- (void)rs_bubbleSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback;

// 插入排序
- (void)rs_insertionSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback;

// 快速排序
- (void)rs_quickSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback;

// 堆排序
- (void)rs_heapSortUsingComparator:(RSSortComparator)comparator didExchange:(RSSortExchangeCallback)exchangeCallback;

@end
