//
//  LinkedListNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 3/10/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public final class LinkedListNode<Value>: Node<Value> {
    public var next: LinkedListNode?
    
    public init(value: Value, next: LinkedListNode? = nil) {
        super.init(value: value)
        self.next = next
    }
}

extension LinkedListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value) -> nil"
        }
        return "\(value) -> " + String(describing: next)
    }
}
