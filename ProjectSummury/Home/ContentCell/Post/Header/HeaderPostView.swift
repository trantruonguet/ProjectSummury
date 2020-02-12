//
//  HeaderPostView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/6/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HeaderPostView: UIView {
    
//    @IBOutlet var headerContentView: UIView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
    var data: PostInfo! {
        didSet {
            self.nameLabel.text = data.name
            Alamofire.request(data.avatarUrl! ).responseImage{ [weak self] response in
                if let image = response.result.value {
                    self?.avatarImage.image = image
                }
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
        let view = Bundle.main.loadNibNamed("HeaderPostView", owner: self, options: nil)?[0] as! UIView
//        Bundle.main.loadNibNamed("HeaderPostView", owner: self, options: nil)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(view)
        
        avatarImage.layer.cornerRadius = avatarImage.frame.width/2
        menuImage?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(menuAction)))

    }
    
    @objc func menuAction () -> Void {
        
    }
    
    func fillData(nameTitle: String) {
        nameLabel.text = nameTitle
    }
    
}
