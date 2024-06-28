//
//  LoginScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var delegate: LoginScreenProtocols?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        passwordTextField.addVisibleButton()
        textFieldSetup()
        emailTextField.designableUITextField(image: UIImage(systemName: "envelope.fill")!)
        passwordTextField.designableUITextField(image: UIImage(systemName: "lock.fill")!)
    }
    
    private func textFieldSetup() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if (delegate?.clickedOnLoginButton(inputData: LoginRequestModel(emailAddress: emailTextField.inputValue, password: passwordTextField.inputValue))) != nil {
        } else if emailTextField.text == "Dev.aungkyawphyo@gmail.com" && passwordTextField.text == "password" {
            loginRouter()
        } else {
            if emailTextField.text != "Dev.aungkyawphyo@gmail.com" {
                showTextFieldErrorLabel(error: ValidationErrors.emailError)
            } else if passwordTextField.text != "password" {
                showTextFieldErrorLabel(error: ValidationErrors.passwordError)
            }
        }
    }
    
    private func loginRouter() {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DesignableTabBarViewController") as? DesignableTabBarViewController else {return}
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }

}

extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailErrorLabel.text = ""
        } else {
            passwordErrorLabel.text = ""
        }
    }
}

extension LoginScreenViewController: LoginScreenProtocols {
    func showTextFieldErrorLabel(error: ValidationErrors) {
        if error == .emailError {
            emailErrorLabel.text = error.rawValue
        } else {
            passwordErrorLabel.text = error.rawValue
        }
    }
    
    func clickedOnLoginButton(inputData: LoginRequestModel) {
        if emailTextField.text == "Dev.aungkyawphyo@gmail.com" {
            loginRouter()
        } else if passwordTextField.text == "password" {
            loginRouter()
        }
    }
}
