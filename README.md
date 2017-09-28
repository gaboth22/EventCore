# EventCore
A basic synchronous event system (pub-sub) written in swift

This can be used for an event-driven design application, decoupling the business logic of the application from Apple's built in classes.

Notice this is a synchronous pub-sub, so chained callbacks will run to completion before returning control to the top level logic.
