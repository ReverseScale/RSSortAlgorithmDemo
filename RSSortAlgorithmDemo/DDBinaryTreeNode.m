//
//  DDBinaryTreeNode.m
//  RSSortAlgorithmDemo
//
//  Created by WhatsXie on 2017/7/31.
//  Copyright © 2017年 StevenXie. All rights reserved.
//  二叉树方法

#import "DDBinaryTreeNode.h"

@implementation DDBinaryTreeNode

//先序
+ (void)preOrderTraverseTree:(DDBinaryTreeNode *)rootNode handler:(void(^)(DDBinaryTreeNode *treeNode))handler {
    if (!rootNode) {
        return;
    }
    
    if (handler) {
        handler(rootNode);
    }
    [self preOrderTraverseTree:rootNode.leftNode handler:handler];
    [self preOrderTraverseTree:rootNode.rightNode handler:handler];
}

//中序
+ (void)inOrderTraverseTree:(DDBinaryTreeNode *)rootNode handler:(void (^)(DDBinaryTreeNode *treeNode))handler {
    if (!rootNode) {
        return;
    }
    [self inOrderTraverseTree:rootNode.leftNode handler:handler];
    if (handler) {
        handler(rootNode);
    }
    [self inOrderTraverseTree:rootNode.rightNode handler:handler];
}

//后序
+ (void)postOrderTraverseTree:(DDBinaryTreeNode *)rootNode handler:(void(^)(DDBinaryTreeNode *treeNode))handler {
    if (!rootNode) {
        return;
    }
    [self postOrderTraverseTree:rootNode.leftNode handler:handler];
    [self postOrderTraverseTree:rootNode.rightNode handler:handler];
    if (handler) {
        handler(rootNode);
    }
}

//树的翻转
+ (DDBinaryTreeNode *)invertBinaryTree:(DDBinaryTreeNode *)rootNode {
    if (!rootNode) {
        return nil;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return rootNode;
    }
    [self invertBinaryTree:rootNode.leftNode];
    [self invertBinaryTree:rootNode.rightNode];
    DDBinaryTreeNode *tempNode = rootNode.leftNode;
    rootNode.leftNode = rootNode.rightNode;
    rootNode.rightNode = tempNode;
    return rootNode;
}

//树的查找
+ (DDBinaryTreeNode *)searchTreeNodeWithValue:(NSInteger)value inTree:(DDBinaryTreeNode *)rootNode {
    if (!rootNode) {
        return nil;
    }
    
    if (rootNode.value == value) {
        return rootNode;
    }
    
    if (value < rootNode.value) {
        return [DDBinaryTreeNode searchTreeNodeWithValue:value inTree:rootNode.leftNode];
    } else {
        return [DDBinaryTreeNode searchTreeNodeWithValue:value inTree:rootNode.rightNode];
    }
}

@end
