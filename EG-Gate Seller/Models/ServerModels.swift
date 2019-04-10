//
//  ServerModels.swift
//  EG-Gate Seller
//
//  Created by Basem Abduallah on 4/9/19.
//  Copyright © 2019 Basem Abduallah. All rights reserved.
//

import Foundation
//"header":{
//    "appUID":"SellerAndroid",
//    "timestamp":1554032321876
//},


struct ReqUser:Codable {
    var email: String
    var password: String
    var oldPassword: String?
    init(email: String, password: String, oldPassword: String?) {
        self.email = email
        self.password = password
        self.oldPassword = oldPassword
    }
}
struct ReqHeader:Codable {
    var appUID = "SellerIOS"
    var timestamp = Int64(Date().timeIntervalSince1970 * 1000)
    var appVersion = "1.0"
}

struct UserRequest:Codable{
    private var header:ReqHeader
    var user:ReqUser
    
    init(email: String, password: String, oldPassword: String?) {
        header = ReqHeader()
        user = ReqUser(email: email, password: password, oldPassword: oldPassword)
    }
    
    
}
struct  ResponseStatus :Codable{
    
    var statusCode = 0
}
struct FailedResponse:Codable {
    
    var status = ResponseStatus()
}
struct UserResponse:Codable {
    
    var user = "User()"
}
