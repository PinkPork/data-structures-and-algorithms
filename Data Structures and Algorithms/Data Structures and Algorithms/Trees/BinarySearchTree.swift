//
//  BinarySearchTree.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/15/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    public func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

private extension BinarySearchTree {
    func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
    func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            return remove(node)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
    
    func remove(_ node: BinaryNode<Element>) -> BinaryNode<Element>? {
        if node.leftChild == nil && node.rightChild == nil {
            return nil
        }
        
        if node.leftChild == nil {
            return node.rightChild
        }
        
        if node.rightChild == nil {
            return node.leftChild
        }
        
        node.value = node.rightChild!.min.value
        node.rightChild = remove(node: node.rightChild, value: node.value)
        return node
    }
}

private extension BinaryNode {
    var min: BinaryNode { return leftChild?.min ?? self }
}
