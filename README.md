
# Codepath IOS 101

Spring 2025 IOS development classwork / hw
WIP

# Table of Contents

## (2/20) lab1 mariokart starter

- installed xcode / introduced to xcode basics
- closure, trailing closure
- var, let (=constant)

## (2/26) project1 wordle starter
- `in` keyword: divider that tells Swift, “Everything before in is about what the closure takes in, and everything after is what the closure does.”
- using self is necessary because you're `accessing an instance property` (boardController) from within a closure defined in your ViewController class.
- `as!`: forced cast operator. Treat the returns cell as an instance of \_.
- `print("Random word: \(String(describing: randomWord))")`: creates a string rep of any given value. Works when value is `nil`.
- switch style {
case .initial:
blalabl
}
- `UIView`: basic building block for all user interface elements.
- `contentView`: subview with cell's primary content. So stying usually is modified for this.
- e.g. `contentView.backgroundColor = .black`
- every UIView has underlying Core Animations layer (CAlayer) that handles low-level rendering. I.e. Every UIView has `layer` property.
- if launch screen not working go to general -> target -> lanuch screen file add file name without the .storyboard.

## (2/27, 3/6) lab 2  mariokart part2 & proj 2 world starter

### Optionals & Typecasting
- `optionals`: add `?`. e.g. print(name) where `name is type String?` will output `Optional("johanna")`. It's sort of a wrapper.
- `!` force unwraps it. But beware of: `Fatal error: Unexpectedly found nil while unwrapping an Optional value`: **force-unwrapping an optional value containing nil will crash the app!** so use it only when you're sure it absolutely exists.
- better way - ***optional-binding***: `if let var = function(){ func2(var)}` var is now only accessible inside the `if-let` curly brace. 
- if we want to run func2 when var is nil, we can use the `guard` control-flow statment. `guard let var = func() else {fun2(var) assertionFailure() return} print("this will run if var is not nil!")`.
- comma acts like a logical AND

## (3/12, 3/14) lab 3 cloudcast & project 3 trivia app
- `viewcontroller`: manages specific screen/view (ui)
    - labels, buttons, text fields
    - logic for user interactions
-  `interface builder`: visual tool that comes with Apple's Xcode dev env. Devs can create and layout graphical UIs using drag and drop components.
- `view controller scene`: allows you to keep track of elements being added to view controller. 
- `autolayout constraints`: specify how elements in UI should be arranged relative to another / how they should respond to changes in screen size/orientation.  
- `stack view`: UI element that arragnes its subviews in a stack. 
- `let alert = UIAlertController()`, `self.present(alert, animated: true, completion: nil)` for alerts.


## (3/24) lab 5 cloudcast api &
- `URLSession` library to fetch data
- Deserialization: transforming bytes from network to type. We can use JSON response as a regular dictionary. 
- must execute code that modifies UI on main thread. API calls can be done on background thread.
- Think of the main thread as the person in charge of painting pictures (the user interface). Meanwhile, a helper goes off to do some chore (fetch data) in the background. When the helper finishes, they hand the results back to the painter, who is the only one allowed to paint on the canvas (the screen). DispatchQueue.main.async is like tapping the painter on the shoulder and saying, “Hey, here are the new colors; paint them now!”


## (4/2) lab 6 tumbler table view
- protocol: rule book. `UITableViewDataSource` is a protocol that says "if you want to be my data source, you must provide me the data for each row(cell) in the table"
- `[weak self]` and `self?` inside closure
    - ![img](./assets/1.png)
    - ![img](./assets/2.png)
- `main thread`
- table view doesn't know movies changed (after initialized as []), so it doesn't reload itself, we need to explicitly do that.
- wrap to as many lines as it has room for: `lines` property 0. 
- if row is squished make sure u copy cell height to table view row height. 

## (4/9) lab 7 flix detail
- push navigation
    - requires the root view controller to be managed by a `UINavigationController`. 
    - this utilizes a navigation stack to push new view controllers onto or pop off of. 
    - add new view controller, create a `show` segue by control dragging (not push bc show is adaptive based on device)
- we can't set UI elements directly like we did when configuring table view cell bc the Detail View Controller is a `UIViewController` - it has a different lifecycle in terms of creating all of its internal UI elements (=views). So the views added to a view controller aren't created until `viewDidLoad()` is called. So configuring all views inside this ensures that the views have been created beforehand. 

## (4/16) lab 8 favorites
- UIButtons: different states (=State Configuration):
    - `Default` (the "normal" button state)
    - `Highlighted` (When a user is pressing down on the button)
    - `Selected` (Used for making a toggle style button)
    - `Disabled` (The button will not react to taps)
- Local Storage
    - just saving data to memory on device and not server
    - use `UserDefaults` = basically pinia 
```swift
// MARK: - UserDefaults: Basic Types

// Create an instance of UserDefaults
let defaults = UserDefaults.standard

// SAVE VALUES FOR BASIC TYPES
//    - Basic types are supported including arrays and dictionaries that contain basic types
//    - Each value is stored in association with the provided key (i.e. a `key: value` pair)
defaults.set("Kingsley", forKey: "Name")                                   // String
defaults.set("9", forKey: "Age")                                           // Int
defaults.set(true, forKey: "IsFriendly")                                   // Bool
defaults.set(65.5, forKey: "Weight")                                       // Double / Float
defaults.set(["Chubs", "Harley"], forKey: "Friends")                       // Array
defaults.set(["food": "duck", "brand": "Acme Dog"], forKey: "FeedingInfo") // Dictionary
defaults.set(Date(), forKey: "Birthday")                                   // Date

// RETRIEVE VALUES FOR BASIC TYPES
//    - Use available convenience methods based on type
//    - Some methods return a default value if the value can't be found for the given key while others    return an optional value.
let name = defaults.string(forKey: "Name")           // returns String? (optional)
let age = defaults.integer(forKey: "Age")            // returns Int (default value: 0)
let isFriendly = defaults.bool(forKey: "IsFriendly") // returns Bool (default value: false)
let weight = defaults.double(forKey: "Weight")       // returns Double (default value: 0)
let website = defaults.url(forKey: "Website")        // returns URL? (optional)

// RETRIEVE ARRAYS, DICTIONARIES AND DATES
//    - These types don't have convenience methods
//    - Use the object(forKey:) method in this case and cast to the specific data type.
let birthday = defaults.object(forKey: "Birthday") as? Date                   // returns Data? (optional)
let friends = defaults.object(forKey: "Friends") as? [String]                 // returns [String]?    (optional)
let feedingInfo = defaults.object(forKey: "FeedingInfo") as? [String: String] // returns [String: String]? (optional)

// REMOVE VALUES
// This is the same for any data type, just pass in the key for the value you want removed!
defaults.removeObject(forKey: "Name")


// bind the key to symbol
enum DefaultsKey {
    static let name = "Name"
    static let highScore = "HighScore"
    // add more keys here
}

// usage
UserDefaults.standard.set("Alice", forKey: DefaultsKey.name)
```
- Custom Objects
```swift
// MARK: - UserDefaults: Custom Objects
//
// 1. CREATE A CUSTOM OBJECT
// 2. Implement the `Codable` protocol.
//    - The `Codable` protocol combines both `Encodable` and `Decodable` protocols which allows the object to be both encoded by the JSONEncoder and decoded by the    JSONDecoder.
//    - A basic implementation of the `Codable` protocol is synthesized automatically behind the scenes when possible (i.e. the specific instructions for how to encode and decode an object) so no need to do ad any protocol specific methods in this case.
// ------

// 1.       2.
struct Dog: Codable {
    let name: String
    let age: Int
}

// 1. Create an instance of the custom type
// 2. Encode custom object to `Data`
//    - The `encode()` method can throw an error so the compiler will remind us we need to add a `try` before it to handle any thrown errors. There are 3 ways to handle `try`:
//    i. Use `try` wrapped in a `do - catch` statement.
//    ii. Use `try?` which will convert any error to a return value of `nil`.
//    iii. Use `try!` which will crash the app if an eror is thrown, similar to force unwrapping an optional.
// 3. Save the encoded `Data` to UserDefaults
// -------

// 1.
let dog = Dog(name: "Kingsley", age: 9)
// 2.
let encodedDogData = try! JSONEncoder().encode(dog)
// 1.
defaults.set(encodedDogData, forKey: "Kingsley")

// RETRIEVE CUSTOM OBJECT
// 1. Get the `Data` from UserDefaults
// 2. Decode the `Data` into the custom object
// ------

// 1.
let dogData = defaults.data(forKey: "Kingsley")!
// 2.
let decodedDog = try! JSONDecoder().decode(Dog.self, from: dogData)

// REMOVE CUSTOM OBJECT
// This is the same as removing any value or object from UserDefaults

defaults.removeObject(forKey: "Kingsley")
```

#### Q: Why not just plug every tab straight into a single scene?
A: You can if a section never digs any deeper. For example, a static “About” page can sit directly under a tab with no Navigation Controller in sight.

The moment a section needs a second screen—‑say your Favorites list pushes a Details page—‑you need a place to:
	1.	Remember the stack (Favorites → Details → maybe Edit Details …).
	2.	Draw and animate that “Back” behavior automatically.
	3.	Keep the top navigation bar in sync (title, buttons, large/small style).

Apple’s answer is “wrap the root screen of that tab in a Navigation Controller.” It supplies all that for free; you just say pushViewController(_:animated:) or use a Show segue and the controller takes care of the rest.

#### What the Tab Bar Controller needs

A UITabBarController is basically an array of child view controllers.
When the storyboard is inflated it asks Apple’s runtime:

“Hey, give me the list of kids I’m supposed to manage.”

Those children are provided via relationship segues whose type is view controllers.

If you don’t wire the segue, the tab bar has no idea the navigation controller exists—so that tab would show up blank.

#### etc.

	•	viewDidLoad → set‑and‑forget wiring.
	•	viewWillAppear → always‑up‑to‑date data fetch.
	•	defer → bullet‑proof “do this last, no excuses.”
	•	Fetch list → assign → reload → defer updates UI polish.