import Foundation

public protocol SortedCollection: Sequence where Element : Comparable {
    var min: Element? { get }
    
    init()
    mutating func add(_ element: Element)
    mutating func popMin() -> Element?
}

extension Array: SortedCollection where Element : Comparable {
    public var min: Element? {
        return last
    }
    
    public mutating func add(_ element: Element) {
        append(element)
        sort(by: >)
    }
    
    public mutating func popMin() -> Element? {
        return popLast()
    }
}

extension ContiguousArray: SortedCollection where Element : Comparable {
    public var min: Element? {
        return last
    }
    
    public mutating func add(_ element: Element) {
        append(element)
        sort(by: >)
    }
    
    public mutating func popMin() -> Element? {
        return popLast()
    }
}
