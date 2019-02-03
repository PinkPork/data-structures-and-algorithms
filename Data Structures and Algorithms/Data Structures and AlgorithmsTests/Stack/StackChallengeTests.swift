//
//  StackChallengeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/2/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class StackChallengeTests: XCTestCase {
    
    //Print a linked list in reverse without using recursion.
    //Given a linked list, print the nodes in reverse order.
    //You should not use recursion to solve this problem.
    func testChallenge1() {

    }
    
    // Challenge 2
    func testBalanceBrakets() {
        // Given
        let balancedString = "{{[[(())]]}}"
        let unbalanceString = "{[(])}"
        
        // Then
        XCTAssertTrue(isBalanced(balancedString))
        XCTAssertFalse(isBalanced(unbalanceString))
    }
    
}

private extension StackChallengeTests {
    func isBalanced(_ string : String) -> Bool {
        return true
    }
}
