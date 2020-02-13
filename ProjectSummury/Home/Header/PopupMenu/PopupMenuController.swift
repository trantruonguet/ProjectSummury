//
//  PopupMenuController.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/12/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class PopupMenuController: UIViewController {

    var dataInit: PostInfo!
    
    @IBAction func shareAction(_ sender: Any) {
        self.view.removeFromSuperview()
        let shareDescription = self.dataInit.descriptionContent
        guard let urlImageContent = URL(string: self.dataInit.imageContent.first!) else {return}
        let shareContent: [Any] = [shareDescription, urlImageContent]
        let activityController = UIActivityViewController(activityItems: shareContent,applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func hiddenAction(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
    }
}
