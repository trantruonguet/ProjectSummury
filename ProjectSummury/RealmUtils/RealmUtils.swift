//
//  RealmUtils.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/12/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import Foundation
import RealmSwift

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

func resetRealmData() -> Void {
    let realm = try! Realm()
    let postInfos = realm.objects(PostInfo.self).toArray(ofType: PostInfo.self)
    try! realm.write {
        realm.delete(postInfos)
    }
}
