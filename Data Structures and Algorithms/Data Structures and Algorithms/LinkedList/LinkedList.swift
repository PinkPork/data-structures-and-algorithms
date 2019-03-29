//
//  LinkedList.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 1/31/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

public struct LinkedList<Value> {
    public var head: LinkedListNode<Value>?
    public var tail: LinkedListNode<Value>?
    public var count: Int = 0
    public var isEmpty: Bool { return head == nil }
    
    public init() {}
    
    public init(array: [Value]) {
        self.init()
        array.forEach { append($0) }
    }

    public mutating func push(_ value: Value) {
        let node = LinkedListNode(value: value, next: head)
        
        head = node
        
        if tail == nil {
            tail = head
        }
        
        count += 1
    }
    
    public mutating func append(_ value: Value) {
        copyNodes()
        
        guard let tail = tail else {
            push(value)
            return
        }
        
        let node = LinkedListNode(value: value)
        
        tail.next = node
        self.tail = node
        count += 1
    }
    
    public func node(at index: Int) -> LinkedListNode<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: LinkedListNode<Value>) -> LinkedListNode<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        let newReferenceNode = copyNodes(referencedNode: node)
        let newNode = newReferenceNode ?? node
        let insertedNode = LinkedListNode(value: value, next: newNode.next)
        
        newNode.next = insertedNode
        count += 1
        return insertedNode
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            count -= 1
            
            if isEmpty {
                tail = nil
            }
        }
        copyNodes()
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()
        
        guard head?.next != nil else {
            return pop()
        }
        
        var prev: LinkedListNode<Value>?
        var current: LinkedListNode<Value>? = head
        
        while current !== tail {
            prev = current
            current = current?.next
        }
        
        tail = prev
        tail?.next = nil
        count -= 1
        return current?.value
    }
    
    @discardableResult
    public mutating func remove(after node: LinkedListNode<Value>) -> Value? {
        defer {
            let newReferenceNode = copyNodes(referencedNode: node)
            let newNode = newReferenceNode ?? node
            
            if newNode.next === tail {
                tail = newNode
            }
            
            newNode.next = newNode.next?.next
            count -= 1
        }
        return node.next?.value
    }
    
    @discardableResult
    private mutating func copyNodes(referencedNode: LinkedListNode<Value>? = nil) -> LinkedListNode<Value>? {
        guard !isKnownUniquelyReferenced(&head),
            var oldNode = head else {
            return nil
        }
        
        var copiedReferencedNode: LinkedListNode<Value>?
        var newNode: LinkedListNode<Value>?
        
        head = LinkedListNode(value: oldNode.value)
        newNode = head
        
        if oldNode === referencedNode {
            copiedReferencedNode = newNode
        }
        
        while let nextOldNode = oldNode.next {
            newNode?.next = LinkedListNode(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
            
            if nextOldNode === referencedNode {
                copiedReferencedNode = newNode
            }
        }
        
        if tail === referencedNode {
            copiedReferencedNode = newNode
        }
        
        tail = newNode
        return copiedReferencedNode
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

extension LinkedList: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Value
    
    public init(arrayLiteral elements: LinkedList.ArrayLiteralElement...) {
        self.init()
        elements.forEach { append($0) }
    }
}

extension LinkedList: Collection {
    public struct Index: Comparable {
        var node: LinkedListNode<Value>?
        
        public init(node: LinkedListNode<Value>?) {
            self.node = node
        }
        
        static public func==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index { return Index(node: head) }
    public var endIndex: Index { return Index(node: tail?.next) }
    
    public func index(after i: LinkedList<Value>.Index) -> LinkedList<Value>.Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
}
