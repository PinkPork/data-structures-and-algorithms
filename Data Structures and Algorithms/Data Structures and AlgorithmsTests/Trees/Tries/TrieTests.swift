//
//  TrieTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by jaime Laino Guerra on 10/20/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
@testable import Data_Structures_and_Algorithms

class TrieTests: XCTestCase {
    typealias TrieString = Trie<String>
    
    var sut: TrieString!
    let expectedCollection = "JAIME"
    var firstNode: TrieString.Node? {
        let firstElement = expectedCollection.first!
        return sut.root.children[firstElement]
    }
    var endNode: TrieString.Node? {
        var current: TrieString.Node? = sut.root
        for element in expectedCollection {
            current = current?.children[element]
        }
        return current
    }
    
    override func setUp() {
        sut = Trie<String>()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testInit() {
        // Then
        XCTAssertNil(sut.root.key)
        XCTAssertNil(sut.root.parent)
        XCTAssertFalse(sut.root.isTerminating)
    }
    
    func testInsertKey() {
        // When
        sut.insert(expectedCollection)
        
        // Then
        XCTAssertNotNil(endNode)
        XCTAssertTrue(endNode?.isTerminating ?? false)
        XCTAssertEqual(endNode?.key, expectedCollection.last)
        XCTAssertEqual(sut.root, firstNode?.parent)
        XCTAssertFalse(firstNode?.isTerminating ?? true)
    }
    
    func testContains() {
        // When
        sut.insert(expectedCollection)
        
        // Then
        XCTAssertFalse(sut.contains("JAI"))
        XCTAssertTrue(sut.contains(expectedCollection))
    }
    
    func testRemove() {
        // Given
        sut.insert(expectedCollection)
        
        // When
        sut.remove("JAIN")
        // Then
        XCTAssertTrue(sut.contains(expectedCollection))
        
        // When
        sut.remove(expectedCollection)
        // Then
        XCTAssertFalse(sut.contains(expectedCollection))
        XCTAssertNil(endNode)
    }
    
    func testRemoveExtraCases() {
        // Given
        sut.insert("cut")
        sut.insert("cute")
        
        XCTAssertTrue(sut.contains("cut"))
        XCTAssertTrue(sut.contains("cute"))
        
        // When
        sut.remove("cut")
        
        // Then
        XCTAssertFalse(sut.contains("cut"))
        XCTAssertTrue(sut.contains("cute"))
    }
    
    func testPrefixMatch() {
        // Given
        let expected = ["car", "card", "care", "cared", "carbs"]
        expected.forEach(sut.insert)
        
        // When
        let results = sut.collections(startingWith: expected.first!)
        
        // Then
        XCTAssertEqual(Set(results), Set(expected))
    }
    
    func testCount() {
        // Given
        let expectedCount = 5
        (0..<expectedCount)
            .map(String.init)
            .forEach(sut.insert)
        
        // Then
        XCTAssertEqual(sut.count, expectedCount)
        
        // When
        sut.remove("1")
        sut.remove("4")
        
        // Then
        XCTAssertEqual(sut.count, expectedCount - 2)
    }
    
    func testEmpty() {
        // Given
        XCTAssertTrue(sut.isEmpty)
        // When
        sut.insert("some")
        // Then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func testCollections() {
        // Given
        let expected = ["car", "card", "care", "cared", "carbs"]
        expected.forEach(sut.insert)
        
        // When
        let collections = sut.collections
        
        // Then
        XCTAssertEqual(collections, Set(expected))
    }
    
}
