//
//  AEOTPView.swift
//  AEOTPTextField-SwiftUI
//
//  Created by Abdelrhman Eliwa on 01/06/2022.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
public struct AEOTPView: View {
    // MARK: - PROPERTIES
    //
    @State private var flag: Bool = false
    @Binding private var text: String
    
    private let slotsCount: Int
    private let width: CGFloat
    private let height: CGFloat
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
    private let enableClearOTP: Bool
    private var onCommit: (() -> Void)?
    
    // MARK: - INIT
    //
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
        self._text = text
        self.slotsCount = slotsCount
        self.width = width
        self.height = height
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
        self.enableClearOTP = enableClearOTP
        self.onCommit = onCommit
    }
    
    // MARK: - BODY
    //
    public var body: some View {
        ZStack {
            if flag {
                otpView
            } else {
                otpView
            }
        } //: ZStack
        .frame(width: width, height: height)
        .onChange(of: text) { newValue in
            guard enableClearOTP else { return }
            if newValue.isEmpty {
                flag.toggle()
            } //: condition
        } //: onChange
    } //: body
    
    // MARK: - VIEWS
    //
    var otpView: some View {
        AEOTPViewRepresentable(
            text: $text,
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
            isSecureTextEntry: isSecureTextEntry,
            onCommit: onCommit
        )
    } //: otpView
}
