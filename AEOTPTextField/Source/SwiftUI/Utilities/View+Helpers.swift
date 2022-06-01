//
//  View+Helpers.swift
//  AEOTPTextField
//
//  Created by Abdelrhman Eliwa on 01/06/2022.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    @_disfavoredOverload
    @ViewBuilder public func onChange<V>(of value: V, perform action: @escaping (V) -> Void) -> some View where V: Equatable {
        if #available(iOS 14, *) {
            onChange(of: value, perform: action)
        } else {
            modifier(ChangeObserver(newValue: value, action: action))
        }
    }
}
