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
@property(nonatomic, assign) NSInteger N;
@end

@implementation PriorityQueue

-(instancetype)init{
    self = [super init];
    if(self){
        _arr = @[@(0)].mutableCopy;
    }
    return self;
}

-(BOOL)isEmpty{
    return self.N == 0;
}

-(void)insert:(NSObject*)v{
    self.N++;
    [self.arr insertObject:v atIndex:self.N];
    [self swim:self.N];
}

-(id)delMax{
    //从根结点得到最大元素
    id max = self.arr[1];
    //将其和最后一个结点交换
    [SortCommon exch:self.arr i:1 j:self.N--];
    //防止越界
    [self.arr addObject:@(0)];
    //恢复堆的有序性
    [self sink:1];
    return max;
}

//上浮 因为某个结点比它的父节点更大而被打破 我们需要通过交换它和它的父节点来修复堆 交换后 这个结点比它的两个子节点都打（一个是曾经的父节点 另一个比它更小）
//但这个结点仍然可能比它现在的父节点更大 我们可以一遍遍地用同样的办法恢复秩序 将这个结点不断向上移动直到我们遇到了一个更大的父节点
//父节点的位置是k/2
-(void)swim:(NSInteger)k{
    
    while (k > 1 && [SortCommon isLess:_arr[k/2] j:_arr[k]]){
        [SortCommon exch:_arr i:k/2 j:k];
        k = k/2;
    }
}

//下沉 如果堆的有序状态因为某个结点变得比它的两个子节点或是其中之一更小了而被打破 那么我们可以通过将它和它的两个子节点中的较大者交换来修复堆
//将节点向下移动直到它的子节点都比它更小或是到达了堆的底部
-(void)sink:(NSInteger)k{
    
    while(2*k <= self.N){
        NSInteger j = 2*k;
        //因为是二叉树 只会跑一次 找出子节点中较大的那个
        if (j< self.N && [SortCommon isLess:self.arr[j] j:self.arr[j+1]]) {
            j++;
        }
        
        if (![SortCommon isLess:self.arr[k] j:self.arr[j]]){
            break;
        }
        
        [SortCommon exch:_arr i:k j:j];
        k = j;
    }
}

//+(void)sink:(NSMutableArray*)arr k:(NSInteger)k N:(NSInteger)N{
//    while(2*k <= N){
//        NSInteger j = 2*k;
//        //因为是二叉树 只会跑一次 找出子节点中较大的那个
//        if (j< N && [SortCommon isLess:arr[j] j:arr[j+1]]) {
//            j++;
//        }
//
//        if (![SortCommon isLess:arr[k] j:arr[j]]){
//            break;
//        }
//
//        [SortCommon exch:arr i:k j:j];
//        k = j;
//    }
//}

+(void)sink:(NSMutableArray*)arr k:(NSInteger)k N:(NSInteger)N{
    while (k*2 <= N) {
        NSInteger j = k*2;
        if([SortCommon isLess:arr[j] j:arr[j+1]]){
            j++;
        }
        
        if(![SortCommon isLess:arr[k] j:arr[j]]){
            break;
        }
        
        [SortCommon exch:arr i:k j:j];
        k = j;
    }
}

+(void)sort:(NSMutableArray*)arr{
    NSInteger N = arr.count;
    //k之所以取N/2 是因为只有从N/2开始 才有子节点 这些才需要下沉
    for(NSInteger k = N/2; k>=1; k--){
        [self sink:arr k:k N:N];
    }

    //不断把根结点（最大的结点）往最后一位移 然后N递减 直至不能下沉
    while (N > 1) {
        [SortCommon exch:arr i:1 j:N--];
        [self sink:arr k:1 N:N];
    }
}


@end
