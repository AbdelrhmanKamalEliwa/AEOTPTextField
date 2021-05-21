//
//  AEOTPTextField.swift
//  AEOTPTextField
//
//  Created by Abdelrhman Eliwa on 10/12/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

public protocol AEOTPTextFieldDelegate: AnyObject {
    func didUserFinishEnter(the code: String)
}

public class AEOTPTextField: UITextField {

    public var otpDefaultCharacter = ""
    public var otpBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
    public var otpFilledBackgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
    public var otpCornerRaduis: CGFloat = 10
    public var otpDefaultBorderColor: UIColor = .clear
    public var otpFilledBorderColor: UIColor = .darkGray
    public var otpDefaultBorderWidth: CGFloat = 0
    public var otpFilledBorderWidth: CGFloat = 1
    public var otpTextColor: UIColor = .black
    public var otpFontSize: CGFloat = 14
    public var otpFont: UIFont = UIFont.systemFont(ofSize: 14)
    public weak var otpDelegate: AEOTPTextFieldDelegate?
    
    private var implementation = AEOTPTextFieldImplementation()
    private var isConfigured = false
    private var digitLabels = [UILabel]()
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    public func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        configureTextField()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        addGestureRecognizer(tapRecognizer)
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        borderStyle = .none
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = implementation
        implementation.implementationDelegate = self
    }
    
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        for _ in 1 ... count {
            let label = createLabel()
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
        return stackView
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = otpBackgroundColor
        label.layer.cornerRadius = otpCornerRaduis
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = otpTextColor
        label.font = label.font.withSize(otpFontSize)
        label.font = otpFont
        label.isUserInteractionEnabled = true
        label.layer.masksToBounds = true
        label.text = otpDefaultCharacter
        return label
    }
    
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else { return }
        for labelIndex in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[labelIndex]
            if labelIndex < text.count {
                let index = text.index(text.startIndex, offsetBy: labelIndex)
                currentLabel.text = String(text[index])
                currentLabel.layer.borderWidth = otpFilledBorderWidth
                currentLabel.layer.borderColor = otpFilledBorderColor.cgColor
                currentLabel.backgroundColor = otpFilledBackgroundColor
            } else {
                currentLabel.text = otpDefaultCharacter
                currentLabel.layer.borderWidth = otpDefaultBorderWidth
                currentLabel.layer.borderColor = otpDefaultBorderColor.cgColor
                currentLabel.backgroundColor = otpBackgroundColor
            }
        }
        if text.count == digitLabels.count {
            otpDelegate?.didUserFinishEnter(the: text)
        }
    }
}

extension AEOTPTextField: AEOTPTextFieldImplementationProtocol {
    func digitalLabelsCount() -> Int {
        digitLabels.count
    }
}
