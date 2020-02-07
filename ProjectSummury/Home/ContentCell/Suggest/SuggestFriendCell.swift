//
//  SuggestFriendViewCell.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/4/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class SuggestFriendCell: UITableViewCell {

    @IBOutlet var suggestPostContentView: UIView!
   
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        commonInit()
//
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        commonInit()
//
//    }
//
//
//    private func commonInit() {
//        Bundle.main.loadNibNamed("PostTableCell", owner: self, options: nil)
//        addSubview(suggestPostContentView)
//        suggestPostContentView.frame = self.bounds
//        suggestPostContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
          // Initialization code
    }
      
    override func layoutSubviews() {
        self.contentView.frame = self.bounds
    }

}
