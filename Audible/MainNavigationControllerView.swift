//
//  MainNavigationControllerView.swift
//  Audible
//
//  Created by Emre Özdil on 27.12.2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        if isLoggedIn() {
            // assume user is logged in
            let homeViewController = HomeViewController()
            viewControllers = [homeViewController]
        } else {
            perform(#selector(showLoginViewController), with: nil, afterDelay: 0.001)
        }
    }

    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }

    @objc func showLoginViewController() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
}
