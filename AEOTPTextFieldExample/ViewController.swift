//
//  ViewController.swift
//  AEOTPTextFieldExample
//
//  Created by Abdelrhman Eliwa on 17/05/2021.
//

import UIKit
import AEOTPTextField

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var otpTextField: AEOTPTextField!
    let staticCode = "112233"
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOTPTextField()
    }

    // MARK: Methods
    func setupOTPTextField() {
        otpTextField.otpDelegate = self
        otpTextField.otpFontSize = 16
        otpTextField.otpFilledBackgroundColor = #colorLiteral(red: 0, green: 0.4418689013, blue: 1, alpha: 0.75)
        otpTextField.otpTextColor = .white
        otpTextField.otpFilledBorderWidth = 0
        otpTextField.configure()
    }
    
    func displayAlert(with title: String, message: String, actions: [UIAlertAction]? = nil) {
        guard presentedViewController == nil else { return }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions?.forEach { action in
            alertController.addAction(action)
        }
        present(alertController, animated: true)
    }

}

// MARK: - AEOTPTextField Delegate
extension ViewController: AEOTPTextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        let doneAction = UIAlertAction(title: "Done", style: .default)
        let message = staticCode == code ? "Success" : "Failure"
        displayAlert(with: "Verify Result", message: message, actions: [doneAction])
    }
}

