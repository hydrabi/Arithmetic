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
    
    //排序到倒数第二位 因为只剩下最后两个比较
    for(NSInteger i=1;i<arr.count-1;i++){
        [SelectSort sortSingleWithArr:arr fromIndex:i];
    }
    
}

+(void)sortSingleWithArr:(NSMutableArray*)arr fromIndex:(NSInteger)fromIndex{
    if (fromIndex < 1){
        return;
    }
    
    NSString *minNumber = arr[fromIndex - 1];
    NSInteger minIndex = fromIndex - 1;
    for(NSInteger i = fromIndex ; i < arr.count ; i++){
        //如果靠后的数小于当前最小的数
        if ([SortCommon isLessWithAl1:arr[i] al2:minNumber]){
            minNumber = arr[i];
            minIndex = i;
        }
    }
    
    [SortCommon exch:arr i:minIndex j:fromIndex-1];
    NSLog(@"%d %@",fromIndex,arr);
}

@end
