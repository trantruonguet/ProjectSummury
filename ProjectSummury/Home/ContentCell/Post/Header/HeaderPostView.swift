//
//  HeaderPostView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/6/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class HeaderPostView: UIView {
    
//    @IBOutlet var headerContentView: UIView!
    
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
        let view = Bundle.main.loadNibNamed("HeaderPostView", owner: self, options: nil)?[0] as! UIView
//        Bundle.main.loadNibNamed("HeaderPostView", owner: self, options: nil)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(view)
        
        avatarImage.layer.cornerRadius = avatarImage.frame.width/2

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
