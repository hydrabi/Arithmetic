//
//  SortAnswer.m
//  Arithmetic
//
//  Created by iMac on 2019/10/21.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "SortAnswer.h"
#import "SelectSort.h"

@implementation SortAnswer

+(void)answer{
    [self answer_2_1_1];
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
    [SelectSort selectSort:arr];
    NSLog(@"%@", arr);
    
}


@end
