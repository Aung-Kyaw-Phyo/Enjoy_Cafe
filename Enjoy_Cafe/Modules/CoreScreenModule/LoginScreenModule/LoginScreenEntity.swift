//
//  LoginScreenEntity.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

struct LoginRequestModel: Codable {
    let emailAddress: String
    let password: String
}

extension LoginRequestModel {
    var keepMappingDict: [String: String] {
        [
            "Email": "Dev.aungkyawphyo@gmail.com",
            "Password": "password"
        ]
    }
}

extension UITextField {
    func designableUITextField(image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = image
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        self.tintColor = .black
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 1)
        bottomLayer.backgroundColor = UIColor.black.cgColor
        self.layer.addSublayer(bottomLayer)
    }
    
    func addVisibleButton() {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        let container: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
        container.addSubview(button)
        rightView = container
        rightViewMode = .always
        button.addTarget(self, action: #selector(visibleBtnAction(_:)), for: .touchUpInside)
    }
    
    @objc private func visibleBtnAction(_ sender: UIButton) {
        self.isSecureTextEntry = sender.isSelected
        sender.isSelected = !sender.isSelected
    }
    
}
