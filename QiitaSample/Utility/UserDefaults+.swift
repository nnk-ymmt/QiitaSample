//
//  UserDefaults+.swift
//  QiitaSample
//
//  Created by 山本ののか on 2020/11/24.
//

import Foundation

extension UserDefaults {
    private var qiitaAccessTokenKey: String { "qiitaAccessTokenKey" }
    var qiitaAccessToken: String {
        get {
            self.string(forKey: qiitaAccessTokenKey) ?? ""
        }
        set {
            self.setValue(newValue, forKey: qiitaAccessTokenKey)
        }
    }
}
