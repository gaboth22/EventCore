//
//  EventArbiterError.swift
//  EventCore
//

public enum EventArbiterError: Error {
    case TopicNotFound(String);
    case TopicAlreadyExists(String);
}
