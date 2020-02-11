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
    
    var currentPostInfo: [PostInfo] = []

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var tableContentView: UITableView!

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
//        Bundle.main.loadNibNamed("HomeContentView", owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        tableContentView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        tableContentView.register(UINib(nibName: "PostNewCell", bundle: nil), forCellReuseIdentifier: "PostNewCell")
//        tableContentView.register(SuggestFriendCell.self, forCellReuseIdentifier: "SuggestFriendCell")
//        tableContentView.register(SortPostCell.self, forCellReuseIdentifier: "SortPostCell")
        
        tableContentView.delegate = self
        tableContentView.dataSource = self
        
        let oldPostInfo = loadFromRealm()
        
        Alamofire.request("http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=25/json").responseJSON {
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
                self.saveToRealm(postInfos: postInfos)
            }

            self.currentPostInfo = self.loadFromRealm()
            self.tableContentView.reloadData()
            
        }
        
//        let realm = try! Realm()
//        let postInfos = realm.objects(PostInfo.self).toArray(ofType: PostInfo.self)
//        try! realm.write {
//            realm.delete(postInfos)
//        }
    
    }
    
    func saveToRealm(postInfos: [PostInfo]) -> Void {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(postInfos)
        }
        
    }
    
    func loadFromRealm() -> [PostInfo] {
        let realm = try! Realm()
                
        let postInfos = realm.objects(PostInfo.self).toArray(ofType: PostInfo.self)
        
        return postInfos
    }
    
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}


extension HomeContentView: UITableViewDelegate {
    
}

extension HomeContentView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostNewCell", for: indexPath) as! PostNewCell
        cell.descriptionView.didExpand = { [weak self] isExpand in
            UIView.performWithoutAnimation {
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        cell.data = currentPostInfo[indexPath.row]
        
        cell.contentPostView.likeReload = {
            cell.interactiveView?.likeImageView.image = UIImage.init(named: "icon_heart_dark")
            
        }
        
//        if currentPostInfo.count == indexPath.row {
//            cell.didReload = { [weak self] in
//                UIView.performWithoutAnimation {
//                    tableView.reloadRows(at: [indexPath], with: .none)
//                }
//            }
//        }
//        cell.layoutIfNeeded()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentPostInfo.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

class PostInfo: Object {
    @objc dynamic var postId: String!
    @objc dynamic var name: String!
    @objc dynamic var avatarUrl: String!
    var imageContent: List<String> = List<String>()
    @objc dynamic var likeRate: Int = 0
    @objc dynamic var likeStatus: Bool = false
    @objc dynamic var descriptionContent: String = ""
    @objc dynamic var bookMark: Bool = false
    var isExpended: Bool = false
    
    init (postId: String, name: String, avatarUrl: String, imageContent: [String], likeRate: Int, likeStatus: Bool, descriptionContent: String, bookMark: Bool ){
//    init (name: String, avatarUrl: String, imageContent: [String], likeRate: Int, likeStatus: Bool, descriptionContent: String, bookMark: Bool ){
        self.postId = postId
        self.name = name
        self.avatarUrl = avatarUrl
        
        let imageContentTemp = List<String>()
        if imageContent.count > 0 {
            imageContent.forEach({imageContentTemp.append($0)})
        }
        self.imageContent = imageContentTemp
        
        self.likeRate = likeRate
        self.likeStatus = likeStatus
        self.descriptionContent = descriptionContent
        self.bookMark = bookMark
    }
    
    init (postInfo: JSON) {
        
        if let postId = postInfo["id"]["attributes"]["im:id"].string {
            self.postId = postId
        }
        
        self.name =  postInfo["im:name"]["label"].stringValue
        self.avatarUrl = postInfo["im:image"].array?[0]["label"].stringValue
        
        if let imageContent = postInfo["im:image"].array?[2]["label"].stringValue {
            self.imageContent = List<String>()
            self.imageContent.append( imageContent )
        }
        
        if let likeRate = postInfo["id"]["attributes"]["im:id"].string {
            if let likeRateString = Int(likeRate) {
                self.likeRate = likeRateString
            }
        }
        
        self.descriptionContent = postInfo["summary"]["label"].stringValue
                
    }
    
    required init() {
        
    }
}
