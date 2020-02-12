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
    
    var data: PostInfo! {
        didSet {
            if data.descriptionContent.count > 72 {
                if data.isExpended {
                    descriptionLabel.attributedText = NSMutableAttributedString(string: data.descriptionContent)
                } else {
                    print(data.postId)
                    let attributedString = NSMutableAttributedString(string: data.descriptionContent.substring(to: 72) + "...")
                    attributedString.append(NSAttributedString(string: " xem thêm", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
                    descriptionLabel.attributedText = attributedString
                }
            } else {
                descriptionLabel.attributedText = NSMutableAttributedString(string: data.descriptionContent)
            }
        }
    }
    var didExpand: ((Bool) -> ())?
    
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
        didExpand?(data.isExpended)
        if data.descriptionContent.count > 72 {
            if data.isExpended {
                descriptionLabel.attributedText = NSMutableAttributedString(string: data.descriptionContent)
            } else {
                let attributedString = NSMutableAttributedString(string: data.descriptionContent.suffix(72).base + "...")
                attributedString.append(NSAttributedString(string: " xem thêm", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
                descriptionLabel.attributedText = attributedString
                
                data.isExpended = !data.isExpended
            }
        }
    }
    
}

