//
//  HomePage.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-18.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class HomePage: UIViewController
{

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scheduleTable: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        container.layer.cornerRadius = 12.0
        container.layer.masksToBounds = true
        container.backgroundColor = UIColor.green
        
        scheduleTable.layer.cornerRadius = 12.0
        scheduleTable.layer.masksToBounds = true
       
       
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
