//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value:Int
    var left: Node?
    var right: Node?
    
    init(left:Node?, value:Int, right:Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }

}


//       10
//      /  \
//     9    11        Valid Binary Tree
//    / \
//   3   12

//       10
//      /  \
//     9    11        Invalid Binary Tree
//    / \
//   3   8

// Valid Binary Tree
let elevenNode = Node(left:nil, value:11, right:nil)
let threeNode = Node(left:nil, value:3, right:nil)
let twelveNode = Node(left:nil, value:12, right:nil)
let eightNode = Node(left:nil, value:8, right:nil)
let nineNode = Node(left:threeNode, value:9, right:twelveNode)
let tree = Node(left:nineNode, value:10, right:elevenNode)

// Invalid Binary Tree
//let elevenNode = Node(left:nil, value:11, right:nil)
//let threeNode = Node(left:nil, value:3, right:nil)
//let twelveNode = Node(left:nil, value:12, right:nil)
//let eightNode = Node(left:nil, value:8, right:nil)
//let nineNode = Node(left:threeNode, value:9, right:eightNode)
//let tree = Node(left:nineNode, value:10, right:elevenNode)

class Solution {
    func isValidBinaryTree (_ tree:Node?) -> Bool {
        print((tree?.value)!)
        if !(tree?.isLeaf)! {
            // Binary search trees only have 2 child nodes and left one always less than parent node's value and right one always greater then parent node's value
            if (tree?.value)! > (tree?.left?.value)! && (tree?.value)! < (tree?.right?.value)! {
                // Recursive call to iterate binary tree. Left and right side of binary tree iterates respectively.
                return isValidBinaryTree(tree?.left) && isValidBinaryTree(tree?.right)
            }else{
                return false
            }
        }
        return true
    }
}

let isValid = Solution().isValidBinaryTree(tree)
print(isValid ? "It is valid binary tree" : "It is invalid binary tree")




