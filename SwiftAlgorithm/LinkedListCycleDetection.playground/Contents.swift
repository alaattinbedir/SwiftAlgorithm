//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value:Int
    var next:Node?
    
    init(_ value:Int) {
        self.value = value
        self.next = nil
    }
}

class Solution {
    var nodes: [Node?] = []

    func contains(_ node:Node?) -> Bool {
        for item in nodes {
            if node?.value == item?.value {
                return true
            }
        }
        return false
    }
    
    func detectCycle(head: Node?) -> Bool
    {
        var currentNode: Node? = head
        
        while (head != nil)
        {
            // if we already have the node in array it means there is a cycle
            if  self.contains(currentNode!) {
                return true
            }
            
            // if we encounter the node for the first time, insert it to array
            nodes.append(currentNode!);
            
            // set current node to next node to iterate linked list
            currentNode = currentNode!.next!;
        }
        
        return false;
    }
    
}

// head  ->  node  ->  node
//   1         2   <-   3

// build linked list from nodes
var head: Node = Node(1)
var nodeTwo: Node = Node(2)
var nodeThree: Node = Node(3)
head.next = nodeTwo
nodeTwo.next = nodeThree
nodeThree.next = nodeTwo

let hasCycle = Solution().detectCycle(head: head)

print(hasCycle ? "LinkedList has cycle" : "LinkedList has not cycle")



