//
//  DescriptionView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class DescriptionView: UIView {

    @IBOutlet var descriptionContentView: UIView!
       
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
           
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
           
        commonInit()
           
    }
       
       
    private func commonInit() {
        Bundle.main.loadNibNamed("DescriptionView", owner: self, options: nil)
        addSubview(descriptionContentView)
        descriptionContentView.frame = self.bounds
        descriptionContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        descriptionLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openDescription)))
    }
    
    @objc func openDescription () -> Void {
        
    }

}
