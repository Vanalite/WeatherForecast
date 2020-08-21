//
//  BaseResponseEntity.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/21/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class BaseResponseEntity: Object, Mappable {

    @objc dynamic var message: String = ""
    let status = RealmOptional<Int>()
    let code = RealmOptional<Int>()

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        message <- map[CodingKeys.message.rawValue]
    }

    enum CodingKeys: String {
        case cod
        case status
        case message
    }
}

extension BaseResponseEntity: CustomNSError {

    var errorUserInfo: [String: Any] {
        return [NSLocalizedDescriptionKey : message]
    }
}

