//
//  Register_username_pass.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-17.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Register_username_pass: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signMe: UIButton!
    
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        signMe.layer.cornerRadius = 20
        userName.placeholder = "Username"
        password.placeholder = "Password"
        
        // Do any additional setup after loading the view.
    }

    @IBAction func signupAction(_ sender: Any)
    {
        if userName.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: userName.text!, password: password.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}
