//
//  userRecipe.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-22.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class userRecipe: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate

{
    
    var timer   = Timer()
    var counter = 0
    
    @IBOutlet weak var userDishCollection: UICollectionView!
    @IBOutlet weak var userDishPageControl: UIPageControl!
    
    let sampleDish_images: [UIImage] =  [   UIImage(named: "butterChicken")!,
                                            UIImage(named: "dosa")!,
                                            UIImage(named: "puttu")!,
                                            UIImage(named: "samosa")!
                                        ]
    
    let sampleDish_names: [String] =  ["Butter Chicken","Dosa","Kerala Special Puttu","Samosa"]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userDishPageControl.numberOfPages = sampleDish_images.count
        userDishPageControl.currentPage =  0
        
        DispatchQueue.main.async
            {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.slideImages), userInfo: nil, repeats: true)
            }
        
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return sampleDish_images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userDishList", for: indexPath) as! userDishPool
        
        cell.userDishImage.image = sampleDish_images[indexPath.item ]
        cell.userDishName.text   = sampleDish_names[indexPath.item]
        cell.userDishImage.layer.cornerRadius = 15.0
        cell.userDishImage.layer.masksToBounds = true
        
        cell.layer.cornerRadius = 15.0
        cell.layer.masksToBounds = true
        return cell
    }
    

    // function to be repeated in 2 sec interval
    @objc func slideImages()
    {
        if counter < sampleDish_images.count
        {
            let index = IndexPath.init(item: counter, section: 0)
            userDishPageControl.currentPage = counter
            self.userDishCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter = counter + 1
          
        }
        else
        {
            counter = 0
            userDishPageControl.currentPage = counter
            let index = IndexPath.init(item: counter, section: 0)
            self.userDishCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        }
    }

}
