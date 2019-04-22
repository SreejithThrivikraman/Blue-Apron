//
//  allergen.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-15.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class allergen: UICollectionViewCell

{
    
    @IBOutlet weak var fadeView: UIImageView!
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var allergenImage: UIImageView!
    @IBOutlet weak var allergenName: UILabel!
    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override var isSelected: Bool
        {
             didSet
             {
                
                if self.isSelected
                {
                     selectedImage.isHidden = !isSelected
                     fadeView.isHidden = !isSelected
                    
                }
                else
                {
                    selectedImage.isHidden = true
                    fadeView.isHidden = true
                    
                }
               
             }
        }
}
