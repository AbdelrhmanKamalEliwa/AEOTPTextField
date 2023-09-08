//
//  SwiftUIView.swift
//  AEOTPTextFieldExample
//
//  Created by Abdelrhman Eliwa on 01/06/2022.
//
import SwiftUI
import AEOTPTextField

struct SwiftUIView: View {
    // MARK: - PROPERTIES
    //
    @State private var otp: String = ""
    @State private var isFirstResponder: Bool = false
    @State private var alertIsPresented: Bool = false
    
    // MARK: - BODY
    //
    var body: some View {
        VStack(alignment: .leading) {
            Text("Please, enter the code")
                .padding(.top, 60)
                .padding(.leading, 16)
            
            AEOTPView(text: $otp, isFirstResponder: $isFirstResponder, otpFilledBackgroundColor: .green) {
                alertIsPresented = true
            } //: AEOTPView
            .padding()
            
            Button("Focus"){
                isFirstResponder.toggle()
            }
            
            
            Spacer()
        } //: VStack
        .alert(isPresented: $alertIsPresented) {
            otpAlert
        } //: alert
    } //: body
    
    private var otpAlert: Alert {
        Alert(
            title: Text("Verify Result"),
            message: Text(otp == "123456" ? "Success" : "Failure"),
            dismissButton: .default(Text("Done"), action: {
                alertIsPresented = false
            })
        )
    } //: otpAlert
}

