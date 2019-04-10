//
//  ServerModels.swift
//  EG-Gate Seller
//
//  Created by Basem Abduallah on 4/9/19.
//  Copyright © 2019 Basem Abduallah. All rights reserved.
//

import Foundation

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
    
    var user:User
}
struct User :Codable{
    var id:Int
    var code:String
    var sellerContactPerson:String
    var sellerBrand:String
    var mobileNumber:String
    var phoneNumber:String
    var email:String
    var password:String
    var bankAccount:String
    var productLevel:String
    var categoryId:Int
    var knowingFromId:Int
    var memberShipId:Int
    var addressBuildingNumber:String
    var addressStreet:String
    var addressAreaId:Int
    var addressLandmark:String
    var logo:String
    var legalPapers:[String]
    var certificates:[String]
}
