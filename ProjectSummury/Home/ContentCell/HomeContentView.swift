//
//  HomeContentView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/4/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class HomeContentView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var tableContentView: UITableView!
    
    private 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
        
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("HomeContentView", owner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        tableContentView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        tableContentView.register(UINib(nibName: "PostNewCell", bundle: nil), forCellReuseIdentifier: "PostNewCell")
        tableContentView.register(SuggestFriendCell.self, forCellReuseIdentifier: "SuggestFriendCell")
        tableContentView.register(SortPostCell.self, forCellReuseIdentifier: "SortPostCell")
        
        tableContentView.delegate = self
        tableContentView.dataSource = self
        
    }
}

extension HomeContentView: UITableViewDelegate {
    
}

extension HomeContentView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostNewCell", for: indexPath) as! PostNewCell
        
        cell.descriptionView?.descriptionLabel?.text = "description"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
