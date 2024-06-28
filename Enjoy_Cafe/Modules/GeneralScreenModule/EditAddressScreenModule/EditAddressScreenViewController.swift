//
//  EditAddressScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 26/06/2024.
//

import UIKit

class EditAddressScreenViewController: UIViewController {
    
    // MARK: Outlets
//    @IBOutlet weak var usernameTextField: UITextField!
//    @IBOutlet weak var phNumberTextField: UITextField!
//    @IBOutlet weak var addressTextField: UITextField!
//    @IBOutlet weak var postalCodeTextField: UITextField!
//    @IBOutlet weak var descriptionTextField: UITextField!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        textFieldSetup()
    }
    
    private func textFieldSetup() {
       
    }
    
    @IBAction func cancelBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }

}

// MARK: - UITextFieldDelegate
//extension EditAddressScreenViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == usernameTextField {
//            usernameTextField.resignFirstResponder()
//            if phNumberTextField.text == "" {
//                phNumberTextField.becomeFirstResponder()
//            }
//        } else if textField == phNumberTextField {
//            phNumberTextField.resignFirstResponder()
//            if addressTextField.text == "" {
//                addressTextField.becomeFirstResponder()
//            }
//        } else if textField == addressTextField {
//            addressTextField.resignFirstResponder()
//            if postalCodeTextField.text == "" {
//                postalCodeTextField.becomeFirstResponder()
//            }
//        } else if textField == postalCodeTextField {
//            postalCodeTextField.resignFirstResponder()
//            if descriptionTextField.text == "" {
//                descriptionTextField.becomeFirstResponder()
//            }
//        } else {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
//}
