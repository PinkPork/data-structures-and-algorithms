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
        return [nil]
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

}
