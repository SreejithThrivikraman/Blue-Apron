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
    
    @IBOutlet weak var profileName: UITextField!
    public var username_data : String = ""
    public var password_data : String = ""
    var ref:DatabaseReference?
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        signMe.layer.cornerRadius = 20
        userName.placeholder = "Username"
        password.placeholder = "Password"
        ref = Database.database().reference()
       
        
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func signupAction(_ sender: Any)
    {
        username_data  = profileName.text as! String
        password_data  = userName.text as! String
        
        if (userName.text == "")
        {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: userName.text!, password: password.text!) { (user, error) in
                
                if error == nil
                {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "diet")
                    self.present(vc!, animated: true, completion: nil)
                    
                    // call function here.
                    writeData(parentRef: "Users", childRef: self.username_data, value: "0")
                    
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(self.username_data, forKey: "Uname")
                    
                    // userDefaults.setFloat(12.34, forKey: "myFloatKey")
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
        
        func writeData(parentRef: String, childRef: String, value: String)
        {
            ref?.child(parentRef).child(childRef).child("email").setValue(userName.text)
           // ref?.child(childRef).child("Halooo").value(forKey: "123")
            
        }
    }
    
}
