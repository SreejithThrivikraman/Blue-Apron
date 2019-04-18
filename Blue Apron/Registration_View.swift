//
//  Registration_View.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-10.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class Registration_View: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource
{
    
    @IBOutlet weak var NextButton: UIButton!
    
    let sample_diet = ["Balanced Diet","Vegan","Low-Carb","High Fibre","Low-sodium","Low-fat","Palieo Diet","High Protien","Vegetarian"]
    
    

    
    let diet_images: [UIImage] = [  UIImage(named: "bal")!,
                                    UIImage(named: "vegan")!,
                                    UIImage(named: "low_carb")!,
                                    UIImage(named: "highfibre")!,
                                    UIImage(named: "noSodium")!,
                                    UIImage(named: "low fat")!,
                                    UIImage(named: "caveman")!,
                                    UIImage(named: "highProtien")!,
                                    UIImage(named: "vegetarian")!]
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! diet_selection_image_and_label
        
        cell.diet_label.text = sample_diet[indexPath.item ]
        cell.diet_image.image = diet_images[indexPath.item ]
        cell.layer.backgroundColor = UIColor.white.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sample_diet.count
    }
    

    

    @IBOutlet weak var diet_selection_grid: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        diet_selection_grid.allowsMultipleSelection = true
        NextButton.layer.cornerRadius = 20
    }
    
}
