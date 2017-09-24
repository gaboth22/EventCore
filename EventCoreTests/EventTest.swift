//
//  EventTest.swift
//  EventCore
//

import XCTest
@testable import EventCore

class EventTest: XCTestCase {
    var intEvent: Event<Int>?; var eventX: Event<String>?;
    var intListener1: EventListener<Int>?;
    var intListener2: EventListener<Int>?
    var callback1WasCalled: Bool?;
    var callback2WasCalled: Bool?;
    var callback1Args: Int?;
    var callback2Args: Int?;

    override func setUp() {
        super.setUp();
        intEvent = Event<Int>();
        intListener1 = EventListener<Int>(onPublishCallback: callback1);
        intListener2 = EventListener<Int>(onPublishCallback: callback2);
        callback1WasCalled = false;
        callback2WasCalled = false;
        callback1Args = 0;
        callback2Args = 0;
        
    }

    private func callback1(eventData: Int) {
        callback1Args = eventData;
        callback1WasCalled = true;
    }
    
    private func callback2(eventData: Int) {
        callback2Args = eventData;
        callback2WasCalled = true;
    }
    
    func testShouldCallListenersCallback() {
        givenWeSubscribeAListenerToAnEvent();
        whenTheEventPublishesIntData(intData: 10);
        thenTheListenerCallbackMustBeCalledWithData(expectedData: 10);
    }
    
    func testListenerCallbackShouldNotBeCalledAfterUnsubscribing() {
        givenWeSubscribeAListenerToAnEvent();
        givenWeUnsubscriberAListernerFromAnEvent();
        whenTheEventPublishesIntData(intData: 10);
        thenTheListenerCallbackMustNotBeCalled();
    }
    
    func testShouldBeAbleToSubscribeSeveralListenersToAndEvent() {
        givenWeSubscribeTwoListenersToAnEvent();
        whenTheEventPublishesIntData(intData: 100);
        thenBothListenersCallbacksShouldBeCalledWithData(expectedData:  100);
    }
    
    override func tearDown() {
        super.tearDown();
    }
    
    private func givenWeSubscribeAListenerToAnEvent() {
        self.intEvent?.subscribe(subscriber: self.intListener1!);
    }
    
    private func givenWeUnsubscriberAListernerFromAnEvent() {
        self.intEvent?.unsubscribe(subscriber: self.intListener1!);
    }
    
    private func whenTheEventPublishesIntData(intData: Int) {
        self.intEvent?.publish(data: intData);
    }
    
    private func thenTheListenerCallbackMustBeCalledWithData(expectedData: Int) {
        XCTAssert(callback1WasCalled!);
        XCTAssertEqual(expectedData, callback1Args!);
    }
    
    private func thenTheListenerCallbackMustNotBeCalled() {
        XCTAssert(!callback1WasCalled!);
    }
    
    private func givenWeSubscribeTwoListenersToAnEvent() {
        self.intEvent?.subscribe(subscriber: self.intListener1!);
        self.intEvent?.subscribe(subscriber: self.intListener2!);
    }
    
    private func thenBothListenersCallbacksShouldBeCalledWithData(expectedData: Int) {
        XCTAssert(callback1WasCalled!);
        XCTAssert(callback2WasCalled!);
        XCTAssertEqual(expectedData, callback1Args!);
        XCTAssertEqual(expectedData, callback2Args!);
    }
}
