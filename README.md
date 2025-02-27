# Codepath IOS 101

Spring 2025 IOS development classwork / hw
WIP

# Table of Contents

1. (2/20) lab1 mariokart starter

   - installed xcode / introduced to xcode basics
   - closure, trailing closure
   - var, let (=constant)

2. (2/26) project1 wordle starter
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
