//
//  Login.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-09.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit
import TransitionButton

import Firebase
import FirebaseAuth

class Login: UIViewController

{
    
    
    @IBOutlet weak var Text_Password: UITextField!
    @IBOutlet weak var Text_userName: UITextField!
    @IBOutlet weak var button_login: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
       
        button_login.layer.cornerRadius = 20
        Text_userName.placeholder = "Username"
        Text_Password.placeholder = "Password"
        
     
        
    }
    
    @IBAction func login_function(_ sender: Any)
    {
        
        if self.Text_userName.text == "" || self.Text_Password.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.Text_userName.text!, password: self.Text_Password.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else
                {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
   
}
