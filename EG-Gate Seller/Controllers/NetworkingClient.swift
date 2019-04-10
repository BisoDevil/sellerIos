//
//  NetworkingClient.swift
//  EG-Gate Seller
//
//  Created by Basem Abduallah on 4/9/19.
//  Copyright © 2019 Basem Abduallah. All rights reserved.
//

import Foundation
class NetworkingClient {
    
    public func login(email:String,password:String,completion: @escaping (UserResponse?, Int?) -> ()){
        let req = UserRequest(email: email, password: password,oldPassword: nil)
        baseRequest(path: "login", requestClass: req, responseClass: UserResponse.self,completion: completion)
    }
    
    
   
    private func baseRequest<T:Codable,H:Codable>(path:String,
                                                  requestClass:T,
                                                  responseClass:H.Type,
                                                  completion: @escaping (H?, Int?) -> ()){
        var request = URLRequest(url: URL(string: "http://196.204.194.115:8080/EG-Gate/seller/mobile/"+path)!)
        request.httpMethod = "POST"
        
        guard let body = try? JSONEncoder().encode(requestClass) else {
            return
        }
        request.httpBody = body
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
//       print("Request Body: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print("response: ", String(data: data!, encoding: .utf8) ?? "no body data")
            let statusCode = try? JSONDecoder().decode(FailedResponse.self, from: data!)
           
            switch statusCode!.status.statusCode{
            case 200:
                let realData = try? JSONDecoder().decode(H.self, from: data!)
                completion(realData,nil)
                break
             default:
                completion(nil,statusCode!.status.statusCode)
                break
           
            }
                   
           
        }.resume()
        
    }
}
