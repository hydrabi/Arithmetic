//
//  SelectSort.m
//  Arithmetic
//
//  Created by iMac on 2019/10/9.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "SelectSort.h"
#import "SortCommon.h"

@implementation SelectSort

//首先 找到数组中最小的那个元素，其次，将它和数组的第一个元素交换位置（如果第一个元素就是最小元素那么它就和自己交换）
//再次 在剩下的元素中找到最小的元素，将它与数组的第二个元素交换位置。
//如此往复 直到整个数组排序
//比较次数 (N-1)+(N-2)+(N-3)+..+2+1 = N(N-1)/2 ~ N*N/2
//交换次数 N
+(void)selectSort:(NSMutableArray*)arr{
    
    if(arr.count == 0 ||arr.count == 1){
        return;
    }
    
    for(NSInteger i = 0;i<arr.count;i++){
        NSInteger min = i;
        for (NSInteger j = i+1; j<arr.count; j++) {
            if ([SortCommon isLessWithNum1:arr[j] num2:arr[min]]){
                min = j;
            }
        }
        [SortCommon exch:arr i:i j:min];
    }
}

+(void)selectSortA1:(NSMutableArray*)arr{
    
    if(arr.count == 0 ||arr.count == 1){
        return;
    }
    
    for(NSInteger i = 0;i<arr.count;i++){
        NSInteger min = i;
        for (NSInteger j = i+1; j<arr.count; j++) {
            if ([SortCommon isLessWithAl1:arr[j] al2:arr[min]]){
                min = j;
            }
        }
        [SortCommon exch:arr i:i j:min];
    }
}

@end
