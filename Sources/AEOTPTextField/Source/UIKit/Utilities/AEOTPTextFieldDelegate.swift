//
//  AEOTPTextFieldDelegate.swift
//  AEOTPTextField-SwiftUI
//
//  Created by Abdelrhman Eliwa on 01/06/2022.
//

public protocol AEOTPTextFieldDelegate: AnyObject {
    func didUserFinishEnter(the code: String)
}
