//
//  makeMyDish.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-19.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class makeMyDish: UIViewController
{

   
    @IBOutlet weak var ingridients_text: UITextView!
    @IBOutlet weak var ingridientEntry: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var ingridientPool: UITextView!
    @IBOutlet weak var recipePool: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ingridients_text.isEditable = false
        

        submitButton.layer.borderColor = UIColor.white.cgColor
        cancelButton.layer.borderColor = UIColor.white.cgColor
        addButton.layer.borderColor    = UIColor.white.cgColor
        
        submitButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        addButton.layer.cornerRadius    = 10
        
        submitButton.layer.borderWidth = 1
        cancelButton.layer.borderWidth = 1
        addButton.layer.borderWidth    = 1
        
        recipePool.layer.borderColor = UIColor.gray.cgColor
        recipePool.layer.borderWidth = 1.0;
        recipePool.layer.cornerRadius = 8;
        
        ingridientPool.layer.borderColor = UIColor.gray.cgColor
        ingridientPool.layer.borderWidth = 1.0;
        ingridientPool.layer.cornerRadius = 8;
    }
    


}
