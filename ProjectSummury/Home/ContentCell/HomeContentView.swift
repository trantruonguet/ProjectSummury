//
//  HomeContentView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/4/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift
import AlamofireImage


class HomeContentView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableContentView: UITableView!
    
    var currentPostInfo: [PostInfo] = []
    var sharePost: ((_ content: [Any]!) -> ())?
    var menuShow: ((_ content: PostInfo!) -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        commonInit()
        
    }
    
    func setup() {
        let mainView = loadViewFromNib()
        mainView.frame = bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(mainView)
    }
    
    func loadViewFromNib() -> UIView {
           let bundle = Bundle(for: type(of: self))
           let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
           let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
           return nibView
       }
    
    override func layoutSubviews() {
        tableContentView.frame = self.bounds
    }
    
    private func commonInit() {
        tableContentView.register(UINib(nibName: "PostNewCell", bundle: nil), forCellReuseIdentifier: "PostNewCell")
        tableContentView.delegate = self
        tableContentView.dataSource = self
        
        let oldPostInfo = loadFromRealm()
        Alamofire.request("http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=20/json").responseJSON {
            (response) in
            var postInfos: [PostInfo] = []
            guard let value = response.result.value else { return }
            let responseValue = JSON(value)
            if let entry = responseValue["feed"]["entry"].array {
                for index in 0...min(entry.count, 9) {
                    let postInfo = PostInfo(postInfo: entry[index])
                    if !oldPostInfo.isEmpty {
                        var check: Int = 0
                        oldPostInfo.forEach({
                            if ($0.postId == postInfo.postId ) {
                                check = 1
                            }
                        })
                        if check == 0 {
                            postInfos.append(postInfo)
                        }
                    } else {
                        postInfos.append(postInfo)
                    }
                }
            }

            if !postInfos.isEmpty {
                saveToRealm(postInfos: postInfos)
            }

            self.currentPostInfo = loadFromRealm()
            self.tableContentView.reloadData()
            
        }
    }
}

extension HomeContentView: UITableViewDelegate {
    
}

extension HomeContentView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostNewCell", for: indexPath) as! PostNewCell
        cell.data = currentPostInfo[indexPath.row]
        
        cell.descriptionView.didExpand = { [weak self] isExpand in
            UIView.performWithoutAnimation {
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        
        cell.contentPostView.likeReload = {
            cell.interactiveView?.likeImageView.image = UIImage.init(named: "icon_heart_dark")
            
        }
        
        cell.interactiveView.sharePost = sharePost
        cell.headerPostView.menuShow = menuShow
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentPostInfo.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
