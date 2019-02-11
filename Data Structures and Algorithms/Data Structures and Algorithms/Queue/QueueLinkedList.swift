//
//  QueueLinkedList.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct QueueLinkedList<T>: Queue {
    public typealias Element = T
    private var list = LinkedList<T>()
    
    public var isEmpty: Bool { return list.isEmpty }
    public var front: T? { return list.first }
    
    public init() {}
    
    public init(_ elements: [T]) {
        elements.forEach({ enqueue($0) })
    }
    
    public mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        return list.pop()
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return String(describing: list)
    }
}

extension QueueLinkedList {
    public mutating func reversed() -> QueueLinkedList {
        var copy = self
        var reversedQueueLinkedList = QueueLinkedList()
        
        while !copy.list.isEmpty {
            if let element = copy.list.removeLast() {
                reversedQueueLinkedList.enqueue(element)
            }
        }
        
        return reversedQueueLinkedList
    }
}
