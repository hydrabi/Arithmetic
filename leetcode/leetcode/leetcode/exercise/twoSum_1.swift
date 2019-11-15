//
//  twoSum_1.swift
//  leetcode
//
//  Created by iMac on 2019/11/11.
//  Copyright © 2019 Ted. All rights reserved.
//

import Foundation

//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//
//你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
//
//示例:
//
//给定 nums = [2, 7, 11, 15], target = 9
//
//因为 nums[0] + nums[1] = 2 + 7 = 9
//所以返回 [0, 1]


class twoSum_1 {
    
    //比较粗暴的解法 直接遍历 效率低 时间复杂度 O(n²) 空间复杂度O(1)
    func twoSum(_ nums:[Int],_ target:Int) -> [Int] {
        
        var indexs = [Int]()
        
        var i = 0;
        while (i<nums.count) {
            
            var j = i+1
            while (j<nums.count) {
                if (nums[i] + nums[j] == target){
                    indexs.append(i)
                    indexs.append(j)
                    return indexs
                }
                j+=1
            }
            
            i+=1
        }
        
        return indexs
        
    }
    
    //该题的提示有使用hash表 时间复杂度 O(n) 空间复杂度O(n)
    func answer(_ nums:[Int],_ target:Int) -> [Int] {
        var map = [Int:Int]()
        var indexs = [Int]()
        
        for (index,value) in nums.enumerated() {

            //从字典查找是否有该key 如果有 说明这个数和之前存储的数之和为target 则保存此索引作为答案
            if let j = map[value]{
                indexs.append(j)
                indexs.append(index)
                return indexs
            }
            
            //用字典存储上一个数与target的差 作为key 索引保存为value
            map[target - value] = index
        }
        
        return indexs
    }
}
