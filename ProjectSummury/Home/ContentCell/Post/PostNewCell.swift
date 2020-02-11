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
    
    var didReload: (() -> ())?
    
    var data: PostInfo! {
        didSet {
            headerPostView?.nameLabel.text = data.name
//            descriptionView?.descriptionLabel?.text = data.descriptionContent
            
            var stringLikeRate = String(data.likeRate)
            switch stringLikeRate.count {
            case 1,2,3 : break
            case 4,5,6 :
                stringLikeRate.insert(".", at: stringLikeRate.index(stringLikeRate.endIndex , offsetBy: -3))
            case 7,8,9 :
                stringLikeRate.insert(".", at: stringLikeRate.index(stringLikeRate.endIndex , offsetBy: -6))
                stringLikeRate.insert(".", at: stringLikeRate.index(stringLikeRate.endIndex , offsetBy: -3))
            case 10,11,12 :
                stringLikeRate.insert(".", at: stringLikeRate.index(stringLikeRate.endIndex , offsetBy: -9))
                stringLikeRate.insert(".", at: stringLikeRate.index(stringLikeRate.endIndex , offsetBy: -6))
                stringLikeRate.insert(".", at: stringLikeRate.index(stringLikeRate.endIndex , offsetBy: -3))
            default: break
            }
            
            interactiveView?.likeRateView?.likeRateLabel.text = stringLikeRate + " lượt thích"
            interactiveView?.data = data
            contentPostView?.data = data
            descriptionView?.data = data
            
            Alamofire.request(data.avatarUrl! ).responseImage{ [weak self] response in
                if let image = response.result.value {
                    self?.headerPostView?.avatarImage.image = image
                }
            }
            
            Alamofire.request(data.imageContent.first! ).responseImage{ [weak self] response in
                if let image = response.result.value {
                    self?.contentPostView?.contentImage.image = image
                    
                    let mainScreenSize = UIScreen.main.bounds.size
                    self?.contentPostView?.heightContentImage.constant = ((image.size.height ?? 0.0) / (image.size.width ?? 1.0)) * mainScreenSize.width
                    
                    self?.didReload?()
                }
            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func prepareForReuse() {
//        interactiveView.likeImageView.image = UIImage(named: "icon_heart_light")
    }
    
}
