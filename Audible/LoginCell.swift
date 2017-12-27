//
//  LoginCell.swift
//  Audible
//
//  Created by Emre Özdil on 21.12.2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit
import SnapKit

class LoginCell: UICollectionViewCell {

    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    let emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
//        textField.layer.padd
        textField.placeholder = "Enter email"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
        return textField
    }()

    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        return textField
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()

    weak var delegate: LoginViewControllerDelegate?

    @objc func handleLogin(sender: UIButton) {
        delegate?.finishLoggingIn()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)

        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.frame.height*0.2)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
        emailTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(12)
            make.width.equalTo(self.frame.width - 64)
            make.height.equalTo(48)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
            make.width.equalTo(self.frame.width - 64)
            make.height.equalTo(48)
        }
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.width.equalTo(self.frame.width - 64)
            make.height.equalTo(48)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 20, height: bounds.height)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 20, height: bounds.height)
    }
}
