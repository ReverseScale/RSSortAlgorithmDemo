//
//  DDBinaryTreeNode.h
//  RSSortAlgorithmDemo
//
//  Created by WhatsXie on 2017/7/31.
//  Copyright © 2017年 StevenXie. All rights reserved.
//  二叉树方法

#import <Foundation/Foundation.h>

@interface DDBinaryTreeNode : NSObject

/** 值 */
@property (nonatomic, assign) NSInteger value;
/** 左节点 */
@property (nonatomic, strong) DDBinaryTreeNode *leftNode;
/** 右节点 */
@property (nonatomic, strong) DDBinaryTreeNode *rightNode;

//前序
+ (void)preOrderTraverseTree:(DDBinaryTreeNode *)rootNode handler:(void(^)(DDBinaryTreeNode *treeNode))handler;

//中序
+ (void)inOrderTraverseTree:(DDBinaryTreeNode *)rootNode handler:(void (^)(DDBinaryTreeNode *treeNode))handler;

//后序
+ (void)postOrderTraverseTree:(DDBinaryTreeNode *)rootNode handler:(void(^)(DDBinaryTreeNode *treeNode))handler;

//树的翻转
+ (DDBinaryTreeNode *)invertBinaryTree:(DDBinaryTreeNode *)rootNode;

//树的查找
+ (DDBinaryTreeNode *)searchTreeNodeWithValue:(NSInteger)value inTree:(DDBinaryTreeNode *)rootNode;

@end
