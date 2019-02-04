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
    private var storage = ContiguousArray<T>()
    
    public var isEmpty: Bool { return storage.isEmpty }
    public var front: T? { return storage.first }
    
    public init() {}
    
    public mutating func enqueue(_ element: T) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : storage.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: storage)
    }
}
