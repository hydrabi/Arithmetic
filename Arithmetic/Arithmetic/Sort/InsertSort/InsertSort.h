//
//  InsertSort.h
//  Arithmetic
//
//  Created by iMac on 2019/10/9.
//  Copyright © 2019 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 插入排序
@interface InsertSort : NSObject

/// 插入排序
/// @param arr 需要排序的数组
+(void)insertSort:(NSMutableArray*)arr;

/// 排序字母
/// @param arr 需要排序的数组
+(void)insertSortAl:(NSMutableArray*)arr;
@end

NS_ASSUME_NONNULL_END
