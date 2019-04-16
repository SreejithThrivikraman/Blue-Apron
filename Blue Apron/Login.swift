//
//  Login.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-09.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit
import TransitionButton

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
    
    //Anna
    

   
}
