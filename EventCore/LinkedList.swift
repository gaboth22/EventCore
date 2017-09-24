//
//  LinkedList.swift
//  EventCore
//

typealias ForEachFunction<T> = (LinkedListNode<T>) -> (Void)

public class LinkedList<T> {
    
    private var head: LinkedListNode<T>? = nil;
    private var tail: LinkedListNode<T>? = nil;
    private var numberOfNodes: Int;
    
    public required init() {
        self.head = nil;
        self.tail = nil;
        self.numberOfNodes = 0;
    }
    
    func insert(data: LinkedListNode<T>) -> Void {
        
        if(self.head == nil) {
            self.head = data;
        }
        else if(self.tail == nil) {
            self.tail = data;
            self.head?.next = self.tail;
        }
        else {
            self.tail!.next = data;
            self.tail = data;
        }
        
        self.numberOfNodes += 1;
    }
    
    func remove(data: LinkedListNode<T>) -> Void {
        var tempHead = self.head;
        
        if(tempHead!.id == data.id) {
            self.head = self.head!.next;
            self.numberOfNodes -= 1;
        }
        else {
            while(tempHead != nil) {
                if(tempHead!.next!.id == data.id) {
                    let nextNode = tempHead!.next!.next;
                    tempHead?.next = nil;
                    tempHead?.next = nextNode;
                    self.numberOfNodes -= 1;
                    break;
                }
                
                tempHead = tempHead?.next;
            }
        }
    }
    
    func size() -> Int {
        return self.numberOfNodes;
    }
    
    func empty() -> Bool {
        return self.numberOfNodes == 0;
    }
    
    func forEach(_ function: ForEachFunction<T>) -> Void {
        var tempHead = self.head;
        
        while(tempHead != nil) {
            function(tempHead!);
            tempHead = tempHead?.next;
        }
    }
}
