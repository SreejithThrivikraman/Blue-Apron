//
//  homePageTableTableViewController.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-18.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class homePageTableTableViewController: ViewController, UITableViewDelegate,UITableViewDataSource
{

    
    @IBOutlet weak var dishScheduleTableView: UITableView!
    

    
    let dishNameArray = ["Bacon egg","Biriyani","Vada Paav","Idli Vadai"]
    let Date : String = "MM-dd-YYYY"
    let cellSpacingHeight: CGFloat = 10
    let cellHeight: CGFloat = 70
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dishScheduleTableView.layer.cornerRadius = 12.0
        dishScheduleTableView.layer.masksToBounds = true
        
        //timeLabel.text = "HH:mm:SS"
    }

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return self.dishNameArray.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return cellSpacingHeight
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return cellHeight
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "SCell")
        cell.imageView?.image = UIImage(named: "bal")
        cell.textLabel?.text = dishNameArray[indexPath.section]
        cell.imageView?.layer.cornerRadius = 12.0
        cell.imageView?.layer.masksToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 12.0
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
        cell.layer.masksToBounds = true
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.gray.cgColor
        
       
        
        return cell
    }

   

}
