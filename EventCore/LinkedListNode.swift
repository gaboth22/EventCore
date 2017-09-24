//
//  LikedListNode.swift
//  EventCore
//

import Foundation

public class LinkedListNode<T> {
    public var id: String;
    public var data: T? = nil;
    public var next: LinkedListNode<T>? = nil;
    
    init() {
        self.data = nil;
        self.next = nil;
        self.id = UUID().uuidString;
    }
    
    init(_ data: T) {
        self.data = data;
        self.next = nil;
        self.id = UUID().uuidString;
    }
}
