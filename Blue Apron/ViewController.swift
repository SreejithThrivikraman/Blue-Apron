//
//  ViewController.swift
//  Blue Apron
//
//  Created by Sreejith Thrivikraman on 2019-04-09.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController
{
    
    var ref:DatabaseReference?
    var postData = [String]()
    var databaseHandle:DatabaseHandle?
    var userNames: [String] = []
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        var status = checkUserName(s: "Users", keyName: "Sreejith")
        
        if(status == true)
        {
            print("User Found !")
        }
        else
        {
            print("UserNot found !")
        }
       
        
    }
    
   
    func checkUserName(s: String, keyName: String) -> Bool
    {   var status = false
        databaseHandle = ref?.child(s).observe(.value, with: { (snapshot) in
            
            for clientName in snapshot.children.allObjects as! [DataSnapshot]
            {
                //print("User Name:\(clientName.key)")
                if (clientName.key == keyName)
                {
                    status = true
                    
                }
                else
                {
                    status = false
                }
               //  print(self.userNames)
            }
           
        })
        print(databaseHandle!)
        return status
        
        
    }
    
    func writeData(parentRef: String, childRef: String, value: String)
    {
        ref?.child(parentRef).child(childRef).setValue(value)
    }
    
    func updateData(parentRef: String, childRef: String)
    {
        
    }
    
    func deleteData(parentRef: String, childRef: String)
    {
        ref?.child(parentRef).child(childRef).removeValue()
    }
    
}

