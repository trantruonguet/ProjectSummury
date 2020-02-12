//
//  StringExtensions.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/12/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import Foundation

extension String {
    func convertToStringDotCount() -> String {
        var temp = self
        switch temp.count {
        case 1,2,3 : break
        case 4,5,6 :
            temp.insert(".", at: temp.index(temp.endIndex , offsetBy: -3))
        case 7,8,9 :
            temp.insert(".", at: temp.index(temp.endIndex , offsetBy: -6))
            temp.insert(".", at: temp.index(temp.endIndex , offsetBy: -3))
        case 10,11,12 :
            temp.insert(".", at: temp.index(temp.endIndex , offsetBy: -9))
            temp.insert(".", at: temp.index(temp.endIndex , offsetBy: -6))
            temp.insert(".", at: temp.index(temp.endIndex , offsetBy: -3))
        default: break
        }
        return temp
    }
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
