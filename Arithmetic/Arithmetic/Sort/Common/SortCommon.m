//
//  SortCommon.m
//  Arithmetic
//
//  Created by iMac on 2019/10/8.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "SortCommon.h"

@implementation SortCommon

+(BOOL)isLessWithNum1:(NSNumber*)num1 num2:(NSNumber*)num2{
    NSComparisonResult result = [num1 compare:num2];
    if (result == NSOrderedAscending){
        return YES;
    }
    return NO;
}

+(BOOL)isLessWithAl1:(NSString*)al1 al2:(NSString*)al2{
    NSComparisonResult result = [al1 compare:al2];
    if (result == NSOrderedAscending){
        return YES;
    }
    return NO;
}

+(BOOL)isLess:(id)i j:(id)j{
    if ([i isKindOfClass:[NSNumber class]] && [j isKindOfClass:[NSNumber class]]){
        return [SortCommon isLessWithNum1:i num2:j];
    }
    else if ([i isKindOfClass:[NSString class]] && [j isKindOfClass:[NSString class]]){
        return [SortCommon isLessWithAl1:i al2:j];
    }
    return NO;
}

+(BOOL)isSorted:(NSArray*)arr{
    for (NSInteger i = 1;i<arr.count;i++){
        if ([SortCommon isLessWithNum1:arr[i] num2:arr[i-1]]){
            return NO;
        }
    }
    return YES;
}

+(void)show:(NSArray*)arr{
    NSLog(@"%@",arr);
}

+(void)exch:(NSMutableArray*)arr i:(NSInteger)i j:(NSInteger)j{
    [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
}

@end
