//
//  QiitaItem.swift
//  QiitaSample
//
//  Created by 山本ののか on 2020/11/24.
//

import Foundation

struct QiitaItem: Codable {
    var urlStr: String
    var title: String

    enum CodingKeys: String, CodingKey {
        case urlStr = "url"
        case title = "title"
    }

    var url: URL? { URL.init(string: urlStr) }
}
