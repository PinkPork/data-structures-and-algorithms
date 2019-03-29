//
//  AVLNodeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 3/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class AVLNodeTests: XCTestCase {
    func height<T>(node: AVLNode<T>?) -> Int {
        guard let node = node else { return 0 }
        
        if node.leftChild == nil && node.rightChild == nil {
            return 0
        }
        
        var leftCount = 0
        var rightCount = 0
        
        leftCount = height(node: node.leftChild)
        rightCount = height(node: node.rightChild)
        
        return 1 + max(leftCount, rightCount)
    }

    func testBalanceFactor() {
        // Given
        let root = AVLNode(50)
        let rightChild = AVLNode(75)
        let leftChild = AVLNode(25)
        let leftRightChild = AVLNode(37)
        
        root.leftChild = leftChild
        root.rightChild = rightChild
        root.leftChild?.rightChild = leftRightChild
        
        // When
        root.height = height(node: root)
        leftChild.height = height(node: leftChild)
        rightChild.height = height(node: rightChild)
        leftRightChild.height = height(node: leftRightChild)
        
        // Then
        XCTAssertEqual(root.height, 2)
        XCTAssertEqual(root.balanceFactor, .positive)
        XCTAssertEqual(leftChild.height, 1)
        XCTAssertEqual(leftChild.balanceFactor, .negative)
        XCTAssertEqual(rightChild.height, 0)
        XCTAssertEqual(rightChild.balanceFactor, .balanced)
        XCTAssertEqual(leftRightChild.height, 0)
        XCTAssertEqual(leftRightChild.balanceFactor, .balanced)
    }
    
    func testBalanceFactorLeftHeavierPositive() {
        // Given
        let root = AVLNode(10)
        
        root.leftChild = AVLNode(5)
        root.leftChild?.leftChild = AVLNode(2)
        
        // When
        root.height = height(node: root)
        root.leftChild?.height = height(node: root.leftChild)
        root.leftChild?.leftChild?.height = height(node: root.leftChild?.leftChild)
        
        // Then
        XCTAssertEqual(root.height, 2)
        XCTAssertEqual(root.balanceFactor, .leftChildHeavier)
        XCTAssertEqual(root.leftChild?.height, 1)
        XCTAssertEqual(root.leftChild?.balanceFactor, .positive)
        XCTAssertEqual(root.leftChild?.leftChild?.height, 0)
        XCTAssertEqual(root.leftChild?.leftChild?.balanceFactor, .balanced)
    }

    func testBalanceFactorLeftHeavierNegative() {
        // Given
        let root = AVLNode(10)
        
        root.leftChild = AVLNode(5)
        root.leftChild?.rightChild = AVLNode(7)
        
        // When
        root.height = height(node: root)
        root.leftChild?.height = height(node: root.leftChild)
        root.leftChild?.rightChild?.height = height(node: root.leftChild?.leftChild)
        
        // Then
        XCTAssertEqual(root.height, 2)
        XCTAssertEqual(root.balanceFactor, .leftChildHeavier)
        XCTAssertEqual(root.leftChild?.height, 1)
        XCTAssertEqual(root.leftChild?.balanceFactor, .negative)
        XCTAssertEqual(root.leftChild?.rightChild?.height, 0)
        XCTAssertEqual(root.leftChild?.rightChild?.balanceFactor, .balanced)
    }
    
    func testBalanceFactorRightHeavierNegative() {
        // Given
        let root = AVLNode(50)
        let rightHeavier = AVLNode(25)
        
        root.leftChild = rightHeavier
        root.rightChild = AVLNode(75)
        rightHeavier.rightChild = AVLNode(37)
        rightHeavier.rightChild?.rightChild = AVLNode(40)
        
        // When
        root.height = height(node: root)
        rightHeavier.height = height(node: rightHeavier)
        rightHeavier.rightChild?.height = height(node: rightHeavier.rightChild)
        rightHeavier.rightChild?.rightChild?.height = height(node: rightHeavier.rightChild?.rightChild)
        
        // Then
        XCTAssertEqual(root.height, 3)
        XCTAssertEqual(rightHeavier.height, 2)
        XCTAssertEqual(rightHeavier.balanceFactor, .rightChildHeavier)
        XCTAssertEqual(rightHeavier.rightChild?.height, 1)
        XCTAssertEqual(rightHeavier.rightChild?.balanceFactor, .negative)
        XCTAssertEqual(rightHeavier.rightChild?.rightChild?.height, 0)
        XCTAssertEqual(rightHeavier.rightChild?.rightChild?.balanceFactor, .balanced)
    }
    
    func testBalanceFactorRightHeavierPositive() {
        // Given
        let root = AVLNode(50)
        let rightHeavier = AVLNode(25)
        
        root.leftChild = rightHeavier
        root.rightChild = AVLNode(75)
        rightHeavier.rightChild = AVLNode(37)
        rightHeavier.rightChild?.leftChild = AVLNode(36)
        
        // When
        root.height = height(node: root)
        rightHeavier.height = height(node: rightHeavier)
        rightHeavier.rightChild?.height = height(node: rightHeavier.rightChild)
        rightHeavier.rightChild?.leftChild?.height = height(node: rightHeavier.rightChild?.leftChild)
        
        // Then
        XCTAssertEqual(root.height, 3)
        XCTAssertEqual(rightHeavier.height, 2)
        XCTAssertEqual(rightHeavier.balanceFactor, .rightChildHeavier)
        XCTAssertEqual(rightHeavier.rightChild?.height, 1)
        XCTAssertEqual(rightHeavier.rightChild?.balanceFactor, .positive)
        XCTAssertEqual(rightHeavier.rightChild?.leftChild?.height, 0)
        XCTAssertEqual(rightHeavier.rightChild?.leftChild?.balanceFactor, .balanced)
    }
}
