//
//  Section1.m
//  Arithmetic
//
//  Created by iMac on 2018/7/29.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "Section1.h"
#import "ListObject.h"
#import "Queue.h"

@implementation Section1

-(void)start{
//    [self startTestBinarySearch];
//    [self traverseListObject];
    [self createQueueAndTest];
}

#pragma mark - 链表
//创建链表
-(ListObject*)createList{
    ListObject<NSString*> *first = [[ListObject alloc] init];
    ListObject<NSString*> *second = [[ListObject alloc] init];
    ListObject<NSString*> *third = [[ListObject alloc] init];
    
    first.item = @"to";
    second.item = @"be";
    third.item = @"or";
    
    first.next = second;
    second.next = third;
    
    return first;
}

-(void)traverseListObject{
    ListObject *first = [self createList];
    
    for(ListObject* x = first;x != nil;x = x.next){
        NSLog(@"%@",x.item);
    }
}

-(void)createQueueAndTest{
    Queue *queue = [[Queue alloc] init];
    [queue enqueue:@"1"];
    [queue enqueue:@"2"];
    [queue enqueue:@"3"];
    
    NSLog(@"queue is %@ empty",[queue isEmpty] ? @"" : @"not");
    NSLog(@"queue size is %d",[queue size]);
}

#pragma mark - 二分法
//测试二分法查找
-(void)startTestBinarySearch{
    NSArray *numberArr = @[@(1),
                           @(2),
                           @(3),
                           @(4),
                           @(5),
                           @(7),
                           @(8),
                           @(9),
                           @(10)];
    
    NSArray *testNumberArr = @[@(1),
                               @(11),
                               @(2),
                               @(12),
                               @(3),
                               @(13),
                               @(4),
                               @(14)];
    
    for(NSNumber *number in testNumberArr){
//        int result = [self binarySearchWithKey:number.intValue numberArr:numberArr];
        int result = [self recursionBinarySearchWithKey:number.intValue numberArr:numberArr low:0 hi:(int)(numberArr.count - 1)];
        if(result < 0){
            NSLog(@"%d不存在与数组中",number.intValue);
        }
        else{
            NSLog(@"%d存在",number.intValue);
        }
    }
}

//二分法 数组需要有序 当输入的数字不存在与数组中 返回-1
-(int)binarySearchWithKey:(int)key numberArr:(NSArray*)numberArr{
    int low = 0;
    int hi = (int)numberArr.count - 1;
    while (low <= hi) {
        int mid = low + (hi - low)/2;
        if(key < [numberArr[mid] intValue]){
            hi = mid - 1;
        }
        else if(key > [numberArr[mid] intValue]){
            low = mid + 1;
        }
        else{
            return mid;
        }
    }
    
    return -1;
}

//二分查找法的递归实现
-(int)recursionBinarySearchWithKey:(int)key numberArr:(NSArray*)numberArr low:(int)low hi:(int)hi{
    if(low > hi){
        return -1;
    }
    
    int mid = low + (hi - low)/2;
    if(key < [numberArr[mid] intValue]){
        return [self recursionBinarySearchWithKey:key numberArr:numberArr low:low hi:(mid - 1)];
    }
    else if(key > [numberArr[mid] intValue]){
        return [self recursionBinarySearchWithKey:key numberArr:numberArr low:(mid + 1) hi:hi];
    }
    else{
        return mid;
    }
}

@end
