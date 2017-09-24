//
//  EventArbiter.swift
//  EventCore
//

public typealias EventTopic = String;

protocol EventArbiter {
    func registerEvent(topic: EventTopic, event: Any) throws;
    func deregisterEvent(topic: EventTopic);
    func getEvent(fromTopic: EventTopic) throws -> Any;
}
