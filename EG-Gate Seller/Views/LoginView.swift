//
//  ViewController.swift
//  EG-Gate Seller
//
//  Created by Basem Abduallah on 4/8/19.
//  Copyright © 2019 Basem Abduallah. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginView: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBOutlet weak var txtUsername: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    
    @IBAction func login(_ sender: AppButton) {
        let network = NetworkingClient()
        network.login(email: txtUsername.text!, password: txtPassword.text!){[unowned self] user,code in
            if let user = user{
                let defaults = UserDefaults()
                defaults.set(user.user.id, forKey: "UserID")
                defaults.set(true, forKey: "logged")
                defaults.synchronize()
                
                
            }else{
                switch code {
                case 400:
                    print("User is not Exists")
                    self.presentAlert(message: "User is not Exists", title: "Error logging")
                    break
                case 440:
                    print("Wrong password")
                    self.presentAlert(message: "Wrong password", title: "Error logging")
                    break
                case 450:
                    print("You're not approved yet")
                    self.presentAlert(message: "You're not approved yet", title: "Error Logging")
                    break
                default:
                    print("as")
                }
            }
        }
        
        
    }
    private func presentAlert(message : String,title:String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) {
                UIAlertAction in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func goToRegister(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "segueRegister", sender: nil)
        }
    }
}

