//
//  AEOTPViewRepresentable.swift
//  AEOTPTextField-SwiftUI
//
//  Created by Abdelrhman Eliwa on 31/05/2022.
//

import SwiftUI

@available(iOS 13.0, *)
struct AEOTPViewRepresentable: UIViewRepresentable {
    @Binding private var text: String
    private let slotsCount: Int
    private let otpDefaultCharacter: String
    private let otpBackgroundColor: UIColor
    private let otpFilledBackgroundColor: UIColor
    private let otpCornerRaduis: CGFloat
    private let otpDefaultBorderColor: UIColor
    private let otpFilledBorderColor: UIColor
    private let otpDefaultBorderWidth: CGFloat
    private let otpFilledBorderWidth: CGFloat
    private let otpTextColor: UIColor
    private let otpFontSize: CGFloat
    private let otpFont: UIFont
    private let isSecureTextEntry: Bool
    private let onCommit: (() -> Void)?
    private let textField: AEOTPTextFieldSwiftUI
        
    init(
        text: Binding<String>,
        slotsCount: Int = 6,
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
        onCommit: (() -> Void)? = nil
    ) {
        self._text = text
        self.slotsCount = slotsCount
        self.otpDefaultCharacter = otpDefaultCharacter
        self.otpBackgroundColor = otpBackgroundColor
        self.otpFilledBackgroundColor = otpFilledBackgroundColor
        self.otpCornerRaduis = otpCornerRaduis
        self.otpDefaultBorderColor = otpDefaultBorderColor
        self.otpFilledBorderColor = otpFilledBorderColor
        self.otpDefaultBorderWidth = otpDefaultBorderWidth
        self.otpFilledBorderWidth = otpFilledBorderWidth
        self.otpTextColor = otpTextColor
        self.otpFontSize = otpFontSize
        self.otpFont = otpFont
        self.isSecureTextEntry = isSecureTextEntry
        self.onCommit = onCommit
        
        self.textField = AEOTPTextFieldSwiftUI(
            slotsCount: slotsCount,
            otpDefaultCharacter: otpDefaultCharacter,
            otpBackgroundColor: otpBackgroundColor,
            otpFilledBackgroundColor: otpFilledBackgroundColor,
            otpCornerRaduis: otpCornerRaduis,
            otpDefaultBorderColor: otpDefaultBorderColor,
            otpFilledBorderColor: otpFilledBorderColor,
            otpDefaultBorderWidth: otpDefaultBorderWidth,
            otpFilledBorderWidth: otpFilledBorderWidth,
            otpTextColor: otpTextColor,
            otpFontSize: otpFontSize,
            otpFont: otpFont,
            isSecureTextEntry: isSecureTextEntry
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, slotsCount: slotsCount, onCommit: onCommit)
    }
    
    func makeUIView(context: Context) -> AEOTPTextFieldSwiftUI {
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: AEOTPTextFieldSwiftUI, context: Context) { }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding private var text: String
        
        private let slotsCount: Int
        private let onCommit: (() -> Void)?
        
        
        init(
            text: Binding<String>,
            slotsCount: Int,
            onCommit: (() -> Void)?
        ) {
            self._text = text
            self.slotsCount = slotsCount
            self.onCommit = onCommit
            
            super.init()
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
            
            if textField.text?.count == slotsCount {
                onCommit?()
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let characterCount = textField.text?.count else { return false }
            return characterCount < slotsCount || string.isEmpty
        }
    }
}
