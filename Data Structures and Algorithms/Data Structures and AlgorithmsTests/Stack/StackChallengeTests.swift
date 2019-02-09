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
        var list = LinkedList(arrayLiteral: 1,2,3,4,5,6,7,8,9,10)
        var stack = Stack<Int>()
        
        while let value = list.pop() {
            stack.push(value)
        }
        
        while let value = stack.pop() {
            print(value)
        }
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
        var stack = Stack<Character>()
        for character in string {
            if character == ")" {
                if stack.isEmpty {
                    return false
                } else {
                    stack.pop()
                }
            } else if character == "(" {
                stack.push(character)
            }
        }
        
        return stack.isEmpty
    }
}
