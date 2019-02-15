//
//  BinaryNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    public var height: Int { return count(node: self) }
    
    public init(_ value: Element) {
        self.value = value
    }
    
    public init(value: Element, left: Element, right: Element) {
        self.value = value
        self.leftChild = BinaryNode(left)
        self.rightChild = BinaryNode(right)
    }
}

extension BinaryNode {
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    private func count(node: BinaryNode?) -> Int {
        guard let node = node else { return 0 }
        
        if node.leftChild == nil && node.rightChild == nil {
            return 0
        }
        
        var leftCount = 0
        var rightCount = 0
        
        leftCount = count(node: node.leftChild)
        rightCount = count(node: node.rightChild)
        
        return 1 + max(leftCount, rightCount)
    }
}

extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌── ", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild,
                      bottom + "│ ", bottom + "└── ", bottom + " ")
    }
}
