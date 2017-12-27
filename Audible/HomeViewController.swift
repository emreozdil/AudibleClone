//
//  HomeViewController.swift
//  Audible
//
//  Created by Emre Özdil on 27.12.2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "We are logged in"

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(handleLogOut))

        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)

        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    @objc func handleLogOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)

        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
}
