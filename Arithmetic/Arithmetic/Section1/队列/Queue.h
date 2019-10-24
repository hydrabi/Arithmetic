//
//  Queue.h
//  Arithmetic
//
//  Created by iMac on 2018/9/3.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject
//判断是否为空
-(BOOL)isEmpty;
//链表结点数量
-(NSInteger)size;
//向表尾添加元素
-(void)enqueue:(NSString*)item;
//从表头删除元素
-(NSString*)dequeue;
//1.3.19 移除链表的尾结点
-(void)removeTheLast;
//1.3.20 删除链表的第k个元素
-(void)deleteNodeAtIndex:(NSInteger)index;
@end
