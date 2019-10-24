//
//  SortCommon.h
//  Arithmetic
//
//  Created by iMac on 2019/10/8.
//  Copyright © 2019 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortCommon : NSObject

/// num1是否少于num2
/// @param num1 需要比较的数目1
/// @param num2 需要比较的数目2
+(BOOL)isLessWithNum1:(NSNumber*)num1 num2:(NSNumber*)num2;

/// al1是否比al2排较前
/// @param al1 字母1
/// @param al2 字母2
+(BOOL)isLessWithAl1:(NSString*)al1 al2:(NSString*)al2;

/// 如果不是遵循从小到大的顺序排列 则属于未排序
/// @param arr 需要判断的队列
+(BOOL)isSorted:(NSArray*)arr;

/// 打印
/// @param arr 打印数组
+(void)show:(NSArray*)arr;

/// 交换指定位置的数据
/// @param arr 需要交换位置的数组
/// @param i 交换位置i
/// @param j 交换位置j
+(void)exch:(NSMutableArray*)arr i:(NSInteger)i j:(NSInteger)j;
@end

NS_ASSUME_NONNULL_END
