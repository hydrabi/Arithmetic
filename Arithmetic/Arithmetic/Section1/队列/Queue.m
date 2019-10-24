//
//  Queue.m
//  Arithmetic
//
//  Created by iMac on 2018/9/3.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "Queue.h"
#import "ListObject.h"

@interface Queue()

/**
 指向最早添加的结点的链接
 */
@property(nonatomic, strong) ListObject<NSString*> * first;

/**
 指向最近添加的结点的链接
 */
@property(nonatomic, strong) ListObject<NSString*> * last;

/**
 元素数量
 */
@property(nonatomic, assign) NSInteger N;
@end

@implementation Queue

-(BOOL)isEmpty{
    return self.first == nil;
}

-(NSInteger)size{
    return self.N;
}

//向表尾添加元素
-(void)enqueue:(NSString*)item{
    ListObject *oldLast = self.last;
    self.last = [[ListObject alloc] init];
    self.last.item = item;
    self.last.next = nil;
    if([self isEmpty]){
        self.first = self.last;
    }
    else{
        oldLast.next = self.last;
    }
    self.N++;
}

//从表头删除元素
-(NSString*)dequeue{
    NSString *item = self.first.item;
    self.first = self.first.next;
    if([self isEmpty]){
        self.last = nil;
    }
    self.N --;
    return item;
}

//1.3.19 移除链表的尾结点
-(void)removeTheLast{
    for(ListObject *node = self.first; node.next != nil; node = node.next){
        if(node.next == self.last){
            self.last = node;
            self.last.next = nil;
        }
    }
}

//1.3.20 删除链表的第k个元素
-(void)deleteNodeAtIndex:(NSInteger)index{
    //超出链表的数目
    if(index > self.N){
        return;
    }
    
    //序列为0 删除first结点
    if(index == 0){
        [self dequeue];
    }
    
    NSInteger i = 0;
    //需要删除的结点的前一个结点
    ListObject *nodeBeforeIndex = self.first;
    //需要删除的结点
    ListObject *shouldDeleteNode = nil;
    while (i == index - 1) {
        shouldDeleteNode = nodeBeforeIndex;
        nodeBeforeIndex = self.first.next;
        i++;
    }
    
    //需要删除的结点的前一个结点指向需要删除结点的下一个结点
    nodeBeforeIndex.next = shouldDeleteNode.next;
    //需要删除的结点置为空
    shouldDeleteNode = nil;
    self.N --;
}

@end
