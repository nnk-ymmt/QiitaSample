//
//  QiitaAccessToken.swift
//  QiitaSample
//
//  Created by 山本ののか on 2020/11/24.
//

import Foundation

struct QiitaAccessToken: Codable {
    let clientId: String
    let scopes: [String]
    let token: String
}
