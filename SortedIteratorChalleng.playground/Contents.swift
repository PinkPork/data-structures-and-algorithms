import UIKit
import XCTest

/*
 Given K sorted lists of up to N elements in each list, return a sorted iterator over all the items.
 
 Importent notes:
 * K denotes the number of lists.
 * N denotes the length of the longest list.
 * You may assume K << N
 * There aren't necessarily N items in each list, but there could be.
 * Items are not unique, if an item appears X times (in a single list or in several lists), we would expect the iterator to return the item X consecutive times.
 
 Receiving the following lists:
 
 1: [1, 4, 5, 8, 9]
 2: [3, 4, 4, 6]
 3: [0, 2, 8]
 
 Would yield the following result:
 
 [0, 1, 2, 3, 4, 4, 4, 5, 6, 8, 8, 9]
 */

class IteratorSortedTests: XCTestCase {
    
    func testExample() {
        // Given
        var sortedIterator = SortedIterator<Array<Int>>()
        
        sortedIterator.add(AnySequence([1, 4, 5, 8, 9]))
        sortedIterator.add(AnySequence([3, 4, 4, 6]))
        sortedIterator.add(AnySequence([0, 2, 8]))
        
        // When
        var result = [Int]()
        while let next = sortedIterator.next() {
            result.append(next)
        }
        
        XCTAssertEqual(result, [0, 1, 2, 3, 4, 4, 4, 5, 6, 8, 8, 9])
    }
    
    func testExample1() {
        // Given
        var sortedIterator = SortedIterator<Array<Int>>()
        
        sortedIterator.add(AnySequence([1,2,3,4,5]))
        sortedIterator.add(AnySequence([6,7,8,9,10]))
        
        // When
        var index = 1
        var result = [Int]()
        while let next = sortedIterator.next() {
            if next != index {
                XCTFail()
            }
            
            index += 1
            result.append(next)
        }
        
        XCTAssertTrue(index != 1)
        XCTAssertEqual(result, [1,2,3,4,5,6,7,8,9,10])
    }
    
    func testExample2() {
        // Given
        var sortedIterator = SortedIterator<Array<Int>>()
        
        sortedIterator.add(AnySequence([1,3,6,8]))
        sortedIterator.add(AnySequence([2,4,5,7,9,10]))
        
        // When
        var index = 1
        var result = [Int]()
        while let next = sortedIterator.next() {
            if next != index {
                XCTFail()
            }
            
            index += 1
            result.append(next)
        }
        
        XCTAssertTrue(index != 1)
        XCTAssertEqual(result, [1,2,3,4,5,6,7,8,9,10])
    }
    
    func testPerformanceExample() {
        // Given
//        var sortedIterator = SortedIterator<Array<Int>>()
        var sortedIterator = SortedIterator<ContiguousArray<Int>>()
        
        sortedIterator.add(AnySequence([1,3,6,8]))
        sortedIterator.add(AnySequence([2,4,5,7,9,10]))
        
        self.measure {
            // When
            while sortedIterator.next() != nil { }
        }
    }
    
}

XCTestObservationCenter.shared.addTestObserver(TestObserver())
IteratorSortedTests.defaultTestSuite.run()
