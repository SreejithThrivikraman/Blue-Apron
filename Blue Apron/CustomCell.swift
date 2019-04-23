//
//  CustomCell.swift
//  Blue Apron
//
//  Created by newuser on 2019-04-23.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var title : String?
    var imageUI : UIImage?
    var collection : String?
    
    var titleView : UITextView = {
        
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Courier", size: 20)
        return textView
        
    }()
    
    var imageUIView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(imageUIView)
        self.addSubview(titleView)
        
        imageUIView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageUIView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageUIView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageUIView.bottomAnchor.constraint(equalTo: self.titleView.topAnchor).isActive = true
        
        titleView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if let title = title{
            titleView.text = title
        }
        
        if let image = imageUI{
            imageUIView.image = image
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

