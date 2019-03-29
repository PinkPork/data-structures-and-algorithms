//
//  AVLTree.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 3/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct AVLTree<Element: Comparable> {
    public private(set) var root: AVLNode<Element>?
    
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

internal extension AVLTree {
    func updateHeight(_ node: AVLNode<Element>) {
        node.height = max(node.leftHeight, node.rightHeight) + 1
    }
    
    func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        let pivot = node.rightChild!
        
        node.rightChild = pivot.leftChild
        pivot.leftChild = node
        updateHeight(node)
        updateHeight(pivot)
       return pivot
    }
    
    func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        let pivot = node.leftChild!
        
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        updateHeight(node)
        updateHeight(pivot)
        return pivot
    }

    func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let rightChild = node.rightChild else {
            return node
        }
        
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    
    func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let leftChild = node.leftChild else {
            return node
        }
        
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
}

extension AVLTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

private extension AVLTree {
    func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
        var balancedNode = node
        
        switch node.balanceFactor {
        case .leftChildHeavier:
            if let leftChild = node.leftChild,
                leftChild.balanceFactor == .negative {
                balancedNode = leftRightRotate(node)
                break
            }
            
            balancedNode = rightRotate(node)
        case .rightChildHeavier:
            if let rightChild = node.rightChild,
                rightChild.balanceFactor == .positive {
                balancedNode =  rightLeftRotate(node)
                break
            }
            
            balancedNode = leftRotate(node)
        default:
            break
        }
        
        updateHeight(balancedNode)
        return balancedNode
    }
    
    func insert(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element> {
        guard let node = node else {
            return AVLNode(value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return balanced(node)
    }
    
    func remove(node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {
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
        
        return balanced(node)
    }
    
    func remove(_ node: AVLNode<Element>) -> AVLNode<Element>? {
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
