//
//  ListObject.h
//  Arithmetic
//
//  Created by iMac on 2018/8/31.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

//__covariant意为协变，意思是指子类可以强制转转换为(超类)父类，遵从的是SOLID中的L即里氏替换原则，大概可以描述为： 程序中的对象应该是可以在不改变程序正确性的前提下被它的子类所替换的[1]
//__contravariant意为逆变，意思是指父类可以强制转为子类。

@interface ListObject<__covariant T> : NSObject

@property(nonatomic, strong) T item;

@property(nonatomic, strong) ListObject * next;

@end
