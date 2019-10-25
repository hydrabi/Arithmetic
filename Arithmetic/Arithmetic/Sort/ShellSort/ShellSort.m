//
//  ShellSort.m
//  Arithmetic
//
//  Created by iMac on 2019/10/14.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "ShellSort.h"
#import "SortCommon.h"
@implementation ShellSort

/// 是数组中任意间隔为h的元素排序 ，使子数组有序，然后递减间隔，继续排序，直到间隔为1
+(void)shellSort:(NSMutableArray*)arr{
    NSInteger N = arr.count;
    NSInteger h = 1;
    NSInteger factor = 3;
    while (h < N/factor) {
        h = factor * h + 1;
    }
    while (h >= 1) {
        for (NSInteger i=h;i<N;i++){
            for (NSInteger j = i; j>=h && [SortCommon isLessWithNum1:arr[j] num2:arr[j-h]];j=j-h){
                [SortCommon exch:arr i:j j:j-h];
            }
            h = h / factor;
        }
    }
}

+(void)shellSortAl:(NSMutableArray*)arr{
    NSInteger N = arr.count;
    NSInteger h = 1;
    NSInteger factor = 3;
    while (h < N / factor) {
        h = h * factor + 1;
    }
    
    for (NSInteger i = h; i<N ; i++){
        for (NSInteger j = i;j>=h && [SortCommon isLessWithAl1:arr[j] al2:arr[j-h]] ; j-=h){
            [SortCommon exch:arr i:j j:j-h];
        }
        
        h = h / factor;
    }
}

@end
