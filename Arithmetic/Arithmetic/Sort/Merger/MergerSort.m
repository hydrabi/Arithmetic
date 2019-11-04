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
        
        NSLog(@"%@",arr);
    }
}

#pragma mark - 自底向上
//sz = 1
//0 0 1
//2 2 3
//4 4 5
//6 6 7
//8 8 9
//10 10 11
//12 12 13
//14 14 15

//sz = 2
//0 1 3
//4 5 7
//8 9 11
//12 13 15

//sz = 4
//0 3 7
//8 11 15

//sz = 8
//0 7 15

+(void)upSort:(NSMutableArray*)arr{
    NSInteger N = arr.count;
    aux = @[].mutableCopy;
    
    for (NSInteger sz=1; sz<N ;sz=sz+sz){
        for (NSInteger lo=0; lo<N-sz; lo+=sz+sz){
            [self mergeArr:arr lo:lo mid:lo+sz-1 hi:MIN(lo+sz+sz-1, N-1)];
        }
    }
}

@end
