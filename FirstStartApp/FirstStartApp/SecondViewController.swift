//
//  SecondViewController.swift
//  FirstStartApp
//
//  Created by Борис Глухоедов on 28/05/2019.
//  Copyright © 2019 glukhoedov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = User.currentUser.name
        avatarImage.image = try! UIImage(data: Data(contentsOf: URL(string: User.currentUser.pictureUrl!)!))
        avatarImage.layer.cornerRadius = 70 / 2
        avatarImage.layer.borderWidth = 1.0
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClientLogout" {
            FacebookManager.shared.logOut()
            User.currentUser.resetUser()
        }
    }

}

