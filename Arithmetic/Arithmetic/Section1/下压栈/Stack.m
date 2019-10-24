//
//  Stack.m
//  Arithmetic
//
//  Created by iMac on 2018/9/3.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "Stack.h"
@interface Stack()

/**
 栈顶
 */
@property(nonatomic, strong) ListObject<NSString*> *first;

/**
 元素数量
 */
@property(nonatomic, assign) NSInteger  N;

@end

@implementation Stack

-(instancetype)init{
    self = [super init];
    if(self){
        _current = _first;
    }
    return self;
}

-(BOOL)isEmpty{
    return self.first == nil;
}

-(NSInteger)size{
    return self.N;
}

//向栈顶添加元素
-(void)push:(NSString*)item{
    ListObject *oldFirst = self.first;
    self.first = [[ListObject alloc] init];
    self.first.item = item;
    self.first.next = oldFirst;
    self.N ++ ;
}

//从栈顶删除元素
-(NSString*)pop{
    NSString *item = self.first.item;
    self.first = self.first.next;
    self.N --;
    return item;
}

#pragma mark - Iterator
-(BOOL)hasNext{
    return self.current != nil;
}

-(id)next{
    NSString *item = self.current.item;
    self.current = self.current.next;
    return item;
}

@end
