//
//  DescriptionView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/5/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class DescriptionView: UIView {
    
    var data: PostInfo! {
        didSet {
            if data.descriptionContent.count > 72 {
                if data.isExpended {
                    descriptionLabel.attributedText = NSMutableAttributedString(string: data.descriptionContent)
                } else {
                    let attributedString = NSMutableAttributedString(string: data.descriptionContent.substring(to: 72) + "...")
                    attributedString.append(NSAttributedString(string: " xem thêm", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
                    descriptionLabel.attributedText = attributedString
                }
            } else {
                descriptionLabel.attributedText = NSMutableAttributedString(string: data.descriptionContent)
            }
        }
    }

    @IBOutlet var descriptionContentView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
