//
//  FacebookManager.swift
//  FirstStartApp
//
//  Created by Борис Глухоедов on 28/05/2019.
//  Copyright © 2019 glukhoedov. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON

class FacebookManager {
    static let shared = LoginManager()
    
    public class func getUserData(completion: @escaping() -> Void) {
        if AccessToken.current != nil {
            GraphRequest(graphPath: "me", parameters: ["fields": "name, email, picture.type(normal)"]).start(completionHandler: { (connection, result, error) in
                if error == nil {
                    let json = JSON(result!)
                    print(json)
                    
                    User.currentUser.setUser(json)
                    
                    completion()
                }
            })
        }
    }
}
