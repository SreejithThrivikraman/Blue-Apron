//
//  dishDetails.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-23.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class dishDetails: UIViewController {

    @IBOutlet weak var ingridientsDetails: UITextView!
    
    @IBOutlet weak var preparationDetails: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ingridientsDetails.layer.borderColor = UIColor.gray.cgColor
        ingridientsDetails.layer.borderWidth = 1.0;
        ingridientsDetails.layer.cornerRadius = 8;
        
        preparationDetails.layer.borderColor = UIColor.gray.cgColor
        preparationDetails.layer.borderWidth = 1.0;
        preparationDetails.layer.cornerRadius = 8;
    }
    

   
}
