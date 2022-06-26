//
//  AEOTPTextFieldImplementation.swift
//  ViberTemplate
//
//  Created by Abdelrhman Eliwa on 09/05/2021.
//

import UIKit

class AEOTPTextFieldImplementation: NSObject, UITextFieldDelegate {
    weak var implementationDelegate: AEOTPTextFieldImplementationProtocol?

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < implementationDelegate?.digitalLabelsCount ?? 0 || string == ""
    }
}
