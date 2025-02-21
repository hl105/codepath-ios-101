
# Lab 1 Mariokart Starter
 - function call to the`UIView.animate` method is an example of a trailing closure. If the last argument is a closure, then the passed in argument can **exist outside of the parenthesis of the function call**. 

- Instead of animating the karts all at once, we'll modify our code to animate them one-by-one using closures! Remember, closures allow you to execute an arbitrary piece of code at a specific point in time. Use the completion closure parameter in getKartReadyToRace to make sure the next getKartReadyToRace call is executed only after the previous one has finished executing. 

- if a function’s only parameter is a closure, then using empty parentheses before the trailing closure is optional.