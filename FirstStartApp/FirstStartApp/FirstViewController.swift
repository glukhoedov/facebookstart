//
//  FirstViewController.swift
//  FirstStartApp
//
//  Created by Борис Глухоедов on 28/05/2019.
//  Copyright © 2019 glukhoedov. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var loginFacebook: UIButton!
    @IBOutlet weak var logoutFacebook: UIButton!
    
    var loginSuccess = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if AccessToken.current != nil {
            logoutFacebook.isHidden = false
            FacebookManager.getUserData(completion: {
                self.loginFacebook.setTitle("Continue as \(String(describing: User.currentUser.email))", for: .normal)
            })
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (AccessToken.current != nil && loginSuccess == true) {
            performSegue(withIdentifier: "ClientView", sender: self)
        }
    }
    
    @IBAction func facebookLogoutButton(_ sender: UIButton) {
        FacebookManager.shared.logOut()
        User.currentUser.resetUser()
        logoutFacebook.isHidden = true
        loginFacebook.setTitle("Login with Facebook", for: .normal)
    }
    
    @IBAction func facebookLoginButton(_ sender: UIButton) {
        if AccessToken.current != nil {
            self.loginSuccess = true
            self.viewDidAppear(true)
        } else {
            FacebookManager.shared.logIn(permissions: ["public_profile", "email"], from: self, handler: {(result, error) in
                if error == nil {
                    FacebookManager.getUserData(completion: {
                        self.loginSuccess = true
                        self.viewDidAppear(true)
                    })
                }
            })
        }
    }

}

