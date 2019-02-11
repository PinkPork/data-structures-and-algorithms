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
        //Given
        var list: LinkedList<Int> =  [1,2,3,4,5]
        var stack = Stack<Int>()
        
        //When
        while !list.isEmpty {
            stack.push(list.pop()!)
        }
        
        //Then
        XCTAssertEqual(stack.pop(), 5)
        XCTAssertEqual(stack.pop(), 4)
        XCTAssertEqual(stack.pop(), 3)
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
        var balanced = true
        var stack = Stack<Character>()
        
        for symbol in string {
            switch symbol {
            case "{","[","(" :
                stack.push(symbol)
            case "}", "]",")" :
                guard let lastOpenSymbol = stack.pop() else {
                    return false
                }
                
                var openSymbol : Character = "{"
                if symbol == "]" {
                    openSymbol = "["
                } else if symbol == ")" {
                    openSymbol = "("
                }
                
                balanced = lastOpenSymbol == openSymbol
            default:
                break
            }
            
            if !balanced {
                break
            }
        }
        
        return balanced && stack.isEmpty
    }
}
