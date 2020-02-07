//
//  PostTableViewCell.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/4/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var headerPostView: HeaderPostView!
    
    @IBOutlet weak var contentPostView: ContentView!
    
    @IBOutlet weak var interactiveView: InteractiveView!
    
    @IBOutlet weak var descriptionView: DescriptionView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
            }
      
    override func layoutSubviews() {
        self.contentView.frame = self.bounds
    }

    func fillData(textTitle: String) {
        headerPostView.fillData(nameTitle: textTitle)
    }
}
