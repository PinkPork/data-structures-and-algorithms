//
//  TraversableBinaryNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 5/12/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public protocol TraversableBinaryNode: BinaryNodeProtocol {
    func traverseInOrder(visit: (Element) -> Void)
    func traversePreOrder(visit: (Element) -> Void)
    func traversePostOrder(visit: (Element) -> Void)
}

public extension TraversableBinaryNode {
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}
