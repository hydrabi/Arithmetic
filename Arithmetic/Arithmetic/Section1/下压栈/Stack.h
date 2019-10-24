//
//  Stack.h
//  Arithmetic
//
//  Created by iMac on 2018/9/3.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListObject.h"
#import "Iterator.h"

@interface Stack<__covariant Item> : NSObject<Iterator>

/**
 迭代的当前节点
 */
@property(nonatomic, strong) ListObject * current;

//向栈顶添加元素
-(void)push:(NSString*)item;
//从栈顶删除元素
-(NSString*)pop;

@end
