//
//  InsertSort.m
//  Arithmetic
//
//  Created by iMac on 2019/10/9.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "InsertSort.h"
#import "SortCommon.h"

@implementation InsertSort
//插入排序规则： 从序列1（序列0为最开始）开始 从右往左判断 把该序列的元素插入到小于该序列元素的前一位
//该序列元素原来位置和插入位置之间的元素都往右移动一位
//按照算法规则 其实就是从序列1开始（序列0为最开始）从右往左判断 只要前面是比自己大 就交换顺序 直到没有比该序列元素小的

//最坏情况下 ~N*N/2次比较 和 ~N*N/2次交换 最好情况下需要N-1次比较和0次交换
//平均需要 ~N*N/4次比较 和 ~N*N/4次交换
+(void)insertSort:(NSMutableArray*)arr{
    
    for (NSInteger i = 1;i<arr.count;i++){
        //这里j的判断是 不需要移动到序列0 因为这样的话左边就没有元素比较
        //还有就是 只要出现前边的元素比自己小 就不需要在往左边判断了 可以停止该次循环
        for (NSInteger j = i;j>0 && [SortCommon isLessWithNum1:arr[j] num2:arr[j-1]];j--){
            [SortCommon exch:arr i:j j:j-1];
        }
        NSLog(@"%@", arr);
    }
    
}

+(void)insertSortAl:(NSMutableArray*)arr{
    for (NSInteger i = 0; i<arr.count-1; i++){
        //这里j的判断是 不需要移动到序列0 因为这样的话左边就没有元素比较
        //还有就是 只要出现前边的元素比自己小 就不需要在往左边判断了 可以停止该次循环
        for(NSInteger j = i+1; j>0 && [SortCommon isLessWithAl1:arr[j] al2:arr[j-1]]; j--){
            [SortCommon exch:arr i:j j:(j-1)];
        }
        
        NSLog(@"%@", arr);
    }
}

@end
