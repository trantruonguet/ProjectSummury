//
//  InteractiveView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class InteractiveView: UIView {
    
//    @IBOutlet weak var likeView: LikeRateView!
    @IBOutlet weak var likeImageView: UIImageView!
    
    @IBOutlet weak var commentView: UIImageView!
    
    @IBOutlet weak var shareView: UIImageView!
    
    @IBOutlet weak var bookMark: UIImageView!
    
    @IBOutlet var interactiveContentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
        
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("InteractiveView", owner: self, options: nil)
        addSubview(interactiveContentView)
        interactiveContentView.frame = self.bounds
        interactiveContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        shareView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shareAction)))
        bookMark?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bookMarkAction)))
        
    }
    
    @objc func likeAction () -> Void {
        
    }
    
    @objc func shareAction () -> Void {
        
    }
    
    @objc func bookMarkAction () -> Void {
        
    }
    
}
