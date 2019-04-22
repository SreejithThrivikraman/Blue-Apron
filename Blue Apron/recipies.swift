//
//  recipies.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-22.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class recipies: UIViewController
{
    
    @IBOutlet var Stage: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var receipePoolContainer: UIView!
    @IBOutlet weak var userRecipeContainer: UIView!
    
   
    
    @IBAction func segmentTapped(_ sender: Any)
    {
        var segmentNumber = segmentControl.selectedSegmentIndex
        
        if (segmentNumber == 0)
        {
            userRecipeContainer.alpha = 0
            receipePoolContainer.alpha = 1
        }
        
        else if (segmentNumber == 1)
        {
            userRecipeContainer.alpha = 1
            receipePoolContainer.alpha = 0
            
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userRecipeContainer.alpha = 0
        receipePoolContainer.alpha = 1

        
        userRecipeContainer.layer.borderColor = UIColor.gray.cgColor
        userRecipeContainer.layer.borderWidth = 1.0;
        userRecipeContainer.layer.cornerRadius = 8;
        
        receipePoolContainer.layer.borderColor = UIColor.gray.cgColor
        receipePoolContainer.layer.borderWidth = 1.0;
        receipePoolContainer.layer.cornerRadius = 8;
        
    }
    
}
