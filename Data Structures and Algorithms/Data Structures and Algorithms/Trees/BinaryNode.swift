//
//  BinaryNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public protocol BinaryNodeProtocol: NodeProtocol {
    var leftChild: Self? { get }
    var rightChild: Self? { get }
}

public final class BinaryNode<Element>: Node<Element> {
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    public var height: Int { return count(node: self) }
    
    public init(_ value: Element) {
        super.init(value: value)
    }
    
    public init(value: Element, left: Element, right: Element) {
        super.init(value: value)
        self.leftChild = BinaryNode(left)
        self.rightChild = BinaryNode(right)
    }
}

extension BinaryNode: DiagramableBinaryNode {}
extension BinaryNode: TraversableBinaryNode {}
extension BinaryNode: CustomStringConvertible {}

extension BinaryNode {
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
