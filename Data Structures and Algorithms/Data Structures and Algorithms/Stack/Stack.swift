//
//  Stack.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/2/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public struct Stack<Element> {
    fileprivate var storage = [Element]()
    public var root: Element? { return storage.first }
    public var top: Element? { return storage.last }
    public var isEmpty: Bool { return storage.isEmpty }
    public var count: Int { return storage.count }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: Stack.ArrayLiteralElement...) {
        storage = elements
    }
}

extension Stack: Sequence, IteratorProtocol {
    public mutating func next() -> Element? {
        return pop()
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        
        let stackElements = self
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
