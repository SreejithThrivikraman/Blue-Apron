//
//  recipePool.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-22.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class recipePool: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate

{
   
    
    @IBOutlet weak var dishImageSlider: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
  
    @IBOutlet weak var tableCollection: UITableView!
    var imageUrls:[String] = []
    var nameUrls:[String] = []
    var ingredients:[String] = []
    var healthLabels:[String] = []
    var nameCount = Int()
    var timer   = Timer()
    var counter = 0
    var rowIndex = Int()
    var instructionURI = String()
    var selectedJSON = JSON()
    
    let urls: String = "https://test.edamam.com/search?q=meat"
    
//    let sampleDish_images: [UIImage] =  [   UIImage(named: "butterChicken")!,
//                                            UIImage(named: "dosa")!,
//                                            UIImage(named: "puttu")!,
//                                            UIImage(named: "samosa")!
//                                        ]
//
//    let sampleDish_names: [String] =  [   "Butter Chicken","Dosa","Kerala Special Puttu","Samosa" ]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableCollection.dataSource = self
        tableCollection.delegate = self
       
        getCollections(url: urls)
        
        pageController.numberOfPages = imageUrls.count
        pageController.currentPage =  0
        
        self.tableCollection.register(CustomCell.self, forCellReuseIdentifier: "custom")
        
        self.tableCollection.rowHeight = UITableView.automaticDimension
        
        self.tableCollection.estimatedRowHeight = 200
        
//        DispatchQueue.main.async
//            {
//                //self.getCollections(url: self.url)
//
//                self.timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.slideImages), userInfo: nil, repeats: true)
//            }
        
        self.automaticallyAdjustsScrollViewInsets = false;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let counts = json["hits"].count
//        nameCount = counts
        
        
    }
    
    
    func getCollections(url : String){
        
        
        Alamofire.request(url,method : .get).responseJSON{
            response in
            if(response.result.isSuccess){
                let customJSON : JSON = JSON(response.result.value!)
                //self.jsonParse(json: customJSON)
                self.images(json: customJSON)
                print("This is from Parse\(self.nameCount)")
            }else{
                print("Error")
            }
        }
    }
    
    func images(json: JSON){
        
        selectedJSON = json
        let counts = json["hits"].count
        nameCount = counts
        //let count = json["hits"][0]["recipe"]["label"]
        print("This is inside the image\(nameCount)")
        for count in 0..<counts{
            imageUrls.append(json["hits"][count]["recipe"]["label"].stringValue)
            nameUrls.append(json["hits"][count]["recipe"]["image"].stringValue)
//            print(json["hits"][count]["recipe"]["label"])
//            print(json["hits"][count]["recipe"]["image"])
        }
        print("ImageURLS\(nameUrls)")
        
        
        
        tableCollection.reloadData()
    
        
    }
    
    func getIngredients(row: Int){
        
       let counts  = selectedJSON["hits"][row]["recipe"]["ingredientLines"].count
//
        for count in 0..<counts{
            ingredients.append(selectedJSON["hits"][row]["recipe"]["ingredientLines"][count].stringValue)
        }
        
        instructionURI = selectedJSON["hits"][row]["recipe"]["url"].stringValue
        print(instructionURI)
        
    }
    
    func getHealthLabels(row: Int){
        
        let counts  = selectedJSON["hits"][row]["recipe"]["healthLabels"].count
        
        for count in 0..<counts{
       healthLabels.append(selectedJSON["hits"][row]["recipe"]["healthLabels"][count].stringValue)
            
        }
        print(healthLabels)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
    
        //collectionView.reloadData()
        print("Inside the collection View count\(nameCount)")
        
        return nameCount
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        getCollections(url: urls)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dishImage", for: indexPath) as! DishImageClassCollectionViewCell
        //
        let url = URL(string: nameUrls[indexPath.row])
        print("-------\(nameUrls[indexPath.row])")
        let data = try? Data(contentsOf: url!)

        cell.dishImage.image = UIImage(data: data!)
//
//        if let imageData = data {
//            cell.dishImage.image  = UIImage(data: imageData)
//        }
//
        
        //
        //////////
        
//        URLSession.shared.dataTask(with: NSURL(string: imageUrls[indexPath.row])! as URL, completionHandler: { (data, response, error) -> Void in
//
//            if error != nil {
//                print(error ?? "No Error")
//                return
//            }
//            DispatchQueue.main.async(execute: { () -> Void in
//                cell.dishImage.image = UIImage(data: data!)
////                activityIndicator.removeFromSuperview()
////                self.image = image
//            })
//
//        }).resume()
        //////////
        
        //cell.dishImage.image = sampleDish_images[indexPath.item ]
        cell.dishName.text   = imageUrls[indexPath.row]
        cell.dishImage.layer.cornerRadius = 15.0
        cell.dishImage.layer.masksToBounds = true
        
        cell.layer.cornerRadius = 15.0
        cell.layer.masksToBounds = true
        
        
        
        return cell
        
        
    }
    
    
//    @objc func slideImages()
//    {
//        if counter < imageUrls.count
//        {
//            let index = IndexPath.init(item: counter, section: 0)
//            pageController.currentPage = counter
//
//            self.dishImageSlider.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
//            counter = counter + 1
//        }
//        else
//        {
//            counter = 0
//            pageController.currentPage = counter
//            let index = IndexPath.init(item: counter, section: 0)
//            self.dishImageSlider.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as! CustomCell
        
        
        let url = URL(string: nameUrls[indexPath.row])
        
        let data = try? Data(contentsOf: url!)
        
        cell.imageUI = UIImage(data: data!)
        
        cell.title = "Name : \(imageUrls[indexPath.row])"
        
        cell.layoutSubviews()
        
        return cell
        
    }
    
    //recipeDetailSegue
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        rowIndex = indexPath.row
        getIngredients(row: rowIndex)
        getHealthLabels(row: rowIndex)
        self.performSegue(withIdentifier: "recipeDetailSegue", sender: self)
        ingredients.removeAll()
        healthLabels.removeAll()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let recipeDescVC = segue.destination as! RecipeDescViewController
        
        // set a variable in the second view controller with the data to pass
        recipeDescVC.recipeNameString = imageUrls[rowIndex]
        recipeDescVC.recipeImageUrl = nameUrls[rowIndex]
        recipeDescVC.ingredientsString = ingredients.joined()
        recipeDescVC.instructionURI = instructionURI
        recipeDescVC.healthString = healthLabels.joined()
    }
    
    
    
    
}
