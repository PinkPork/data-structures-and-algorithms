//
//  AVLTreeChallengeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 5/12/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class AVLTreeChallengeTests: XCTestCase {

    //Challenge 1
    //How many leaf nodes are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height h?
    func testLeafNodesForPerfectBalanceTree() {
        //A perfectly balanced tree is a tree where all the leaves are in the same level, and that level is completely filled
        var tree = AVLTree<Int>()
        
        // When
        (0...14).forEach {
            tree.insert($0)
        }
        
        let numberOfLeafs = leafNodes(inTreeOfHeight: 3)
        
        // Then
        XCTAssertEqual(tree.root?.height, 3)
        XCTAssertEqual(tree.numberOfLeafs(), numberOfLeafs)
    }
    
    func leafNodes(inTreeOfHeight height: Int) -> Int {
        return Int(powf(2, Float(height)))
    }
    
    //Challenge 2
    //How many nodes are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height h?
    func testNumberOfNodesForPerfectBalanceTree() {
        //A perfectly balanced tree is a tree where all the leaves are in the same level, and that level is completely filled
        let height = 3
        let expectedNodes = 15
        
        // When
        let count = nodes(inTreeOfHeight: height)
        
        // Then
        XCTAssertEqual(expectedNodes, count)
    }
    
    func nodes(inTreeOfHeight height: Int) -> Int {
//        var count = 0
//        
//        (0...height).forEach { height in
//            count = count + leafNodes(inTreeOfHeight: height)
//        }
//        return count
        return leafNodes(inTreeOfHeight: height + 1) - 1
    }
    
    //Challenge 3
    //Create a TraversableBinaryNode protocol that provides a default implementation of the traversal methods so that conforming types get these methods for free. Have AVLNode conform to this.

}

extension AVLTree {
    func numberOfLeafs() -> Int {
        var count = 0
        
        root?.traverseInOrder(visit: { (node) in
            count = count + (node.isLeaf ? 1 : 0)
        })
        return count
    }
}

extension AVLNode {
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
    
    func traverseInOrder(visit: (AVLNode<Element>) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(self)
        rightChild?.traverseInOrder(visit: visit)
    }
}
