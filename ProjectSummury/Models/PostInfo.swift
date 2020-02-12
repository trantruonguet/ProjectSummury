//
//  PostInfo.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/12/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit
import RealmSwift

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
