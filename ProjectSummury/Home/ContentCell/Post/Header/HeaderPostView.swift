//
//  HeaderPostView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/6/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class HeaderPostView: UIView {
    
    @IBOutlet var headerContentView: UIView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var menuImage: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
           
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
           
        commonInit()
           
    }
       
    private func commonInit() {
        Bundle.main.loadNibNamed("HeaderPostView", owner: self, options: nil)
        addSubview(headerContentView)
        headerContentView.frame = self.bounds
        headerContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
//        avatarImage?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: <#T##Selector?#>))
//
//        nameLabel?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: <#T##Selector?#>))
        
        menuImage?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(menuAction)))

    }
    
    @objc func menuAction () -> Void {
        
    }
    
    func fillData(nameTitle: String) {
        nameLabel.text = nameTitle
    }
    
}
