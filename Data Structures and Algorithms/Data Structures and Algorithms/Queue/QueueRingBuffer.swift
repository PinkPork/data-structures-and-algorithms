//
//  QueueRingBuffer.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct QueueRingBuffer<T>: Queue {
    public typealias Element = T
    private var buffer: RingBuffer<T>

    public var isEmpty: Bool { return buffer.isEmpty }
    public var front: T? { return buffer.first }
    
    public init(size: Int) {
        buffer = RingBuffer<T>(size: size)
    }
    
    public init(elements: [T], size: Int) {
        buffer = RingBuffer<T>(size: size)
        
        elements.forEach({ enqueue($0) })
    }

    public mutating func enqueue(_ element: T) {
        buffer.write(element)
    }

    @discardableResult
    public mutating func dequeue() -> T? {
        return buffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        return String(describing: buffer)
    }
}

extension QueueRingBuffer {
    public mutating func reversed(size: Int) -> QueueRingBuffer {
        let bufferReversed = self.buffer.reversed()
        let reversedQueueRingBuffer = QueueRingBuffer(elements: bufferReversed, size: size)
        
        return reversedQueueRingBuffer
    }
}
