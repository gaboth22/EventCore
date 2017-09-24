//
//  EventArbiterTest.swift
//  EventCore
//

import XCTest
@testable import EventCore

class EventArbiterTest: XCTestCase {
    var event1: Event<Int>?;
    var event2: Event<Int>?;
    var arbiter: EventArbiter?;
    var methodThrew: Bool?;
    
    override func setUp() {
        super.setUp();
        self.event1 = Event<Int>();
        self.event2 = Event<Int>();
        self.arbiter = EventArbiterConcrete();
        self.methodThrew = false;
    }
    
    func testShouldBeAbleToRegisterEventsWithTheArbiter() {
        givenIRegisterTwoEventsWithTopics(event1Topic: "Event1", event2Topic: "Event2");
        thenTwoEventsShouldExistWithTopics(event1Topic: "Event1", event2Topic: "Event2");
    }
    
    func testshouldThrowIfTopicNameAlreadyExists() {
        givenIRegisterOneEventWithTopic(eventTopic: "Event1");
        whenITryToRegisterAnEventWhoseTopicAlreadyExists(eventTopic: "Event1");
        thenItShouldHaveThrown();
    }
    
    func testShouldThrowIfTopicDoesntExist() {
        givenITryToGetAnEventWhoseTopicDoesntExist();
        thenItShouldHaveThrown();
    }
    
    override func tearDown() {
        super.tearDown();
    }
    
    private func givenIRegisterTwoEventsWithTopics(event1Topic: String, event2Topic: String) {
        do {
            try self.arbiter?.registerEvent(topic: event1Topic, event: self.event1!);
            try self.arbiter?.registerEvent(topic: event2Topic, event: self.event2!);
        }
        catch {
        }
    }
    
    private func thenTwoEventsShouldExistWithTopics(event1Topic: String, event2Topic: String) {
        var event1FromArbiter: Event<Int>? = nil;
        var event2FromArbiter: Event<Int>? = nil;
        
        do {
            try event1FromArbiter = self.arbiter?.getEvent(fromTopic: "Event1") as? Event<Int>;
            try event2FromArbiter = self.arbiter?.getEvent(fromTopic: "Event2") as? Event<Int>;
        }
        catch {
        }
        
        XCTAssert(event1FromArbiter != nil);
        XCTAssert(event2FromArbiter != nil);
        XCTAssert(event1FromArbiter === self.event1);
        XCTAssert(event2FromArbiter === self.event2);
    }
    
    private func givenIRegisterOneEventWithTopic(eventTopic: String) {
        do {
            try self.arbiter?.registerEvent(topic: eventTopic, event: self.event1!);
        }
        catch {
        }
    }
    
    private func whenITryToRegisterAnEventWhoseTopicAlreadyExists(eventTopic: String) {
        do {
            try self.arbiter?.registerEvent(topic: eventTopic, event: self.event1!);
        }
        catch EventArbiterError.TopicAlreadyExists {
            self.methodThrew = true;
        }
        catch {
        }
    }
    
    private func thenItShouldHaveThrown() {
        XCTAssert(self.methodThrew!);
    }
    
    private func givenITryToGetAnEventWhoseTopicDoesntExist() {
        do {
            let _ = try self.arbiter?.getEvent(fromTopic: "NonExistentTopic");
        }
        catch EventArbiterError.TopicNotFound {
            self.methodThrew = true;
        }
        catch {
        }
    }
}
