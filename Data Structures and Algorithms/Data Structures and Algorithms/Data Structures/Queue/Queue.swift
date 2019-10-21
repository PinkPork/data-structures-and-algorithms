//
//  Queue.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 2/3/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var front: Element? { get }
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
}
