//
//  SortAnswer.m
//  Arithmetic
//
//  Created by iMac on 2019/10/21.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "SortAnswer.h"
#import "SelectSort.h"
#import "InsertSort.h"

@implementation SortAnswer

+(void)answer{
    [self answer_2_1_4];
}

+(void)answer_2_1_1{
    NSMutableArray *arr = @[@"E",
                            @"A",
                            @"S",
                            @"Y",
                            @"Q",
                            @"U",
                            @"E",
                            @"S",
                            @"T",
                            @"I",
                            @"O",
                            @"N",].mutableCopy;
    [SelectSort selectSortA1:arr];
    NSLog(@"%@", arr);
    
}

+(void)answer_2_1_4 {
    NSMutableArray *arr = @[@"E",
    @"A",
    @"S",
    @"Y",
    @"Q",
    @"U",
    @"E",
    @"S",
    @"T",
    @"I",
    @"O",
    @"N",].mutableCopy;
    [InsertSort insertSortAl:arr];
}

@end
