# EventCore
A basic synchronous event system (pub-sub) written in swift

This can be used for an event-driven design application, decoupling the business logic of the application from Apple's built in classes.

Notice this is a synchronous pub-sub, so chained callbacks will run to completion before returning control to the top level logic.

# Usage

```swift
var intEvent = Event<Int>()

var intEventListener = EventListener<Int>(onPublishCallback: callback);

func callback(eventData: Int) {
  print(eventData)
}

intEvent.subscribe(subscriber: intEventListener)

intEvent.publish(data: 100)

// Should print 100
```

## What's happening here?

Create an event that publishes `Int` data.
```swift
var intEvent = Event<Int>()
```

Create an event listener that receives `Int` data.
```swift
var intEventListener = EventListener<Int>(onPublishCallback: callback);
```
You gotta give it a callback that gets called when the event publishes (This is how your event listener receives its data).
```swift
func callback(eventData: Int) {
  print(eventData)
}
```

You gotta subscribe the event listener to the event (An event could have many event listeners).
```swift
intEvent.subscribe(subscriber: intEventListener)
```

When the event publishes
```swift
intEvent.publish(data: 100)
```

Then the event listener's callback function should be called.

# Note

You could also unsubscribe event listeners from event at runtime. In the above example it would be.
```swift
intEvet.unsubscribe(subscriber: intEventLister)
```
