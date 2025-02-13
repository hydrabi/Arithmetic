//
//  BubbleSort.m
//  Arithmetic
//
//  Created by iMac on 2019/11/12.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "BubbleSort.h"
#import "SortCommon.h"

/// 冒泡排序（Bubble Sort）也是一种简单直观的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢"浮"到数列的顶端。
//比较相邻的元素。如果第一个比第二个大，就交换他们两个。
//
//对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
//
//针对所有的元素重复以上的步骤，除了最后一个。
@implementation BubbleSort

+(void)sortArr:(NSMutableArray*)arr{
    NSInteger len = arr.count ;
    for (NSInteger i = 0;i < len - 1; i++){
        for (NSInteger j = 0; j < len - 1 - i ; j++){
            if ([SortCommon isLess:arr[j+1] j:arr[j]]){
                id temp = arr[j+1];
                arr[j+1] = arr[j];
                arr[j] = temp;
            }
        }
    }
}

@end
