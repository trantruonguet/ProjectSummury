//
//  PostNewCell.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/7/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class PostNewCell: UITableViewCell {

    @IBOutlet weak var headerPostView: HeaderPostView!
    
    @IBOutlet weak var contentPostView: ContentView!
    
    @IBOutlet weak var likeRateView: LikeRateView!
    
    @IBOutlet weak var descriptionView: DescriptionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
//    func fillData(textTitle: String) {
//            headerPostView.fillData(nameTitle: textTitle)
//    }
}
