//
//  SelectSort.h
//  Arithmetic
//
//  Created by iMac on 2019/10/9.
//  Copyright © 2019 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 选择排序
@interface SelectSort : NSObject

/// 用选择排序的方式排序
/// @param arr 需要排序的序列
+(void)selectSort:(NSMutableArray*)arr;
@end

NS_ASSUME_NONNULL_END
