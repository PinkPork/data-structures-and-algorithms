//
//  QueueTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class QueueTests: XCTestCase {
   
    func testIsEmpty() {
        // Given
        let queue = QueueStack<Int>()
        
        // Then
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.front, nil)
    }
    
    func testDequeueUntilEmpty() {
        // Given
        var queue = QueueStack<Int>()

        // When
        queue.enqueue(10)
        queue.dequeue()
        
        // Then
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.dequeue())
    }

    func testDequeue() {
        // Given
        var queue = QueueStack<Int>()
        
        // When
        queue.enqueue(10)
        let value = queue.dequeue()
        
        // Then
        XCTAssertEqual(value, 10)
        XCTAssertTrue(queue.isEmpty)
    }
    
    func testEnqueue() {
        // Given
        var queue = QueueStack<Int>()
        
        // When
        queue.enqueue(10)
        queue.enqueue(11)
        queue.enqueue(12)
        
        // Then
        XCTAssertEqual(queue.front, 10)
        XCTAssertFalse(queue.isEmpty)
    }
    
    func testFront() {
        // Given
        var queue = QueueStack<Int>()
        
        // When
        queue.enqueue(10)
        queue.enqueue(11)
        
        // Then
        XCTAssertEqual(queue.front, 10)
        
        // When
        queue.dequeue()
        
        // Then
        XCTAssertEqual(queue.front, 11)
        XCTAssertFalse(queue.isEmpty)
    }
    
}
