//
//  ContentViewCell.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class ContentViewCell: UIView {

    @IBOutlet var contentViewCell: UIView!
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
           
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
           
        commonInit()
           
    }
       
       
    private func commonInit() {
        Bundle.main.loadNibNamed("ContentViewCell", owner: self, options: nil)
        addSubview(contentViewCell)
        contentViewCell.frame = self.bounds
        contentViewCell.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
