//
//  AllergenSelection.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-15.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class AllergenSelection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    @IBOutlet weak var allergenCollectionGrid: UICollectionView!
    
    let allergen_names = ["Alcohol-Free","Crustacean-Free","Dairy-Free","Egg-Free","Fish-Free","Gluten-Free","Lupine-Free","Mustard-Free","Celery-Free","Oil-Free","Peanut-Free","Red Meat Free","Sesame-Free","Sugar-Free","Pork-Free","shellfish-Free","Soy-Free","Treenut-Free","Wheat-Free"]
    
    
    
    
    let allergen_images: [UIImage] =  [UIImage(named: "alcoholFree")!,
                                    UIImage(named: "crustaceanFree")!,
                                    UIImage(named: "dairyFree")!,
                                    UIImage(named: "eggFree")!,
                                    UIImage(named: "fishFree")!,
                                    UIImage(named: "glutenFree")!,
                                    UIImage(named: "lupineFree")!,
                                    UIImage(named: "mustardFree")!,
                                    UIImage(named: "noCelery")!,
                                    UIImage(named: "noOil")!,
                                    UIImage(named: "noPeanut")!,
                                    UIImage(named: "noRedMeat")!,
                                    UIImage(named: "noSesame")!,
                                    UIImage(named: "noSugar")!,
                                    UIImage(named: "porkFree")!,
                                    UIImage(named: "shellfishFree")!,
                                    UIImage(named: "soyFree")!,
                                    UIImage(named: "treenutFree")!,
                                    UIImage(named: "wheatFree")!    ]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allergens", for: indexPath) as! allergen
        
        cell.allergenName.text = allergen_names[indexPath.item ]
        cell.allergenImage.image = allergen_images[indexPath.item ]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
         return allergen_names.count
    }
    
   
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
