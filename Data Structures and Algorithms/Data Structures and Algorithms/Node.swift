//
//  Node.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 1/31/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

public protocol NodeProtocol: class {
    associatedtype Element
    var value: Element { get }
}

public class Node<Value>: NodeProtocol {
    public var value: Value
    
    public init(value: Value) {
        self.value = value
    }
}
