//
//  RealmManager.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {

    static let shared = RealmManager()

    fileprivate var internalMainThreadRealm: Realm!
    var mainThreadRealm: Realm {
        if Thread.isMainThread {
            if internalMainThreadRealm == nil {
                internalMainThreadRealm = try! Realm()
            }
            return internalMainThreadRealm
        } else {
            fatalError("mainThreadRealm should be used only on main thread")
        }
    }
}
