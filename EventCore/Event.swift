//
//  Event.swift
//  EventCore
//

public class Event<T> {
    private var dataToPublish: T?;
    private var list: LinkedList<EventListenerCallback<T>>;
    
    public required init() {
        self.list = LinkedList<EventListenerCallback<T>>();
        self.dataToPublish = nil;
    }
    
    public func subscribe(subscriber: EventListener<T>) {
        self.list.insert(data: subscriber.node);
    }
    
    public func unsubscribe(subscriber: EventListener<T>) {
        self.list.remove(data: subscriber.node);
    }
    
    public func publish(data: T) {
        self.dataToPublish = data;
        self.list.forEach(publishData);
    }
    
    private func publishData(node: LinkedListNode<EventListenerCallback<T>>) {
        node.data!(self.dataToPublish!);
    }
}
