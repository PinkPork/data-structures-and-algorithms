//
//  AVLNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 3/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public class AVLNode<Element>: Node<Element> {
    public enum BlanceFactor: Int {
        case leftChildHeavier = 2
        case rightChildHeavier = -2
        case negative = -1
        case positive = 1
        case balanced = 0
    }
    
    public var leftChild: AVLNode?
    public var rightChild: AVLNode?
    public var leftHeight: Int { return leftChild?.height ?? -1 }
    public var rightHeight: Int { return rightChild?.height ?? -1 }
    public var balanceFactor: BlanceFactor { return BlanceFactor(rawValue: leftHeight - rightHeight) ??  .balanced }
    public var min: AVLNode { return leftChild?.min ?? self }
    public var height: Int = 0
    
    public init(_ value: Element) {
        super.init(value: value)
    }
}

extension AVLNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: AVLNode?,
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
