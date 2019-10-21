//
//  StackTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/2/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class StackTests: XCTestCase {
    
    func  testEmpty() {
        var stack = Stack<Int>()
        
        XCTAssertTrue(stack.isEmpty)
        XCTAssertEqual(stack.count, 0)
        XCTAssertEqual(stack.top, nil)
        XCTAssertNil(stack.pop())
    }

    func testPush() {
        // Given
        var stack: Stack = [1,2,3,4,5]
        
        // When
        let element = 6
        stack.push(element)
        
        // Then
        XCTAssertEqual(stack.top, element)
    }
    
    func testPop() {
        var stack: Stack = [1,2,3,4,5]
        
        // When
        let element = stack.pop()
        
        // Then
        XCTAssertEqual(element, 5)
        XCTAssertEqual(stack.pop(), 4)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertNil(stack.pop())
    }

}
