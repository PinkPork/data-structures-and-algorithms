//
//  QueueChallengeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Santiago Carmona gonzalez on 2/9/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class QueueChallengeTests: XCTestCase {

    func testChallenge1() {
        let elements = [1,2,3,4,5]
        
        var stack = Stack(elements)
        var queue = QueueArray(elements)
        
        // LIFO
        XCTAssertEqual(stack.pop(), elements.last)
        
        // FIFO
        XCTAssertEqual(queue.dequeue(), elements.first)
    }
    
    func testChallenge2QueueArray() {
        let elements = ["S", "W", "I", "F", "T"]
        var queueArray = QueueArray(elements)
        
        queueArray.enqueue("R")
        queueArray.enqueue("O")
        queueArray.dequeue()
        queueArray.enqueue("C")
        queueArray.dequeue()
        queueArray.dequeue()
        queueArray.enqueue("K")
        
        let queueArrayExpectation = QueueArray(["F", "T", "R", "O", "C", "K"])
        
        XCTAssertEqual(queueArray.description, queueArrayExpectation.description)
    }
    
    func testChallenge2QueueLinkedList() {
        let elements = ["S", "W", "I", "F", "T"]
        var queueLinkedList = QueueLinkedList(elements)
        
        queueLinkedList.enqueue("R")
        queueLinkedList.enqueue("O")
        queueLinkedList.dequeue()
        queueLinkedList.enqueue("C")
        queueLinkedList.dequeue()
        queueLinkedList.dequeue()
        queueLinkedList.enqueue("K")
        
        let queueLinkedListExpectation = QueueLinkedList(["F", "T", "R", "O", "C", "K"])
        
        XCTAssertEqual(queueLinkedList.description, queueLinkedListExpectation.description)
    }
    
    func testChallenge2QueueRingBuffer() {
        let elements = ["S", "W", "I", "F", "T"]
        var queueRingBuffer = QueueRingBuffer(elements: elements, size: 5)
        
        queueRingBuffer.enqueue("R")
        queueRingBuffer.enqueue("O")
        queueRingBuffer.dequeue()
        queueRingBuffer.enqueue("C")
        queueRingBuffer.dequeue()
        queueRingBuffer.dequeue()
        queueRingBuffer.enqueue("K")
        
        let queueRingBufferExpectation = QueueRingBuffer(elements: ["F", "T", "C", "K"], size: 5)
        
        XCTAssertEqual(queueRingBuffer.description, queueRingBufferExpectation.description)
    }
    
    func testChallenge2QueueStack() {
        let elements = ["S", "W", "I", "F", "T"]
        var queueStack = QueueStack(elements)
        
        queueStack.enqueue("R")
        queueStack.enqueue("O")
        queueStack.dequeue()
        queueStack.enqueue("C")
        queueStack.dequeue()
        queueStack.dequeue()
        queueStack.enqueue("K")
        
        let queueStackExpectation = QueueStack(["F", "T", "R", "O", "C", "K"])
        
        XCTAssertEqual(queueStack.description, queueStackExpectation.description)
    }
    
    func testChallenge3() {
        // Given
        let totalPlayers = ["Hugo", "Jaime", "Lucho", "Jose", "Santi"]
        var queueRingBuffer = QueueRingBuffer<String>(elements: totalPlayers, size: totalPlayers.count)
        
        // When
        let player0 = queueRingBuffer.nextPlayer()
        let player1 = queueRingBuffer.nextPlayer()
        let player2 = queueRingBuffer.nextPlayer()
        let player3 = queueRingBuffer.nextPlayer()
        let player4 = queueRingBuffer.nextPlayer()
        
        // Then
        XCTAssertEqual(player0, totalPlayers[0])
        XCTAssertEqual(player1, totalPlayers[1])
        XCTAssertEqual(player2, totalPlayers[2])
        XCTAssertEqual(player3, totalPlayers[3])
        XCTAssertEqual(player4, totalPlayers[4])
        
        XCTAssertFalse(queueRingBuffer.isEmpty)
        
        XCTAssertEqual(queueRingBuffer.nextPlayer(), totalPlayers[0])
    }
    
    func testChallenge4QueueArray() {
        // Given
        let elements = ["1", "21", "18", "42"]
        var queue = QueueArray(elements)
        
        // When
        var reversedQueue = queue.reversed()
        
        // Then
        for element in elements.reversed() {
            XCTAssertEqual(element, reversedQueue.dequeue())
        }
        
    }
    
    func testChallenge4QueueLinkedList() {
        // Given
        let elements = ["1", "21", "18", "42"]
        var queue = QueueLinkedList(elements)
        
        // When
        var reversedQueue = queue.reversed()
        
        // Then
        for element in elements.reversed() {
            XCTAssertEqual(element, reversedQueue.dequeue())
        }
    }
    
    func testChallenge4QueueRingBuffer() {
        // Given
        let elements = ["1", "21", "18", "42"]
        var queue = QueueRingBuffer(elements: elements, size: elements.count)
        
        // When
        var reversedQueue = queue.reversed(size: elements.count)
        
        // Then
        for element in elements.reversed() {
            XCTAssertEqual(element, reversedQueue.dequeue())
        }
    }
    
    func testChallenge4QueueStack() {
        // Given
        let elements = ["1", "21", "18", "42"]
        var queue = QueueStack(elements)
        
        // When
        var reversedQueue = queue.reversed()
        
        // Then
        for element in elements.reversed() {
            XCTAssertEqual(element, reversedQueue.dequeue())
        }
    }
}

// MARK: - Challenge 3 dependencies
protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueRingBuffer: BoardGameManager {
    typealias Player = T
    
    mutating func nextPlayer() -> Player? {
        guard let nextPlayer = dequeue() else {
            return nil
        }
        enqueue(nextPlayer)
        return nextPlayer
    }
}

