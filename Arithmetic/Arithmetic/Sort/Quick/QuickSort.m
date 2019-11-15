//
//  QuickSort.m
//  Arithmetic
//
//  Created by Hydra on 2019/11/1.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "QuickSort.h"
#import "SortCommon.h"

/// 快速排序
@implementation QuickSort

//切分法
// 因为切分过程总是能排定一个元素，用归纳法不难证明递归能够正确地将数组排序：
//如果左子数组和右子数组都是有序的，那么由左子数组（有序且没有任何元素大于切分元素）、切分元素和右子数组都是有序的（有序且没有任何元素小于切分元素）组成的结果数组也一定是有序的。
//要完成这个实现，需要实现切分方法。一般策略是先随意地取a【lo】作为切分元素，即那个将会被排定的元素，然后我们从数组的左端开始向右扫描直到找到一个大于等于它的元素，再从数组的右端开始向左扫描直到找到一个小于等于它的元素。这两个元素显然是没有排定的，因此我们交换他们的位置。如此继续，我们可以保证指针i左侧元素都不大于切分元素，右指针j的右侧元素都不小于切分元素。当两个指针相遇时，我们只需要将元素a【lo】和左子数组最右侧的元素a【j】交换然后返回j即可

+(void)quickSort:(NSMutableArray*)arr lo:(NSInteger)lo hi:(NSInteger)hi{
    if (lo >= hi){
        return;
    }
    
    NSInteger j = [self partition:arr lo:lo hi:hi];
    [self quickSort:arr lo:lo hi:j-1];
    [self quickSort:arr lo:j+1 hi:hi];
}

+(NSInteger)partition:(NSMutableArray*)arr
              lo:(NSInteger)lo
              hi:(NSInteger)hi{
    NSInteger i = lo;
    NSInteger j = hi + 1;
    NSString *v = arr[lo];
    
    while (YES) {
        while ([SortCommon isLessWithAl1:arr[++i]
                                     al2:v]) {
            if (i == hi){
                break;
            }
        }
        
        while ([SortCommon isLessWithAl1:v
                                     al2:arr[--j]]) {
            if (j == lo){
                break;
            }
        }
        
        if (i >= j){
            break;
        }
        
        [SortCommon exch:arr i:i j:j];
    }
    
    [SortCommon exch:arr i:lo j:j];
    NSLog(@"%@",arr);
    return j;
}

@end
