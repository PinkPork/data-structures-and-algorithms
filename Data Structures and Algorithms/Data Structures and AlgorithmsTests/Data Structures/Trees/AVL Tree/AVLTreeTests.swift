//
//  AVLTreeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 3/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
@testable import Data_Structures_and_Algorithms

class AVLTreeTests: XCTestCase {

    func testLeftRotate() {
        // Given
        let tree = AVLTree<String>()
        var root = AVLNode("x")

        root.leftChild = AVLNode("a")
        root.rightChild = AVLNode("y")
        root.rightChild?.leftChild = AVLNode("b")
        root.rightChild?.rightChild = AVLNode("z")
        root.rightChild?.rightChild?.leftChild = AVLNode("c")
        root.rightChild?.rightChild?.rightChild = AVLNode("d")
       
        // When
        root = tree.leftRotate(root)
        
        // Then
        XCTAssertEqual(root.value, "y")
        XCTAssertEqual(root.rightChild?.value, "z")
        XCTAssertEqual(root.leftChild?.value, "x")
        XCTAssertEqual(root.leftChild?.rightChild?.value, "b")
    }
    
    func testRightRotate() {
        // Given
        let tree = AVLTree<String>()
        var root = AVLNode("x")
        
        root.leftChild = AVLNode("y")
        root.rightChild = AVLNode("d")
        root.leftChild?.leftChild = AVLNode("z")
        root.leftChild?.rightChild = AVLNode("c")
        root.leftChild?.leftChild?.leftChild = AVLNode("a")
        root.leftChild?.leftChild?.rightChild = AVLNode("b")

        // When
        root = tree.rightRotate(root)
        
        // Then
        XCTAssertEqual(root.value, "y")
        XCTAssertEqual(root.rightChild?.value, "x")
        XCTAssertEqual(root.leftChild?.value, "z")
        XCTAssertEqual(root.rightChild?.leftChild?.value, "c")
    }
    
    func testRightLeftRotate() {
        // Given
        let tree = AVLTree<String>()
        let root = AVLNode("50")
        
        root.leftChild = AVLNode("25")
        root.rightChild = AVLNode("75")
        root.leftChild?.rightChild = AVLNode("37")
        root.leftChild?.rightChild?.leftChild = AVLNode("36")

        // When
        root.leftChild = tree.rightLeftRotate(root.leftChild!)
        
        // Then
        XCTAssertEqual(root.leftChild?.value, "36")
        XCTAssertEqual(root.leftChild?.rightChild?.value, "37")
        XCTAssertEqual(root.leftChild?.leftChild?.value, "25")
    }
    
    func testLeftRightRotate() {
        // Given
        let tree = AVLTree<String>()
        let root = AVLNode("50")
        
        root.leftChild = AVLNode("25")
        root.rightChild = AVLNode("75")
        root.leftChild?.leftChild = AVLNode("10")
        root.leftChild?.leftChild?.rightChild = AVLNode("15")
        
        // When
        root.leftChild = tree.leftRightRotate(root.leftChild!)
        
        // Then
        XCTAssertEqual(root.leftChild?.value, "15")
        XCTAssertEqual(root.leftChild?.rightChild?.value, "25")
        XCTAssertEqual(root.leftChild?.leftChild?.value, "10")
    }
    
    func testBalancedTree() {
        // Given
        var tree = AVLTree<Int>()
        
        // When
        tree.insert(15)
        tree.insert(10)
        tree.insert(16)
        tree.insert(18)
        
        // Then
        XCTAssertEqual(tree.root?.value, 15)
        XCTAssertEqual(tree.root?.leftChild?.value, 10)
        XCTAssertEqual(tree.root?.rightChild?.value, 16)
        XCTAssertEqual(tree.root?.rightChild?.rightChild?.value, 18)
        
        // When
        tree.remove(10)
        
        // Then
        XCTAssertEqual(tree.root?.value, 16)
        XCTAssertEqual(tree.root?.leftChild?.value, 15)
        XCTAssertEqual(tree.root?.rightChild?.value, 18)
    }
    
}
