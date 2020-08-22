//
//  RealmTestCase.swift
//  WeatherForecastTests
//
//  Created by inspectorioN on 8/22/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

@testable import WeatherForecast
import XCTest
import RealmSwift

extension Bundle {
    static var test: Bundle {
        return Bundle(identifier: "Vanalite.WeatherForecastTests")!
    }
}

class RealmTestCase: XCTestCase {
    var realm: Realm!

    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = name
        realm = try! Realm()
        self.realmClean()
    }

    override func tearDown() {
        self.realm = nil // Need to be nullfied manually to free memory (necessary for inMemory Realm DB)
        super.tearDown()
    }
}

//MARK: - Realm interaction
extension RealmTestCase {
    func realmWrite(objectsIn objects: [Object]) {
        try! realm.write {
            for object in objects {
                realm.add(object)
            }
        }
    }

    func realmWrite(_ objects: Object...) {
        try! realm.write {
            for object in objects {
                realm.add(object)
            }
        }
    }

    func realmClean() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
