//
//  Trie.swift
//  Data Structures and Algorithms
//
//  Created by jaime Laino Guerra on 10/20/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public class Trie<T: Collection & Hashable> where T.Element: Hashable {
    let root = Node()
    
    public typealias Node = TrieNode<T.Element>
    public var collections: Set<T> = .init()
    public var count: Int { collections.count }
    public var isEmpty: Bool { collections.isEmpty }
    
    public init() {}
}

public extension Trie {
    func insert(_ collection: T) {
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        
        current.isTerminating = true
        collections.insert(collection)
    }
    
    func contains(_ collection: T) -> Bool {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        
        return current.isTerminating
    }
    
    func remove(_ collection: T) {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        
        guard current.isTerminating else { return }
        
        current.isTerminating = false
        collections.remove(collection)
        
        while let parent = current.parent,
            let key = current.key,
            current.children.isEmpty && !current.isTerminating {
                parent.children[key] = nil
                current = parent
        }
    }
}

public extension Trie where T: RangeReplaceableCollection {
    func collections(startingWith prefix: T) -> [T] {
        var current = root
        
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }
        
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: T, after node: Node) -> [T] {
        var results = [T]()
        
        if node.isTerminating {
            results.append(prefix)
        }
        
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            
            let innerResults = collections(startingWith: prefix,
                                           after: child)
            results.append(contentsOf: innerResults)
        }
        
        return results
    }
}
