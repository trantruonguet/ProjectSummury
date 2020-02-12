//
//  PostNewCell.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/7/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PostNewCell: UITableViewCell {

    @IBOutlet weak var headerPostView: HeaderPostView!
    @IBOutlet weak var contentPostView: ContentViewCell!
    @IBOutlet weak var interactiveView: InteractiveView!
    @IBOutlet weak var descriptionView: DescriptionView!
    
    var data: PostInfo! {
        didSet {
            headerPostView?.data = data
            interactiveView?.data = data
            contentPostView?.data = data
            descriptionView?.data = data
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
