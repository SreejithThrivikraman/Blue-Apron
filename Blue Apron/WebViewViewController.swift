//
//  WebViewViewController.swift
//  Blue Apron
//
//  Created by newuser on 2019-04-23.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webContent: UIWebView!
    
    var webURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: webURL)
        
        webContent.loadRequest(URLRequest(url: url!))
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
