//
//  BinarySearchTreeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/15/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class BinarySearchTreeTests: XCTestCase {

    func testEmptyTreeDescription() {
        // Given
        let tree = BinarySearchTree<Int>()
        
        // Then
        XCTAssertEqual(tree.description, "empty tree")
    }
    
    func testInsert() {
        // Given
        var tree = BinarySearchTree<Int>()
        
        // When
        tree.insert(3)
        tree.insert(4)
        tree.insert(1)
        
        // Then
        XCTAssertEqual(tree.root?.value, 3)
        XCTAssertEqual(tree.root?.rightChild?.value, 4)
        XCTAssertEqual(tree.root?.leftChild?.value, 1)
    }
    
    func testContains() {
        // Given
        var tree = BinarySearchTree<Int>()
        
        // When
        tree.insert(3)
        tree.insert(4)
        tree.insert(1)
        tree.insert(7)
        tree.insert(0)
        
        // Then
        XCTAssertTrue(tree.contains(4))
        XCTAssertTrue(tree.contains(0))
        XCTAssertTrue(tree.contains(7))
        XCTAssertFalse(tree.contains(11))
    }
    
    func testRemoveLeafNode() {
        // Given
        var tree = BinarySearchTree<Int>()
        tree.insert(3)
        tree.insert(4)
        tree.insert(1)
        tree.insert(5)
        tree.insert(0)
        tree.insert(2)
        
        // When
        tree.remove(2)
        
        // Then
        XCTAssertEqual(tree.root?.value, 3)
        XCTAssertEqual(tree.root?.rightChild?.value, 4)
        XCTAssertEqual(tree.root?.leftChild?.value, 1)
        XCTAssertEqual(tree.root?.leftChild?.leftChild?.value, 0)
        XCTAssertNil(tree.root?.leftChild?.rightChild?.value)
    }
    
    func testRemoveNodeWithOneChild() {
        // Given
        var tree = BinarySearchTree<Int>()
        tree.insert(3)
        tree.insert(4)
        tree.insert(1)
        tree.insert(5)
        tree.insert(0)
        tree.insert(2)
        
        // When
        tree.remove(5)
        
        // Then
        XCTAssertEqual(tree.root?.value, 3)
        XCTAssertEqual(tree.root?.rightChild?.value, 4)
        XCTAssertEqual(tree.root?.leftChild?.value, 1)
    }
    
    func testRemoveNodeWithTwoChildren() {
        // Given
        var tree = BinarySearchTree<Int>()
        tree.insert(7)
        tree.insert(8)
        tree.insert(3)
        tree.insert(5)
        tree.insert(4)
        tree.insert(2)
        tree.insert(1)
        tree.insert(0)
        
        // When
        tree.remove(3)
        let removedNode = tree.root?.leftChild
        
        // Then
        XCTAssertEqual(tree.root?.value, 7)
        XCTAssertEqual(tree.root?.rightChild?.value, 8)
        XCTAssertEqual(removedNode?.value, 4)
        XCTAssertEqual(removedNode?.rightChild?.value, 5)
        XCTAssertNil(removedNode?.rightChild?.leftChild?.value)
    }

}
