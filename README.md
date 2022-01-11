# TextFieldFormatter

Simple Text Formatter (Credit Card Number, Phone Number, Serial Number etc.) Can be used in all text inputs according to the format pattern. If desired, large minor character restrictions can be made in the format pattern.

## Display Visual Example 

----
![Visual1](http://g.recordit.co/BAaWSNTpZK.gif)


## Installation

### Manual

The easiest way to install this framework is to drag and drop the `TextFieldFormatter/TextFieldFormatter/Classes` folder into your project.

### CocoaPods

Add the following to your Podfile:
``` ruby
use_frameworks!
pod 'TextFieldFormatter'
```

### Interface Builder

The library is a simple drop-in, as soon as you set your subclass to one of the effects and your module to UITextField -> `TextFieldFormatter` you will be able to see all the IBDesignable settings in the storyboard.

### Code

If you like to get your hands dirty, you can use them just like you would normally use any `UITextField`

#### Phone Number

``` swift
let textField = TextFieldFormatter(frame: textFieldFrame)

textField.pattern = "(NNN) NNN NN NN"
textField.text = "9993334422" // showing text -> "(999) 333 44 22"

view.addSubView(textField)
```

#### Credit Card

``` swift
let textField = TextFieldFormatter(frame: textFieldFrame)

textField.pattern = "NNNN NNNN NNNN NNNN"
textField.text = "9999333344442222" // showing text -> "9999 3333 4444 2222"

view.addSubView(textField)
```

#### Serial Number

``` swift
let textField = TextFieldFormatter(frame: textFieldFrame)

textField.pattern = "CC NNNN"
textField.text = "cv9999" // showing text -> "CV 9999"

view.addSubView(textField)
```


## How to use ?

If the text format is entered uppercase, the character input from the keyboard is displayed as a upper case character.

'x' or 'X' -> Any character

'c' or 'C' -> Alphabetic character

'n' or 'N' -> Numerical character

## Author

Anil ORUC, orucanil@gmail.com

## License

TextFieldFormatter is available under the MIT license. See the LICENSE file for more info.


Is that simple.

Build and run the project files. Enjoy more examples!
