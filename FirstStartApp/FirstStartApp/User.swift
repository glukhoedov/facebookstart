//
//  User.swift
//  FirstStartApp
//
//  Created by Борис Глухоедов on 28/05/2019.
//  Copyright © 2019 glukhoedov. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var name: String?
    var email: String?
    var pictureUrl: String?
    
    static let currentUser = User()
    
    func setUser(_ json: JSON) {
        self.name = json["name"].string
        self.email = json["email"].string
        
        //  "picture" : {
        //"data" : {
          //  "is_silhouette" : false,
        //"url" : "https:\/\/platform-lookaside.fbsbx.com\/platform\/profilepic\/?asid=2343678069186553&height=100&width=100&ext=1561645709&hash=AeR6DqaBgCR43wLJ",
        
        let image = json["picture"].dictionary
        let imageData = image?["data"]?.dictionary
        self.pictureUrl = imageData?["url"]?.string
    }
    
    func resetUser() {
        self.name = nil
        self.email = nil
        self.pictureUrl = nil
    }
}
