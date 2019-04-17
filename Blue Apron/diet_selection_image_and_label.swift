//
//  diet_selection_image_and_label.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-10.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class diet_selection_image_and_label: UICollectionViewCell

{
    @IBOutlet weak var fadeImage: UIImageView!
    @IBOutlet weak var diet_image: UIImageView!
    @IBOutlet weak var diet_label: UILabel!
    @IBOutlet weak var itemSelected: UIImageView!
    
    override var isSelected: Bool
        {
        didSet
        {
            if self.isSelected
            {
                itemSelected.isHidden = !isSelected
                fadeImage.isHidden = !isSelected
                
            }
            else
            {
                itemSelected.isHidden = true
                fadeImage.isHidden = true
                
            }
            
        }
    }
    
}
