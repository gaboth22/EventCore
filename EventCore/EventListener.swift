//
//  EventListener.swift
//  EventCore
//

public typealias EventListenerCallback<T> = (T) -> Void;

public class EventListener<T> {
    public var node: LinkedListNode<EventListenerCallback<T>>;
    
    public required init(onPublishCallback: @escaping EventListenerCallback<T>) {
        node = LinkedListNode<EventListenerCallback<T>>();
        node.data = onPublishCallback;
    }
}
