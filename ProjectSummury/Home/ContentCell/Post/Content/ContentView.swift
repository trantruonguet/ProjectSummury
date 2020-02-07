//
//  ContentView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class ContentView: UIView{

    @IBOutlet var contentView: UIView!
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
           
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
           
        commonInit()
           
    }
       
       
    private func commonInit() {
        Bundle.main.loadNibNamed("ContentView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
