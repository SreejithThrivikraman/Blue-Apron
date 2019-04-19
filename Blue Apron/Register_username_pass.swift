//
//  Register_username_pass.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-17.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

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


}
