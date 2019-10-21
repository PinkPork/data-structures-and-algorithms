//
//  DiagramableBinaryNode.swift
//  Data Structures and Algorithms
//
//  Created by Jaime Andres Laino Guerra on 5/12/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation

public protocol DiagramableBinaryNode: BinaryNodeProtocol {
    func diagram() -> String
}

extension CustomStringConvertible where Self: DiagramableBinaryNode  {
    public var description: String {
        return diagram()
    }
}

public extension DiagramableBinaryNode {
    func diagram() -> String {
        return diagram(for: self)
    }
    
    private func diagram(for node: Self?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌── ", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild,
                      bottom + "│ ", bottom + "└── ", bottom + " ")
    }
}
