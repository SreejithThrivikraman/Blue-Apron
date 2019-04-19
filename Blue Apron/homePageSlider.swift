//
//  homePageSlider.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-18.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class homePageSlider: UIViewController {

    @IBOutlet weak var dishImage: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dishImage.layer.cornerRadius = 10.0
        dishImage.layer.masksToBounds = true
        
       
        
    }
    

   

}
