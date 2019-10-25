//
//  MergerSort.m
//  Arithmetic
//
//  Created by iMac on 2019/10/25.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "MergerSort.h"
#import "SortCommon.h"

static NSMutableArray * aux;

@interface MergerSort()

@end

@implementation MergerSort

+(void)initialize{
    aux = @[].mutableCopy;
}

+(void)sortArr:(NSMutableArray*)arr{
    aux = @[].mutableCopy;
    [MergerSort sortArr:arr lo:0 hi:arr.count - 1];
}

+(void)sortArr:(NSMutableArray*)arr lo:(NSInteger)lo hi:(NSInteger)hi{
    if (hi <= lo){
        return;
    }
    
    NSInteger mid = lo + (hi - lo)/2;
    [self sortArr:arr lo:lo hi:mid];
    [self sortArr:arr lo:mid+1 hi:hi];
    [self mergeArr:arr lo:lo mid:mid hi:hi];
}

+(void)mergeArr:(NSMutableArray*)arr
             lo:(NSInteger)lo
            mid:(NSInteger)mid
             hi:(NSInteger)hi {
    NSInteger i = lo;
    NSInteger j = mid + 1;
    for(NSInteger k = lo; k <= hi ; k++){
        aux[k] = arr[k];
    }
    
    for(NSInteger k = lo;k <= hi;k++){
        if (i > mid) {
            arr[k] = aux[j++];
        }
        else if (j > hi){
            arr[k] = aux[i++];
        }
        else if([SortCommon isLessWithNum1:aux[j] num2:aux[i]]){
            arr[k] = aux[j++];
        }
        else{
            arr[k] = aux[i++];
        }
    }
}

@end
