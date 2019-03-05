//
//  TreeNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/6/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public class TreeNode<T> {
    public private(set) var value: T
    public private(set) var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(child: TreeNode) {
        children.append(child)
    }
    
    public func add(_ childs: [TreeNode]) {
        childs.forEach { children.append($0) }
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var describing = String(describing: value)
        var childs: [TreeNode] = children
        
        while childs.count != 0 {
            let childsDescription = nodesDescription(nodes: childs)
            
            describing += ("\n" + childsDescription)
            childs = childs.reduce([]) { $0 + $1.children }
        }
        
        return describing
    }
    
    private func nodesDescription(nodes: [TreeNode]) -> String {
        let description: [String] = nodes.map { String(describing: $0.value) }
        
        return description.joined(separator: " ")
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach { $0.forEachDepthFirst(visit: visit) }
    }
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = QueueStack<TreeNode>()
        
        children.forEach { queue.enqueue($0) }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        
        forEachLevelOrder { (node) in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
