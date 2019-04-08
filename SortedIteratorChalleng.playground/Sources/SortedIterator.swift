import Foundation

public struct SortedIterator
    <AnySortedCollection: SortedCollection>
    : IteratorProtocol
{
    public typealias Element = AnySortedCollection.Element
    
    private var accumulatedSortedValues = AnySortedCollection()
    private var iterators = Array<AnyIterator<Element>>()
    
    public init() {}
    
    public mutating func add(_ sortedCollection: AnySequence<Element>) {
        iterators.append(sortedCollection.makeIterator())
    }

    public mutating func next() -> Element? {
        var nextSortedValues = iterators.reduce(into: AnySortedCollection()) { (values, iterator) in
            if let value = iterator.next() {
                values.add(value)
            }
        }
        var minValue: Element? = nil
        
        if let nextMinValue = nextSortedValues.min {
            if let accumulatedMinValue = accumulatedSortedValues.min,
                accumulatedMinValue < nextMinValue {
                minValue = accumulatedSortedValues.popMin()
            } else {
                minValue = nextSortedValues.popMin()
            }
        } else {
            minValue = accumulatedSortedValues.popMin()
        }
        
        nextSortedValues.forEach { accumulatedSortedValues.add($0) }
        return minValue
    }
}
