//
//  MergerSort.m
//  Arithmetic
//
//  Created by iMac on 2019/10/25.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "MergerSort.h"
#import "SortCommon.h"

static NSMutableArray * aux;

@interface MergerSort()

@end

@implementation MergerSort
//这个算法比较复杂 所以找一些资料帮助理解

//https://juejin.im/post/5ab4c7566fb9a028cb2d9126

//归并过程为：比较a[i]和b[j]的大小，若a[i]≤b[j]，则将第一个有序表中的元素a[i]复制到r[k]中，并令i和k分别加上1；否则将第二个有序表中的元素b[j]复制到r[k]中，并令j和k分别加上1，如此循环下去，直到其中一个有序表取完，然后再将另一个有序表中剩余的元素复制到r中从下标k到下标t的单元。归并排序的算法我们通常用递归实现，先把待排序区间[s,t]以中点二分，接着把左边子区间排序，再把右边子区间排序，最后把左区间和右区间用一次归并操作合并成有序的区间[s,t]。

//原理：
//归并操作的工作原理如下：
//第一步：申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列
//第二步：设定两个指针，最初位置分别为两个已经排序序列的起始位置
//第三步：比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置
//重复步骤3直到某一指针超出序列尾
//将另一序列剩下的所有元素直接复制到合并序列尾

//总结：
//将两个已排好序的数组合并成一个有序的数组,称之为归并排序
//步骤：遍历两个数组，比较它们的值。谁比较小，谁先放入大数组中，直到数组遍历完成

//注意
//归并排序的前提是需要两个已经排好顺序的数组

//这就是我们的分治法--->将一个大问题分成很多个小问题进行解决，最后重新组合起来

+(void)initialize{
    aux = @[].mutableCopy;
}

+(void)sortArr:(NSMutableArray*)arr{
    aux = @[].mutableCopy;
    [MergerSort sortArr:arr lo:0 hi:arr.count - 1];
}

+(void)sortArr:(NSMutableArray*)arr lo:(NSInteger)lo hi:(NSInteger)hi{
    if (hi <= lo){
        return;
    }
    
    NSInteger mid = lo + (hi - lo)/2;
    [self sortArr:arr lo:lo hi:mid];
    [self sortArr:arr lo:mid+1 hi:hi];
    [self mergeArr:arr lo:lo mid:mid hi:hi];
}

+(void)mergeArr:(NSMutableArray*)arr
             lo:(NSInteger)lo
            mid:(NSInteger)mid
             hi:(NSInteger)hi {
    NSInteger i = lo;
    NSInteger j = mid + 1;
    for(NSInteger k = lo; k <= hi ; k++){
        aux[k] = arr[k];
    }
    
    for(NSInteger k = lo;k <= hi;k++){
        if (i > mid) {
            arr[k] = aux[j++];
        }
        else if (j > hi){
            arr[k] = aux[i++];
        }
        else if([SortCommon isLessWithNum1:aux[j] num2:aux[i]]){
            arr[k] = aux[j++];
        }
        else{
            arr[k] = aux[i++];
        }
    }
}

#pragma mark - 理解版本

/// 归并排序
/// @param arr 需要排序的队列
/// @param l 指向数组第一个元素
/// @param r 指向数组最后一个元素
-(void)testMergeSort:(NSMutableArray*)arr l:(NSInteger)l r:(NSInteger)r {
    //如果只有一个元素 就不用排序了
    if (l == r){
        return;
    }
    else{
        //取中间的数，进行拆分
        NSInteger m = (l + r) / 2;
        //左边的数不断进行拆分
        [self testMergeSort:arr l:l r:m];
        //右边的数不断进行拆分
        [self testMergeSort:arr l:m+1 r:r];
        //合并
        [self testMerge:arr l:l m:m+1 r:r];
    }
}

-(void)testMerge:(NSMutableArray*)arr l:(NSInteger)l m:(NSInteger)m r:(NSInteger)r{
    //左边的数组
    NSMutableArray *leftArr = @[].mutableCopy;
    //右边的数组
    NSMutableArray *rightArr = @[].mutableCopy;
    
    //往这两个数组填充数据
    for (NSInteger i=l;i<m;i++){
        leftArr[i-l] = arr[i];
    }
    
    for (NSInteger i=m;i<=r;i++){
        rightArr[i-m] = arr[i];
    }
    
    NSInteger i = 0,j = 0;
    NSInteger k = l;
    
    while (i<leftArr.count && j<rightArr.count) {
        if (leftArr[i]<rightArr[j]){
            arr[k] = leftArr[i];
            i++;
            k++;
        }
        else{
            arr[k] = rightArr[j];
            j++;
            k++;
        }
    }
    
    while (i<leftArr.count) {
        arr[k] = leftArr[i];
        i++;
        k++;
    }
    
    while (j<rightArr.count) {
        arr[k] = rightArr[j];
        j++;
        k++;
    }
    
}

@end
