//
//  BinaryNodeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class BinaryNodeTests: XCTestCase {

    func testBuildTree() {
        // Given
        let tree = BinaryNode(value: 7,
                              left: 1,
                              right: 9)
        tree.leftChild? = BinaryNode(value: 1,
                                    left: 0,
                                    right: 5)
        tree.rightChild?.leftChild = BinaryNode(8)
        
        XCTAssertEqual(tree.description,
        """
 ┌── nil
┌── 9
│ └── 8
7
│ ┌── 5
└── 1
 └── 0

""")
    }
    
    func testInOrderTransversal() {
        // Given
        let tree = BinaryNode(value: 3,
                              left: 3,
                              right: 5)
        tree.leftChild? = BinaryNode(value: 1,
                                     left: 0,
                                     right: 2)
        tree.rightChild?.leftChild = BinaryNode(4)
        
        // When
        var inOrder = [Int]()
        tree.traverseInOrder(visit: { inOrder.append($0) })
        
        // Then
        XCTAssertEqual(inOrder, [0,1,2,3,4,5])
    }
    
    func testPreOrderTransversal() {
        // Given
        let tree = BinaryNode(value: 0,
                              left: 1,
                              right: 4)
        tree.leftChild? = BinaryNode(value: 1,
                                     left: 2,
                                     right: 3)
        tree.rightChild?.leftChild = BinaryNode(5)
        
        // When
        var inOrder = [Int]()
        tree.traversePreOrder(visit: { inOrder.append($0) })
        
        // Then
        XCTAssertEqual(inOrder, [0,1,2,3,4,5])
    }
    
    func testPostOrderTransversal() {
        // Given
        let tree = BinaryNode(value: 5,
                              left: 2,
                              right: 4)
        tree.leftChild? = BinaryNode(value: 2,
                                     left: 0,
                                     right: 1)
        tree.rightChild?.leftChild = BinaryNode(3)
        
        // When
        var inOrder = [Int]()
        tree.traversePostOrder(visit: { inOrder.append($0) })
        
        // Then
        XCTAssertEqual(inOrder, [0,1,2,3,4,5])
    }
}
