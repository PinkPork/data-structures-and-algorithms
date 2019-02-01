//
//  LinkedListChallengeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/1/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

extension LinkedList {
    func reversedDescription() -> String {
        return self.description
    }
    func reversed() -> LinkedList<Value> {
        return self
    }
    func middle() -> Node<Value>? {
        return head
    }
    func remove(value: Value) {
        
    }
}

class LinkedListChallengeTests: XCTestCase {

    // Create a function that prints out the elements of a linked list in reverse order
    func testChallenge1() {
        // Given
        var list = LinkedList<Int>()
        (1...3).forEach { list.append($0) }
        
        // When
        let reversedDescription = list.reversedDescription()
        
        // Then
        XCTAssertEqual(reversedDescription,
                       "3 -> 2 -> 1 -> nil")
    }
    
    // Create a function that returns the middle node of a linked list
    func testChallenge2() {
        // Given
        var list = LinkedList<Int>()
        (1...3).forEach { list.append($0) }
        
        // When
        let middleNode = list.middle()
        
        // Then
        XCTAssertEqual(middleNode?.value,
                       2)
    }
    
    // Create a function that reverses a linked list
    func testChallenge3() {
        // Given
        var list = LinkedList<Int>()
        (1...3).forEach { list.append($0) }
        
        // When
        let reverseList = list.reversed()
        
        // Then
        XCTAssertEqual(reverseList.description,
                       "3 -> 2 -> 1 -> nil")
    }
    
    // Create a function that takes two sorted linked lists and merges them into a single sorted linked list
    func testChallenge4() {
        // Given
        var list1 = LinkedList<Int>()
        [1,4,5].forEach { list1.append($0) }
        var list2 = LinkedList<Int>()
        [2,3].forEach { list2.append($0) }
        
        // When
        let list = merge(lhs: list1, rhs: list2)
        
        // Then
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 5)
        XCTAssertEqual(list.description,
                       "1 -> 2 -> 3 -> 4 -> 5 -> nil")
    }
    
    // Create a function that removes all occurrences of a specific element from a linked list
    func testChallenge5() {
        // Given
        var list = LinkedList<Int>()
        [1,5,2,5,3,5,4,5].forEach { list.append($0) }
        
        // When
        list.remove(value: 5)
        
        // Then
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 4)
        XCTAssertEqual(list.description,
                       "1 -> 2 -> 3 -> 4 -> nil")
    }

    private func merge<Value>(lhs: LinkedList<Value>, rhs: LinkedList<Value>) -> LinkedList<Value> {
        return lhs
    }
}
