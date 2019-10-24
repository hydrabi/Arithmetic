//
//  Iterator.h
//  Arithmetic
//
//  Created by iMac on 2018/9/3.
//  Copyright © 2018年 iMac. All rights reserved.
//

@class ListObject;
@protocol Iterator <NSObject>

@property(nonatomic, strong) ListObject * current;

-(BOOL)hasNext;

-(id)next;

@end

