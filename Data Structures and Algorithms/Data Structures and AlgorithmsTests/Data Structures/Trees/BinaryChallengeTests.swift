//
//  BinaryChallengeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

extension BinaryNode {
    convenience init?(array: [Element?]) {
        guard let first = array.first,
            let value = first else {
            return nil
        }
        self.init(value)
    }
    
    func toArray() -> [Element?] {
        return [value]
    }
}

class BinaryChallengeTests: XCTestCase {

    // Challenge 1: Given a binary tree, find the height of the tree.
    func testBinaryTreeHeightSingleNode() {
        // Given
        let tree = BinaryNode(3)
        
        // Then
        XCTAssertEqual(tree.height, 0)
    }
    
    func testBinaryTreeHeightOneChild() {
        // Given
        let tree = BinaryNode(3)
        
        // When
        tree.rightChild = BinaryNode(6)
        
        // Then
        XCTAssertEqual(tree.height, 1)
    }
    
    func testBinaryTreeHeightTwoDeepChild() {
        // Given
        let tree = BinaryNode(3)
        
        // When
        tree.leftChild = BinaryNode(value: 1,
                                    left: 0,
                                    right: 2)
        // Then
        XCTAssertEqual(tree.height, 2)
    }
    
    func testBinaryTreeHeightThreeDeepChild() {
        // Given
        let tree = BinaryNode(3)
        
        // When
        tree.rightChild = BinaryNode(6)
        tree.rightChild?.leftChild = BinaryNode(4)
        tree.rightChild?.leftChild?.rightChild = BinaryNode(5)

        // Then
        XCTAssertEqual(tree.height, 3)
    }
    //
    
    // Challenge 2: serialization From and To Array
    func testBinaryTreeToArray() {
        // Given
        let tree = BinaryNode(3)
        
        // When
        let array = tree.toArray()
        
        // Then
        XCTAssertEqual(array,
                       [3])
    }
    
    func testBinaryTreeFromArray() {
        // Given
        let array: [Int?] = [3]
        
        // When
        guard let tree = BinaryNode(array: array) else {
            XCTFail()
            return
        }
        
        // Then
        XCTAssertEqual(tree.toArray(), array)
    }

    // Challenge 3: Given the root of a binary search tree with distinct values,
    // modify it so that every node has a new value equal to the sum of the values of the original tree that are greater than or equal to node.value.
    // https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
    func testGreaterSumTree() {
        // Given
        let tree = BinaryNode(value: 4,
                              left: 1,
                              right: 6)
        tree.leftChild?.leftChild = BinaryNode(0)
        tree.leftChild?.rightChild = BinaryNode(2)
        tree.leftChild?.rightChild?.rightChild = BinaryNode(3)
        tree.rightChild?.leftChild = BinaryNode(5)
        tree.rightChild?.rightChild = BinaryNode(7)
        tree.rightChild?.rightChild?.rightChild = BinaryNode(8)
        
        // When
        var lastValue = 0
        tree.traverseInReverseOrder { (node) in
            node.value = node.value + lastValue
            lastValue = node.value
        }
        
        // Then
        XCTAssertEqual(tree.description,
                       """
  ┌── 8
 ┌── 15
 │ └── nil
┌── 21
│ └── 26
30
│  ┌── 33
│ ┌── 35
│ │ └── nil
└── 36
 └── 36

""")
    }
}

extension BinaryNode {
    public func traverseInReverseOrder(visit: (BinaryNode<Element>) -> Void) {
        rightChild?.traverseInReverseOrder(visit: visit)
        visit(self)
        leftChild?.traverseInReverseOrder(visit: visit)
    }
}
