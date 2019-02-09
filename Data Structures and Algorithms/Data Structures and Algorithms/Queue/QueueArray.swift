//
//  QueueArray.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct QueueArray<T>: Queue {
    public typealias Element = T
    private var storage = ContiguousArray<T?>()
    
    public var isEmpty: Bool { return storage.isEmpty }
    public var front: T? { return storage.first ?? nil }
    private var head: Int = 0
    
    public init() {}
    
    public init(_ elements: [T]) {
        elements.forEach({ enqueue($0) })
    }
    
    public mutating func enqueue(_ element: T) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : storage.removeFirst()
    }
    
    @discardableResult
    public mutating func dequeueFast() -> T? {
        guard head < storage.count, let value = storage[head] else {
            return nil
        }
        
        storage[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(storage.count)
        if storage.count > 100 && percentage > 0.25 {
            storage.removeFirst(head)
            head = 0
        }
        
        return value
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: storage)
    }
}

// MARK: - Challenge 4 method
extension QueueArray {
    public mutating func reversed() -> QueueArray {
        var reversedQueue = QueueArray()
        
        while !self.isEmpty {
            reversedQueue.enqueue(storage.removeLast())
        }
        return reversedQueue // return a copy of the reversed queue
    }
}
