//
//  RingBuffer.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct RingBuffer<T> {
    private var storage: ContiguousArray<T?>
    private var readIndex = 0
    private var writeIndex = 0
    private var readSpace: Int { return writeIndex - readIndex }
   
    public var isEmpty: Bool { return readSpace == 0 }
    public var isFull: Bool {
        return (storage.count - readSpace) == 0
    }
    public var first: T? {
        if isEmpty { return nil }
        return storage[wrapped: readIndex]
    }
    
    public init(size: Int) {
        storage = ContiguousArray<T?>(repeating: nil, count: size)
    }
    
    @discardableResult
    public mutating func write(_ element: T) -> Bool {
        if isFull { return false }
        
        storage[wrapped: writeIndex] = element
        writeIndex += 1
        return true
    }
    
    @discardableResult
    public mutating func read() -> T? {
        if isEmpty { return nil }
        let element = first
        
        readIndex += 1
        return element
    }
}

extension RingBuffer: Sequence, IteratorProtocol {
    public typealias Element = T
    
    public mutating func next() -> Element? {
        return read()
    }
}

extension RingBuffer: CustomStringConvertible {
    public var description: String {
        let values = self.map { String(describing: $0) }
        
        return "[" + values.joined(separator: ", ") + "]"
    }
}

private extension ContiguousArray {
    subscript (wrapped index: Int) -> Element {
        get {
            return self[index % count]
        }
        set {
            self[index % count] = newValue
        }
    }
}
