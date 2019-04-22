//
//  recipePool.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-22.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class recipePool: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource

{
    
    @IBOutlet weak var dishImageSlider: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
  
    
    var timer   = Timer()
    var counter = 0

    
    let sampleDish_images: [UIImage] =  [   UIImage(named: "butterChicken")!,
                                            UIImage(named: "dosa")!,
                                            UIImage(named: "puttu")!,
                                            UIImage(named: "samosa")!
                                        ]
    
    let sampleDish_names: [String] =  [   "Butter Chicken","Dosa","Kerala Special Puttu","Samosa" ]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        pageController.numberOfPages = sampleDish_images.count
        pageController.currentPage =  0
        
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dishImage", for: indexPath) as! DishImageClassCollectionViewCell
        
        cell.dishImage.image = sampleDish_images[indexPath.item ]
        cell.dishName.text   = sampleDish_names[indexPath.item]
        cell.dishImage.layer.cornerRadius = 15.0
        cell.dishImage.layer.masksToBounds = true
        
        cell.layer.cornerRadius = 15.0
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    
    @objc func slideImages()
    {
        if counter < sampleDish_images.count
        {
            let index = IndexPath.init(item: counter, section: 0)
            pageController.currentPage = counter
      
            self.dishImageSlider.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter = counter + 1
        }
        else
        {
            counter = 0
            pageController.currentPage = counter
            let index = IndexPath.init(item: counter, section: 0)
            self.dishImageSlider.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        }
    }
    

}
