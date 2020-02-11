//
//  InteractiveView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit
import RealmSwift

class InteractiveView: UIView {
    
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var commentView: UIImageView!
    @IBOutlet weak var shareView: UIImageView!
    @IBOutlet weak var bookMark: UIImageView!
    @IBOutlet var interactiveContentView: UIView!
    @IBOutlet weak var likeRateView: LikeRateView!
    
    let realm = try! Realm()
    
    var data: PostInfo! {
        didSet {
            if data.likeStatus {
                self.likeImageView.image = UIImage.init(named: "icon_heart_dark")
            } else {
                self.likeImageView.image = UIImage.init(named: "icon_heart_light")
            }
            
            if data.bookMark {
                self.bookMark.image = UIImage.init(named: "icon_bookmark_dark")
            } else {
                self.bookMark.image = UIImage.init(named: "icon_save_light")
            }
            
            
        }
    }
    
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
        
        likeImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likeAction)))
        shareView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shareAction)))
        bookMark?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bookMarkAction)))
        
    }
    
    override func layoutSubviews() {
        self.interactiveContentView.frame = self.bounds
    }
    
    @objc func likeAction () -> Void {
//        UIView.animate(withDuration: 3) {
//            self.likeImageView.image = UIImage.init(named: "icon_heart_dark")
//        }
        
        try! realm.write {
            data.likeStatus = !data.likeStatus
        }
        
        if data.likeStatus {
            UIView.transition(with: likeImageView,
            duration: 0.75,
            options: .transitionCrossDissolve,
            animations: { self.likeImageView.image = UIImage.init(named: "icon_heart_dark") },
            completion: nil)
        } else {
            UIView.transition(with: likeImageView,
            duration: 0.75,
            options: .transitionCrossDissolve,
            animations: { self.likeImageView.image = UIImage.init(named: "icon_heart_light") },
            completion: nil)
        }
    }
    
    @objc func shareAction () -> Void {
        
    }
    
    @objc func bookMarkAction () -> Void {
        try! realm.write{
            data.bookMark = !data.bookMark
        }
        
        if data.bookMark {
            UIView.transition(with: bookMark,
            duration: 0.75,
            options: .transitionCrossDissolve,
            animations: { self.bookMark.image = UIImage.init(named: "icon_bookmark_dark")},
            completion: nil)
        } else {
            UIView.transition(with: bookMark,
            duration: 0.75,
            options: .transitionCrossDissolve,
            animations: { self.bookMark.image = UIImage.init(named: "icon_save_light")},
            completion: nil)
        }
    }
}
