//
//  twoSum_2.swift
//  leetcode
//
//  Created by Hydra on 2019/11/19.
//  Copyright © 2019 Ted. All rights reserved.
//

import Foundation

//给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//
//如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//
//您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
//示例：
//
//输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//输出：7 -> 0 -> 8
//原因：342 + 465 = 807


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//算法
//就像你在纸上计算两个数字的和那样，我们首先从最低有效位也就是列表 l1l1 和 l2l2 的表头开始相加。由于每位数字都应当处于 0 \ldots 90…9 的范围内，我们计算两个数字的和时可能会出现 “溢出”。例如，5 + 7 = 125+7=12。在这种情况下，我们会将当前位的数值设置为 22，并将进位 carry = 1carry=1 带入下一次迭代。进位 carrycarry 必定是 00 或 11，这是因为两个数字相加（考虑到进位）可能出现的最大和为 9 + 9 + 1 = 199+9+1=19。


//时间复杂度：O(\max(m, n))O(max(m,n))，假设 mm 和 nn 分别表示 l1l1 和 l2l2 的长度，上面的算法最多重复 \max(m, n)max(m,n) 次。
//
//空间复杂度：O(\max(m, n))O(max(m,n))， 新列表的长度最多为 \max(m,n) + 1max(m,n)+1。


class twoSum_2 {
    //自己的写法
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result : ListNode? = ListNode(0)
        var i = l1
        var j = l2
        var carry = 0
        
        while i != nil || j != nil {
            var x = 0
            if let _ = i {
                x = i!.val
            }
            
            var y = 0
            if let _ = j {
                y = j!.val
            }
            
            var sum : Int = x + y + carry

            if sum >= 10 {
                sum = sum % 10
                carry = 1
            }
            else{
                carry = 0
            }
            result!.val = sum
            
            result!.next = ListNode(carry)
            result = result!.next!
            
            if (i != nil){
                i = i?.next
            }
            
            if (j != nil){
                j = j?.next
            }
        }

        
        return result
    }
    
    //官方写法
    func standardAddTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead : ListNode? = ListNode(0)
        var p = l1
        var q = l2
        var curr = dummyHead
        var carry = 0
        
        while p != nil || p != nil {

            let x = (p != nil) ? p?.val : 0
            let y = (q != nil) ? q?.val : 0
            let sum = carry + x! + y!

            carry = sum / 10;
            curr?.next = ListNode(sum % 10)
            curr = curr?.next
            if p != nil {
                p = p?.next
            }
            
            if q != nil {
                q = q?.next
            }
        }

        if(carry > 0){
            curr?.next = ListNode(carry)
        }
        
        return dummyHead?.next
    }
}
