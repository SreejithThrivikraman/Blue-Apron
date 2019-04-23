//
//  RecipeDescViewController.swift
//  Blue Apron
//
//  Created by newuser on 2019-04-23.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class RecipeDescViewController: UIViewController {

    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeName: UILabel!
    
    @IBOutlet weak var ingredientsView: UITextView!
    
    @IBOutlet weak var healthLabelView: UITextView!
    
    @IBAction func instructionButton(_ sender: Any) {
        self.performSegue(withIdentifier: "webSegue", sender: self)
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "dateSegue", sender: self)
    }
    
    var recipeNameString = String()
    
    var recipeImageUrl = String()
    
    var ingredientsString = String()
    
    var preparationString = String()
    
    var nutritionString = String()
    
    var healthString = String()
    
    var instructionURI = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(recipeNameString)
        print(recipeImageUrl)
        print(ingredientsString)
        
        recipeName.text = recipeNameString
        recipeName.sizeToFit()
        
        let url = URL(string: recipeImageUrl)
        
        let data = try? Data(contentsOf: url!)
        
        recipeImage.image = UIImage(data: data!)
        
        ingredientsView.text = ingredientsString
        
        healthLabelView.text = healthString
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webSegue"{
            let webVC = segue.destination as! WebViewViewController
            webVC.webURL = instructionURI
        }
        else if segue.identifier == "dateSegue"{
            print("entered")
            let dateVC = segue.destination as! ReminderViewController
            dateVC.recipeName = recipeNameString
        }
        
       
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
