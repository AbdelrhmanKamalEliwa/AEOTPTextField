# ▤ AEOTPTextField

### If you like AEOTPTextField, give it a ★ at the top right of this page.


* **[Overview](#overview)**
  * [Preview Samples](#preview-samples) 
* **[Requirements](#requirements)**
* **[Installation](#installation)**
  * [CocoaPods](#cocoapods)
  * [Carthage](#carthage)
  * [Swift Package Manager](#swift-package-manager)
* **[Usage](#usage)**
  * [Code-less Storyboard Implementation](#code-less-storyboard-implementation)
  * [Code Implementation](#code-implementation)
* **[Customization](#customization)**
  * [AEOTPTextField](#AEOTPTextField)
  * [Example of Customization](#Example-of-Customization)
* **[References](#References)**
* **[Contributed](#Contributed)**
* **[License](#License)**
* **[Author](#Author)**

## Overview

AEOTPTextField is a simple and easy text field control written in Swift.
- [x] **It can be implemented in storyboard without a single line of [code](#code-less-storyboard-implementation).**
- [x] Highly customizable without needing to write tons of custom code.
- [x] Support both portrait and landscape views.

Check out the example project to see it in action!
### Preview Samples
| Default |
| --- |
| ![](https://raw.githubusercontent.com/AbdelrhmanKamalEliwa/AEOTPTextField/master/Readme%20assets/AEOTPTextField-Default.gif) |

| With Border | Without Border | Clear Background |
| --- | --- | --- |
| ![](https://raw.githubusercontent.com/AbdelrhmanKamalEliwa/AEOTPTextField/master/Readme%20assets/AEOTPTextField-Default.gif) | ![](https://github.com/AbdelrhmanKamalEliwa/AEOTPTextField/blob/master/Readme%20assets/AEOTPTextField-Without-Border.gif?raw=true) | ![](https://github.com/AbdelrhmanKamalEliwa/AEOTPTextField/blob/master/Readme%20assets/AEOTPTextField-Clear-Background.gif?raw=true) |
|![](https://github.com/AbdelrhmanKamalEliwa/AEOTPTextField/blob/master/Readme%20assets/AEOTPTextField-With-Border.gif?raw=true) | ![](https://github.com/AbdelrhmanKamalEliwa/AEOTPTextField/blob/master/Readme%20assets/AEOTPTextField-Without-Border-2.gif?raw=true) | ![](https://github.com/AbdelrhmanKamalEliwa/AEOTPTextField/blob/master/Readme%20assets/AEOTPTextField-Clear-Background-2.gif?raw=true) |
## Requirements
- [x] Xcode 11.
- [x] Swift 5.
- [x] iOS 10 or higher.

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate AEOTPTextField into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

pod 'AEOTPTextField'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

The integration of AEOTPTextField using Carthage will be available soon.

### Swift Package Manager

The integration of AEOTPTextField using Swift Package Manager will be available soon.

## Usage
### Code-less Storyboard Implementation
1. Add UITextField to your ViewController. Set the `Custom Class` of the UITextField to be `AEOTPTextField` in the **Identity Inspector**. Set the `Module` to `AEOTPTextField` (ignore this step if you've manually added AEOTPTextField to your project).
![](https://github.com/AbdelrhmanKamalEliwa/AEOTPTextField/blob/master/Readme%20assets/Usage-1.png?raw=true)

2. Take an oultlet from the `UITextField` to your `ViewController`.
![](https://github.com/AbdelrhmanKamalEliwa/AEOTPTextField/blob/master/Readme%20assets/Usage-2.png?raw=true)

### Code Implementation
First:
```swift
import AEOTPTextField
```

Setup the otpDelegate and configure the `AEOTPTextField` below `viewDidLoad()`, do something like this:
``` swift
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextField.otpDelegate = self
        otpTextField.configure()
    }
```

To configure the `AEOTPTextField` with a custom slots count, do something like this:
``` swift
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextField.otpDelegate = self
        otpTextField.configure(with: 4)
    }
```

Then, Setup the `AEOTPTextFieldDelegate` method. Add this extension to your `ViewController`, do something like this:
``` swift
extension ViewController: AEOTPTextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        print(code)
    }
}
```
You have done.
### Customization
AEOTPTextField
`AEOTPTextField` supports the following:
``` swift
    // The default character placed in the text field slots
    public var otpDefaultCharacter = ""
    // The default background color of the text field slots before entering a character
    public var otpBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
    // The default background color of the text field slots after entering a character
    public var otpFilledBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
    // The default corner raduis of the text field slots
    public var otpCornerRaduis: CGFloat = 10
    // The default border color of the text field slots before entering a character
    public var otpDefaultBorderColor: UIColor = .clear
    // The border color of the text field slots after entering a character
    public var otpFilledBorderColor: UIColor = .darkGray
    // The default border width of the text field slots before entering a character
    public var otpDefaultBorderWidth: CGFloat = 0
    // The border width of the text field slots after entering a character
    public var otpFilledBorderWidth: CGFloat = 1
    // The default text color of the text
    public var otpTextColor: UIColor = .black
    // The default font size of the text
    public var otpFontSize: CGFloat = 14
    // The default font of the text
    public var otpFont: UIFont = UIFont.systemFont(ofSize: 14)
```

Example of Customization
``` swift
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextField.otpDelegate = self
        otpTextField.otpFontSize = 16
        otpTextField.otpTextColor = .systemRed
        otpTextField.otpCornerRaduis = 5
        otpTextField.otpFilledBorderColor = .blue
        otpTextField.configure(with: 4)
    }
}

```

## References
- https://www.youtube.com/watch?v=mHxAvSs914g

## Contributed
This is an open source project, so feel free to contribute.

## License

AEOTPTextField is available under the MIT license.

## Author

[Abdelrhman Eliwa](https://github.com/AbdelrhmanKamalEliwa), made this with ❤️.
