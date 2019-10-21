//
//  AVLNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 3/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public final class AVLNode<Element>: Node<Element> {
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
    public var balanceFactor: BlanceFactor { return BlanceFactor(rawValue: leftHeight - rightHeight) ?? .balanced }
    public var min: AVLNode { return leftChild?.min ?? self }
    public var height: Int = 0
    
    public init(_ value: Element) {
        super.init(value: value)
    }
}

extension AVLNode: DiagramableBinaryNode {}
extension AVLNode: TraversableBinaryNode {}
extension AVLNode: CustomStringConvertible {}
