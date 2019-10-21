//
//  RingBufferTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class RingBufferTests: XCTestCase {
    
    func testIsEmpty() {
        // Given
        let size =  5
        let buffer = RingBuffer<Int>(size: size)
        
        // Then
        XCTAssertTrue(buffer.isEmpty)
        XCTAssertFalse(buffer.isFull)
    }
    
    func testReadUntilEmpty() {
        // Given
        let size =  5
        var buffer = RingBuffer<Int>(size: size)
        
        // When
        (0...size).forEach { buffer.write($0) }
        (0...size).forEach { _ in buffer.read() }
        
        // Then
        XCTAssertTrue(buffer.isEmpty)
        XCTAssertFalse(buffer.isFull)
    }
    
    func testIsFull() {
        // Given
        let size =  5
        var buffer = RingBuffer<Int>(size: size)
        
        // When
        (0...size).forEach { buffer.write($0) }
        
        // Then
        XCTAssertFalse(buffer.isEmpty)
        XCTAssertTrue(buffer.isFull)
    }
    
    func testWrireAfterFull() {
        // Given
        let size =  5
        var buffer = RingBuffer<Int>(size: size)
        
        // When
        (0...size).forEach { buffer.write($0) }
        
        // Then
        XCTAssertTrue(buffer.isFull)
        XCTAssertFalse(buffer.write(6))
    }

    func testWrite() {
        // Given
        let size =  5
        var buffer = RingBuffer<Int>(size: size)
        
        // When
        (0...size).forEach { buffer.write($0) }
        
        // Then
        XCTAssertFalse(buffer.write(-1))
        XCTAssertEqual(buffer.read(), 0)
    }
    
    func testRead() {
        // Given
        let size = 2
        var buffer = RingBuffer<Int>(size: size)
        
        // When
        buffer.write(0)
        buffer.write(1)
        
        // Then
        XCTAssertEqual(buffer.first, 0)
        XCTAssertEqual(buffer.read(), 0)
        XCTAssertEqual(buffer.first, 1)
        XCTAssertEqual(buffer.read(), 1)
        XCTAssertNil(buffer.first)
        XCTAssertNil(buffer.read())
    }

}
