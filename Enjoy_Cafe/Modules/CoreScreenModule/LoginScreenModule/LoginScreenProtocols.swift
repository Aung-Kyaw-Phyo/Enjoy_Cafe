//
//  LoginScreenProtocols.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

protocol LoginScreenProtocols: AnyObject {
    func showTextFieldErrorLabel(error: ValidationErrors)
    func clickedOnLoginButton(inputData: LoginRequestModel)
}
