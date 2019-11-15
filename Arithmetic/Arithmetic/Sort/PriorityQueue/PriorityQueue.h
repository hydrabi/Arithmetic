//
//  PriorityQueue.h
//  Arithmetic
//
//  Created by iMac on 2019/11/4.
//  Copyright © 2019 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PriorityQueue : NSObject
-(id)delMax;
-(void)insert:(NSObject*)v;
-(BOOL)isEmpty;
+(void)sink:(NSMutableArray*)arr k:(NSInteger)k N:(NSInteger)N;
+(void)sort:(NSMutableArray*)arr;
@end

NS_ASSUME_NONNULL_END
