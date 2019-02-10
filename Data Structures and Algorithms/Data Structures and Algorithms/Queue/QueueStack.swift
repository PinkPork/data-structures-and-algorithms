//
//  QueueStack.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct QueueStack<T>: Queue {
    public typealias Element = T
    private var leftStack = Stack<T>()
    private var rightStack = Stack<T>()
    
    public var isEmpty: Bool { return leftStack.isEmpty && rightStack.isEmpty }
    public var front: T? { return !leftStack.isEmpty ? leftStack.top : rightStack.root }
    
    public init() {}
    
    public init (_ elements: [T]) {
        elements.forEach({ enqueue($0) })
    }
    
    public mutating func enqueue(_ element: T) {
        rightStack.push(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        reverseStack()
        return leftStack.pop()
    }
    
    private mutating func reverseStack() {
        if leftStack.isEmpty {
            while let element = rightStack.pop() {
                leftStack.push(element)
            }
        }
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        let queue = leftStack.map { $0 } + rightStack.reversed()
        return String(describing: queue)
    }
}

extension QueueStack {
    public mutating func reversed() -> QueueStack {
        var reversedQueueStack = QueueStack()
        
        rightStack.forEach( { reversedQueueStack.enqueue($0) } )
        
        return reversedQueueStack
    }
}
