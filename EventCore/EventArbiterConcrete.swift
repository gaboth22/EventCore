//
//  EventArbiter.swift
//  EventCore
//

public class EventArbiterConcrete : EventArbiter {
    private var topicToEventDictionary: Dictionary<EventTopic, Any>;
    
    public required init() {
        self.topicToEventDictionary = Dictionary<EventTopic, Any>();
    }
    
    public func registerEvent(topic: EventTopic, event: Any) throws {
        if(self.topicToEventDictionary[topic] != nil) {
            throw EventArbiterError.TopicAlreadyExists(topic);
        }
        
        self.topicToEventDictionary[topic] = event;
    }
    
    public func deregisterEvent(topic: EventTopic) {
        self.topicToEventDictionary.removeValue(forKey: topic);
    }
    
    public func getEvent(fromTopic: EventTopic) throws -> Any {
        let eventToReturn = self.topicToEventDictionary[fromTopic];
        
        if(eventToReturn == nil) {
            throw EventArbiterError.TopicNotFound(fromTopic);
        }
        
        return eventToReturn!;
    }
}
