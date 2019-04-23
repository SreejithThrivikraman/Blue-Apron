//
//  Registration_View.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-10.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Registration_View: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource
{
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var selected_diet : [String] = []
    
    var Uname : String!
    
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
        cell.layer.cornerRadius = 12.0
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! diet_selection_image_and_label
        selected_diet.append(sample_diet[indexPath.item])
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return sample_diet.count
    }
    

    

    @IBOutlet weak var diet_selection_grid: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        diet_selection_grid.allowsMultipleSelection = true
        NextButton.layer.cornerRadius = 20
        ref = Database.database().reference()
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.object(forKey: "Uname")
        {
            
            Uname = value as! String
            print("value is \(Uname)")
            
        }
        
    }
    
    
    func writeData(value: String)
    {
        ref?.child("Users").child(Uname).child("Preference").childByAutoId().setValue(value)
    }
    
    
   // ref?.child(parentRef).child(childRef).child("email").setValue(userName.text)
    
    @IBAction func nextButton(_ sender: Any)
    {
        print(selected_diet)
        for each in selected_diet
        {
            writeData(value: each)
           
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "dash")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    
}
