//
//  ContentViewCell.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit
import RealmSwift
import AlamofireImage
import Alamofire

class ContentViewCell: UIView {

    @IBOutlet var contentViewCell: UIView!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var heightContentImage: NSLayoutConstraint!
    
    var data: PostInfo!{
        didSet {
            Alamofire.request(data.imageContent.first! ).responseImage{ [weak self] response in
                if let image = response.result.value {
                    self?.contentImage.image = image
//                    let mainScreenSize = UIScreen.main.bounds.size
//                    self?.contentPostView?.heightContentImage.constant = ((image.size.height ?? 0.0) / (image.size.width ?? 1.0)) * mainScreenSize.width
                }
            }
        }
    }
    var likeReload: (() -> ())?
    
    let realm = try! Realm()
    
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
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleClickContent))
        doubleTap.numberOfTapsRequired = 2
        contentImage.addGestureRecognizer(doubleTap)
    }
    
    @objc func doubleClickContent () -> Void {
        if !data.likeStatus {
            try! realm.write(){
               data.likeStatus = true
            }
        }
        
        likeReload?()
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: {
            self.heartImage.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.heartImage.alpha = 1.0
        }) { finished in
            self.heartImage.alpha = 0.0
            self.heartImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
    }
}
