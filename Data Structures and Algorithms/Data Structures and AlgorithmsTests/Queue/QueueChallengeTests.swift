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
    
    func testChallenge3() {
        // Given
        let totalPlayers = ["Hugo", "Jaime", "Lucho", "Jose", "Santi"]
        var queue = QueueRingBuffer<String>(size: totalPlayers.count)
        totalPlayers.forEach({ queue.enqueue($0) })
        
        // When
        let player0 = queue.nextPlayer()
        let player1 = queue.nextPlayer()
        let player2 = queue.nextPlayer()
        let player3 = queue.nextPlayer()
        let player4 = queue.nextPlayer()
        
        // Then
        XCTAssertEqual(player0, totalPlayers[0])
        XCTAssertEqual(player1, totalPlayers[1])
        XCTAssertEqual(player2, totalPlayers[2])
        XCTAssertEqual(player3, totalPlayers[3])
        XCTAssertEqual(player4, totalPlayers[4])
        
        XCTAssertFalse(queue.isEmpty)
        
        XCTAssertEqual(player0, totalPlayers[0])
    }
    
    func testChallenge4() {
        // Given
        let elements = ["1", "21", "18", "42"]
        let queue = QueueArray(elements)
        
        // When
        var reversedQueue = queue.reversed()
        
        // Then
        for element in elements.reversed() {
            XCTAssertEqual(element, reversedQueue.dequeue())
        }
        
    }
}

// MARK: - Challenge 3 dependencies
fileprivate protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueRingBuffer: BoardGameManager {
    typealias Player = T
    
    mutating func nextPlayer() -> Player? {
        return nil
    }
}

// MARK: - Challenge 4 dependencies
extension QueueArray {
    func reversed() -> QueueArray {
        return self // return a copy of the reversed queue
    }
}
