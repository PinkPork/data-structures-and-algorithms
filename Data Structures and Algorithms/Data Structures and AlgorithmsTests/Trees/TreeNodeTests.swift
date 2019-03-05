//
//  TreeNodeTests.swift
//  Data Structures and AlgorithmsTests
//
//  Created by Jaime Andres Laino Guerra on 2/6/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import XCTest
import Data_Structures_and_Algorithms

class TreeNodeTests: XCTestCase {
    
    func testAdd() {
        // Given
        let parentNode = TreeNode("Parent")
        
        // When
        let child1 = TreeNode("child1")
        let child2 = TreeNode("child2")
        parentNode.add(child: child1)
        parentNode.add(child: child2)
        
        // Then
        XCTAssertEqual("child1", parentNode.children.first?.value)
        XCTAssertEqual("child2", parentNode.children.last?.value)
    }
    
    func testDepthFirst() {
        // Given
        let (parentNode, orderedValues, _) = buildBeverageTree()
        
        // When
        var depthOrderValues = [String]()
        parentNode.forEachDepthFirst { (node) in
            depthOrderValues.append(node.value)
        }
        
        // Then
        XCTAssertEqual(depthOrderValues, orderedValues)
    }
    
    func testLevelOrder() {
        // Given
        let (parentNode, _, orderedValues) = buildBeverageTree()
        
        // When
        var levelOrderValues = [String]()
        parentNode.forEachLevelOrder { (node) in
            levelOrderValues.append(node.value)
        }
        
        // Then
        XCTAssertEqual(levelOrderValues, orderedValues)
    }
    
    func testSearch() {
        // Given
        let (parentNode, _, _) = buildBeverageTree()
        let valueToSearch = "cold"
        
        // When
        let result = parentNode.search(valueToSearch)
        let invalidResult = parentNode.search("NOT FOUND")
        
        // Then
        XCTAssertNil(invalidResult)
        XCTAssertEqual(result?.value, valueToSearch)
    }
    
    func testDescription() {
        // Given
        let tree = TreeNode(15)
        let branch1 = TreeNode(1)
        let branch2 = TreeNode(17)
        let branch3 = TreeNode(20)
        
        // When
        tree.add([branch1, branch2, branch3])
        branch1.add([TreeNode(1), TreeNode(5), TreeNode(0)])
        branch2.add([TreeNode(2)])
        branch3.add([TreeNode(5), TreeNode(7)])
        
        // Then
        XCTAssertEqual(tree.description,
                       """
15
1 17 20
1 5 0 2 5 7
""")
    }
}

extension TreeNodeTests {
    func buildBeverageTree() -> (TreeNode<String>, [String], [String]) {
        let tree = TreeNode("Beverages")
        let hot = TreeNode("hot")
        let cold = TreeNode("cold")
        let tea = TreeNode("tea")
        let coffee = TreeNode("coffee")
        let cocoa = TreeNode("cocoa")
        let blackTea = TreeNode("blackTea")
        let greenTea = TreeNode("greenTea")
        let chaiTea = TreeNode("chaiTea")
        let gingerale = TreeNode("gingerale")
        let bitterLemon = TreeNode("bitterLemon")
        let soda = TreeNode("soda")
        let milk = TreeNode("milk")
        let depthOrderArray =
            [tree,
             hot,
             tea,
             blackTea, greenTea, chaiTea,
             coffee, cocoa,
             cold,
             soda,
             gingerale, bitterLemon,
             milk]
        let levelOrderArray =
            [tree,
             hot, cold,
             tea, coffee, cocoa, soda, milk,
             blackTea, greenTea, chaiTea, gingerale, bitterLemon]
        
        tree.add([hot, cold])
        hot.add([tea, coffee, cocoa])
        cold.add([soda, milk])
        tea.add([blackTea, greenTea, chaiTea])
        soda.add([gingerale, bitterLemon])
        
        return (tree,
                depthOrderArray.map({ $0.value }),
                levelOrderArray.map({ $0.value }))
    }
}
