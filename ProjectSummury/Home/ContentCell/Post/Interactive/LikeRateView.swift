//
//  LikeRate.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class LikeRateView: UIView {

    @IBOutlet var likeRateContentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
        
    }
    
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LikeRateView", owner: self, options: nil)
        addSubview(likeRateContentView)
        likeRateContentView.frame = self.bounds
        likeRateContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
