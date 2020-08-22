//
//  MockJSONAdapter.swift
//  WeatherForecastTests
//
//  Created by inspectorioN on 8/22/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

@testable import WeatherForecast
import RealmSwift
import SwiftyJSON
import XCTest
import ObjectMapper_Realm
import ObjectMapper

class MockJSONAdapter {

    static func createMockModel<T>(fromData dataFile: String, forType: T.Type, context: MapContext? = nil, bundle: Bundle = Bundle.test) -> T where T: BaseMappable, T: Object {
        guard let data = stubbedResponse(dataFile, bundle: bundle),
            let json = try? JSON(data: data),
            let dict = json.dictionaryObject,
            let realmObject = Mapper<T>(context: context).map(JSON: dict)
            else {
                XCTFail("Cannot get stub json")
                return T()
        }
        return realmObject
    }

    static func createFailableMockModel<T>(fromData dataFile: String, forType: T.Type, context: MapContext? = nil, bundle: Bundle = Bundle.test) -> T? where T: Mappable {
        guard let data = stubbedResponse(dataFile, bundle: bundle),
            let json = try? JSON(data: data),
            let dict = json.dictionaryObject,
            let object = Mapper<T>(context: context).map(JSON: dict)
            else {
                XCTFail("Cannot get stub json")
                return nil
        }
        return object
    }

    static func createMockModelList<T>(fromData dataFile: String, forType: T.Type, context: MapContext? = nil) -> [T] where T: BaseMappable, T: Object {
        guard let data = stubbedResponse(dataFile, bundle: Bundle.test), let json = try? JSON(data: data), let arrayDict = json.array else {
            return []
        }
        var result: [T] = []

        for dict in arrayDict {
            guard let subjson = dict.dictionaryObject, let realmObject = Mapper<T>(context: context).map(JSON: subjson) else { continue }
            result.append(realmObject)
        }

        return result
    }

}

func stubbedResponse(_ filename: String, bundle: Bundle = Bundle.main) -> Data! {
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
