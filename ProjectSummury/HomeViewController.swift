//
//  ViewController.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/3/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeContentView: HomeContentView!
    @IBOutlet weak var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeContentView.sharePost = { content in
            guard let shareContent = content else {
                return
            }
            let activityController = UIActivityViewController(activityItems: shareContent,
                                                              applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        homeContentView.menuShow = { content in
            guard let postInfo = content else { return }
            
            let menuPopup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuPopup") as! PopupMenuController
            self.addChild(menuPopup)
            menuPopup.dataInit = postInfo
            menuPopup.view.frame = self.view.frame
            self.view.addSubview(menuPopup.view)
            menuPopup.didMove(toParent: self)
        }
        
        headerView.sendInstagram = {
            guard let url = URL(string: "https://www.instagram.com/") else {
                return
            }
            
            let shareContent: [Any] = ["Instagram", url]
            
            let activityController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeContentView.layoutIfNeeded()
    }
}

