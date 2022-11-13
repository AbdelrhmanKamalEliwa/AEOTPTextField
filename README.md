# ▤ AEOTPTextField (UIKit & SwiftUI)

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
  * [UIKit Code Implementation](#UIKit-code-implementation)
  * [SwiftUI Code Implementation](#SwiftUI-code-implementation)
* **[UIKit Customization](#UIKit-customization)**
  * [AEOTPTextField](#AEOTPTextField-UIKit)
  * [Example of Customization](#Example-of-Customization-UIKit)
* **[SwiftUI Customization](#SwiftUI-customization)**
  * [AEOTPTextField](#AEOTPTextField-SwiftUI)
  * [Example of Customization](#Example-of-Customization-SwiftUI)
* **[References](#References)**
* **[Contributed](#Contributed)**
* **[License](#License)**
* **[Author](#Author)**

## Overview

AEOTPTextField is a simple and easy text field control written in Swift.
- [x] **It can be implemented in storyboard without a single line of [code](#code-less-storyboard-implementation).**
- [x] Highly customizable without needing to write tons of custom code.
- [x] Supports both portrait and landscape views.
- [x] **Supports SwiftUI [implementation](#swiftui-code-implementation).**

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

### UIKit Code Implementation
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

### SwiftUI Code Implementation
First:
```swift
import AEOTPTextField
```
Then, use tha `AEOTPView` in your SwiftUI View, do something like this:
``` swift
struct SwiftUIView: View { 
    @State private var otp: String = ""
    
    var body: some View {
        AEOTPView(text: $otp)
    }
}
```
You have done.

### UIKit Customization
AEOTPTextField
`AEOTPTextField` supports the following:
``` swift
    /// The default character placed in the text field slots
    public var otpDefaultCharacter = ""
    /// The default background color of the text field slots before entering a character
    public var otpBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
    /// The default background color of the text field slots after entering a character
    public var otpFilledBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
    /// The default corner raduis of the text field slots
    public var otpCornerRaduis: CGFloat = 10
    /// The default border color of the text field slots before entering a character
    public var otpDefaultBorderColor: UIColor = .clear
    /// The border color of the text field slots after entering a character
    public var otpFilledBorderColor: UIColor = .darkGray
    /// The default border width of the text field slots before entering a character
    public var otpDefaultBorderWidth: CGFloat = 0
    /// The border width of the text field slots after entering a character
    public var otpFilledBorderWidth: CGFloat = 1
    /// The default text color of the text
    public var otpTextColor: UIColor = .black
    /// The default font size of the text
    public var otpFontSize: CGFloat = 14
    /// The default font of the text
    public var otpFont: UIFont = UIFont.systemFont(ofSize: 14)
```
Aslo you can use isSecureTextEntry property:
``` swift
    otpTextField.isSecureTextEntry = true
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
### SwiftUI Customization
AEOTPTextField
`AEOTPTextField` supports the following:
``` swift
    // MARK: - INIT
    //
    /// The Initializer of the `AEOTPTextView`
    /// - Parameters:
    ///   - text: The OTP text that entered into AEOTPView
    ///   - slotsCount: The number of OTP slots in the AEOTPView
    ///   - width: The default width of the AEOTPView
    ///   - height: The default height of the AEOTPView
    ///   - otpDefaultCharacter: The default character placed in the text field slots
    ///   - otpBackgroundColor: The default background color of the text field slots before entering a character
    ///   - otpFilledBackgroundColor: The default background color of the text field slots after entering a character
    ///   - otpCornerRaduis: The default corner raduis of the text field slots
    ///   - otpDefaultBorderColor: The default border color of the text field slots before entering a character
    ///   - otpFilledBorderColor: The border color of the text field slots after entering a character
    ///   - otpDefaultBorderWidth: The default border width of the text field slots before entering a character
    ///   - otpFilledBorderWidth: The border width of the text field slots after entering a character
    ///   - otpTextColor: The default text color of the text
    ///   - otpFontSize: The default font size of the text
    ///   - otpFont: The default font of the text
    ///   - isSecureTextEntry: A Boolean value that indicates whether the text object disables text copying and, in some cases, hides the text that the user enters.
    ///   - enableClearOTP: A Boolean value that used to allow the `AEOTPView` clear the OTP and set the `AEOTPView` to the default state when you set the OTP Text with Empty Value
    ///   - onCommit: A Closure that fires when the OTP returned
    public init(
        text: Binding<String>,
        slotsCount: Int = 6,
        width: CGFloat = UIScreen.main.bounds.width * 0.8,
        height: CGFloat = 40,
        otpDefaultCharacter: String = "",
        otpBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1),
        otpFilledBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1),
        otpCornerRaduis: CGFloat = 10,
        otpDefaultBorderColor: UIColor = .clear,
        otpFilledBorderColor: UIColor = .darkGray,
        otpDefaultBorderWidth: CGFloat = 0,
        otpFilledBorderWidth: CGFloat = 1,
        otpTextColor: UIColor = .black,
        otpFontSize: CGFloat = 14,
        otpFont: UIFont = UIFont.systemFont(ofSize: 14),
        isSecureTextEntry: Bool = false,
        enableClearOTP: Bool = false,
        onCommit: (() -> Void)? = nil
    ) {
```

Example of Customization
``` swift
    AEOTPView(
                text: $otp,
                slotsCount: 4,
                width: .infinity,
                height: 50,
                otpFilledBackgroundColor: .green,
                isSecureTextEntry: true,
                onCommit: {
                    // do something
                }
            )
        .padding()

```

## References
- https://www.youtube.com/watch?v=mHxAvSs914g

## Contributed
This is an open source project, so feel free to contribute.

## License

AEOTPTextField is available under the MIT license.

## Author

[Abdelrhman Eliwa](https://github.com/AbdelrhmanKamalEliwa), made this with ❤️.
