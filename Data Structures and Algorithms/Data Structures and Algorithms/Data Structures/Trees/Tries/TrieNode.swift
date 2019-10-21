//
//  TrieNode.swift
//  Data Structures and Algorithms
//
//  Created by jaime Laino Guerra on 10/20/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public class TrieNode<Key: Hashable> {
    public var key: Key?
    public weak var parent: TrieNode?
    public var children: [Key: TrieNode] = [:]
    public var isTerminating = false
    
    init() {}
    
    public init(key: Key, parent: TrieNode) {
        self.key = key
        self.parent = parent
    }
}

extension TrieNode: Equatable {
    public static func == (lhs: TrieNode<Key>, rhs: TrieNode<Key>) -> Bool {
        return lhs.key == rhs.key
            && lhs.parent == rhs.parent
            && lhs.children == rhs.children
            && lhs.isTerminating == rhs.isTerminating
    }
}
