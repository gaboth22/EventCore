//
//  LinkedListTest.swift
//  EventCore
//

import XCTest
@testable import EventCore

class LinkedListTest: XCTestCase {
    
    var intLinkedList: LinkedList<Int>? = nil;
    var elements: Array<LinkedListNode<Int>?> = Array(repeating: nil, count: 4);
    var elementsAfterRemovingSecondElement: Array<LinkedListNode<Int>?> = Array(repeating: nil, count: 3);
    var elementsToCompare: Array<LinkedListNode<Int>?> = Array();
    var elementsAfterHeadIsRemoved: Array<LinkedListNode<Int>?> = Array(repeating: nil, count: 3);
    var elementsAfterTailIsRemoved: Array<LinkedListNode<Int>?> = Array(repeating: nil, count: 3);
    var elementsAfterTailIsRemovedAndAnotherElementIsAdded: Array<LinkedListNode<Int>?> = Array(repeating: nil, count: 4);
    var elementIndex = 0;
    
    override func setUp() {
        super.setUp()
        
        elements = Array(repeating: nil, count: 4);
        elementsAfterRemovingSecondElement = Array(repeating: nil, count: 3);
        elementsToCompare = Array();
        elementsAfterHeadIsRemoved = Array(repeating: nil, count: 3);
        elementsAfterTailIsRemoved = Array(repeating: nil, count: 3);
        elementsAfterTailIsRemovedAndAnotherElementIsAdded = Array(repeating: nil, count: 4);
        
        intLinkedList = LinkedList<Int>();
        
        elementIndex = 0;
        
        elements[0] = LinkedListNode<Int>(1);
        elements[1] = LinkedListNode<Int>(2);
        elements[2] = LinkedListNode<Int>(3);
        elements[3] = LinkedListNode<Int>(4);
        
        elementsAfterRemovingSecondElement[0] = elements[0];
        elementsAfterRemovingSecondElement[1] = elements[2];
        elementsAfterRemovingSecondElement[2] = elements[3];
        
        elementsAfterHeadIsRemoved[0] = elements[1];
        elementsAfterHeadIsRemoved[1] = elements[2];
        elementsAfterHeadIsRemoved[2] = elements[3];
        
        elementsAfterTailIsRemoved[0] = elements[0];
        elementsAfterTailIsRemoved[1] = elements[1];
        elementsAfterTailIsRemoved[2] = elements[2];
        
        elementsAfterTailIsRemovedAndAnotherElementIsAdded[0] = elements[0];
        elementsAfterTailIsRemovedAndAnotherElementIsAdded[1] = elements[1];
        elementsAfterTailIsRemovedAndAnotherElementIsAdded[2] = elements[2];
        elementsAfterTailIsRemovedAndAnotherElementIsAdded[3] = LinkedListNode<Int>(6);
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldAddOneElementToTheList() {
        givenWeAddOneElementToTheList(element: self.elements[0]!);
        thenTheListSizeShouldBe(expectedSize: 1);
    }
    
    func testShouldIncreaseSizeToAsManyElementsAsAreAdded() {
        givenWeAddSoManyElementsToTheList(self.elements);
        thenTheListSizeShouldBe(expectedSize: 4);
        andTheRightDataShouldBeInTheList(self.elements);
    }
    
    func testShouldRemoveOneElementCorrectly() {
        givenWeAddSoManyElementsToTheList(self.elements);
        whenWeRemoveOneElement(elements[1]);
        thenTheListSizeShouldBe(expectedSize: 3);
        andTheRightDataShouldBeInTheList(self.elementsAfterRemovingSecondElement);
    }
    
    func testShouldBeAbleToRemoveHeadJustFine() {
        givenWeAddSoManyElementsToTheList(self.elements);
        whenWeRemoveOneElement(elements[0]);
        thenTheListSizeShouldBe(expectedSize: 3);
        andTheRightDataShouldBeInTheList(self.elementsAfterHeadIsRemoved);
    }
    
    func testShouldBeAbleToRemoveTailJustFine() {
        givenWeAddSoManyElementsToTheList(self.elements);
        whenWeRemoveOneElement(elements[3]);
        thenTheListSizeShouldBe(expectedSize: 3);
        andTheRightDataShouldBeInTheList(self.elementsAfterTailIsRemoved);
    }
    
    func testShouldBeAbleToAddMoreElementsAfterTailIsRemoved() {
        givenWeAddSoManyElementsToTheList(self.elements);
        givenWeAddOneElementToTheList(element: self.elementsAfterTailIsRemovedAndAnotherElementIsAdded[3]!)
        whenWeRemoveOneElement(elements[3]);
        thenTheListSizeShouldBe(expectedSize: 4);
        andTheRightDataShouldBeInTheList(self.elementsAfterTailIsRemovedAndAnotherElementIsAdded);
    }
    
    private func givenWeAddOneElementToTheList(element: LinkedListNode<Int>) {
        intLinkedList?.insert(data: element);
    }
    
    private func thenTheListSizeShouldBe(expectedSize: Int) {
        XCTAssertEqual(expectedSize, intLinkedList?.size());
    }
    
    private func givenWeAddSoManyElementsToTheList(_ elements: Array<LinkedListNode<Int>?>) {
        for element in elements {
            intLinkedList?.insert(data: element!);
        }
    }
    
    private func andTheRightDataShouldBeInTheList(_ expectedData: Array<LinkedListNode<Int>?>) {
        elementsToCompare = expectedData
        intLinkedList?.forEach(compareLinkedListNodeDataWithData);
    }
    
    private func compareLinkedListNodeDataWithData(_ node: LinkedListNode<Int>) {
        XCTAssertEqual(elementsToCompare[elementIndex]?.data, node.data);
        elementIndex += 1;
    }
    
    private func whenWeRemoveOneElement(_ element: LinkedListNode<Int>?) {
        intLinkedList?.remove(data: element!);
    }
}
