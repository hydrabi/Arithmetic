//
//  PriorityQueue.m
//  Arithmetic
//
//  Created by iMac on 2019/11/4.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "PriorityQueue.h"
#import "SortCommon.h"

@interface PriorityQueue()
@property(nonatomic, strong) NSMutableArray * arr;
@end

@implementation PriorityQueue

-(instancetype)init{
    self = [super init];
    if(self){
        _arr = @[].mutableCopy;
    }
    return self;
}

//上浮 因为某个结点比它的父节点更大而被打破 我们需要通过交换它和它的父节点来修复堆 交换后 这个结点比它的两个子节点都打（一个是曾经的父节点 另一个比它更小）
//但这个结点仍然可能比它现在的父节点更大 我们可以一遍遍地用同样的办法恢复秩序 将这个结点不断向上移动直到我们遇到了一个更大的父节点
//父节点的位置是k/2
-(void)swim:(NSInteger)k{
    while (k > 1 && [SortCommon isLessWithAl1:_arr[k/2] al2:_arr[k]]){
        [SortCommon exch:_arr i:k/2 j:k];
        k = k/2;
    }
}

//下沉 如果堆的有序状态因为某个结点变得比它的两个子节点或是其中之一更小了而被打破 那么我们可以通过将它和它的两个子节点中的较大者交换来修复堆
//将节点向下移动直到它的子节点都比它更小或是到达了堆的底部
-(void)sink:(NSInteger)k{
    NSInteger N = self.arr.count -1;
    while(2*k <= N){
        NSInteger j = 2*k;
        //因为是二叉树 只会跑一次 找出子节点中较大的那个
        if (j< N && [SortCommon isLessWithAl1:self.arr[j] al2:self.arr[j+1]]) {
            j++;
        }
        
        if (![SortCommon isLessWithAl1:self.arr[k] al2:self.arr[j]]){
            break;
        }
        
        [SortCommon exch:_arr i:k j:j];
        k = j;
    }
}

@end
