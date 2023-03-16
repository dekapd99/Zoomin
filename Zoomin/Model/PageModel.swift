//
//  PageModel.swift
//  Zoomin
//
//  Created by Deka Primatio on 16/03/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
