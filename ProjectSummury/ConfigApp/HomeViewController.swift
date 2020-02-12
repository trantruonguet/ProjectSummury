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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeContentView.layoutIfNeeded()
    }
}

