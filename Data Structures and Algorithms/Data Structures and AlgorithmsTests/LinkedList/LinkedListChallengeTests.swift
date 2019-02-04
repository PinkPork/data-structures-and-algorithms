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
        let reversedValues: [Value] = reversed()
        let description = reversedValues.reduce("") { (result, value) in
            return result + "\(value) -> "
        }
        return description + "nil"
    }
    
    func middle() -> Node<Value>? {
        let middle = count / 2
        return node(at: middle)
    }
    
    func reversed() -> LinkedList<Value> {
        let reversedValues: [Value] = reversed()
        return LinkedList<Value>.init(array: reversedValues)
    }
}

extension LinkedList where Value: Comparable {
    //Assume both list passed are sorted
    static func mergeSortedList(lhs: LinkedList<Value>,
                                rhs: LinkedList<Value>) -> LinkedList<Value> {
        var list = LinkedList<Value>()
        var lhsNode: Node<Value>? = lhs.head
        var rhsNode: Node<Value>? = rhs.head
        
        while lhsNode != nil || rhsNode != nil {
            switch (lhsNode?.value, rhsNode?.value) {
            case let (lhsValue?, rhsValue?):
                if lhsValue < rhsValue {
                    list.append(lhsValue)
                    lhsNode = lhsNode?.next
                } else {
                    list.append(rhsValue)
                    rhsNode = rhsNode?.next
                }
                break
            case let (nil, rhsValue?):
                list.append(rhsValue)
                rhsNode = rhsNode?.next
            case let (lhsValue?, nil):
                list.append(lhsValue)
                lhsNode = lhsNode?.next
            case (nil, nil):
                break
            }
        }
        
        return list
    }
}

extension LinkedList where Value: Equatable {
    mutating func remove(value: Value) {
        var prev: Node<Value>? = head
        var current: Node<Value>? = head?.next
        
        while current != nil {
            if current?.value == value {
                if current === tail {
                    tail = prev
                }
                
                current = current?.next
                prev?.next = current
            } else {
                prev = current
                current = current?.next
            }
        }
        
        if head?.value == value {
            pop()
        }
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
        let list1: LinkedList<Int> =  [1,4,5]
        let list2: LinkedList<Int> = [2,3]
        
        // When
        let list = LinkedList<Int>.mergeSortedList(lhs: list1, rhs: list2)
        
        // Then
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 5)
        XCTAssertEqual(list.description,
                       "1 -> 2 -> 3 -> 4 -> 5 -> nil")
    }
    
    // Create a function that removes all occurrences of a specific element from a linked list
    func testChallenge5() {
        // Given
        var list: LinkedList<Int> = [5,5,1,5,2,5,3,5,4,5]
        
        // When
        list.remove(value: 5)
        
        // Then
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 4)
        XCTAssertEqual(list.description,
                       "1 -> 2 -> 3 -> 4 -> nil")
    }
}
