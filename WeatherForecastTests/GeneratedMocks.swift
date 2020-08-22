// MARK: - Mocks generated from file: WeatherForecast/Services/NetworkService.swift at 2020-08-22 10:56:03 +0000

//
//  NetworkService.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Cuckoo
@testable import WeatherForecast

import Moya
import ObjectMapper
import RxSwift
import SwiftyJSON


 class MockNetworkService: NetworkService, Cuckoo.ClassMock {
    
     typealias MocksType = NetworkService
    
     typealias Stubbing = __StubbingProxy_NetworkService
     typealias Verification = __VerificationProxy_NetworkService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: NetworkService?

     func enableDefaultImplementation(_ stub: NetworkService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    // ["isReadOnly": false, "@type": "InstanceVariable", "accessibility": "", "nonOptionalType": "APIProvider", "verifyType": "VerifyProperty", "name": "apiProvider", "attributes": [], "type": "APIProvider", "stubType": "ClassToBeStubbedProperty"]
    
    
     override var apiProvider: APIProvider {
        get {
            return cuckoo_manager.getter("apiProvider",
                superclassCall:
                    
                    super.apiProvider
                    ,
                defaultCall: __defaultImplStub!.apiProvider)
        }
        
        set {
            cuckoo_manager.setter("apiProvider",
                value: newValue,
                superclassCall:
                    
                    super.apiProvider = newValue
                    ,
                defaultCall: __defaultImplStub!.apiProvider = newValue)
        }
        
    }
    

    

    
    
    // ["self": CuckooGeneratorFramework.ClassMethod(name: "getWeatherForecast(_:cnt:unit:)", accessibility: CuckooGeneratorFramework.Accessibility.Internal, returnSignature: -> Single<WeatherForecastResponseEntity>, range: Range(1292..<1704), nameRange: Range(1297..<1369), parameters: [CuckooGeneratorFramework.MethodParameter(label: nil, name: "city", type: String, range: Range(1316..<1330), nameRange: Range(0..<0), isInout: false), CuckooGeneratorFramework.MethodParameter(label: Optional("cnt"), name: "cnt", type: Int?, range: Range(1332..<1347), nameRange: Range(1332..<1335), isInout: false), CuckooGeneratorFramework.MethodParameter(label: Optional("unit"), name: "unit", type: String?, range: Range(1349..<1368), nameRange: Range(1349..<1353), isInout: false)], bodyRange: Range(1411..<1703), attributes: [], genericParameters: []), "hasClosureParams": false, "inputTypes": "String, Int?, String?", "throwType": "", "genericParameters": "", "escapingParameterNames": "city, cnt, unit", "hasOptionalParams": true, "@type": "ClassMethod", "call": "city, cnt: cnt, unit: unit", "parameterSignatureWithoutNames": "city: String, cnt: Int?, unit: String?", "argumentSignature": "String, Int?, String?", "returnType": "Single<WeatherForecastResponseEntity>", "isOptional": false, "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "city", type: String, range: Range(1316..<1330), nameRange: Range(0..<0), isInout: false), CuckooGeneratorFramework.MethodParameter(label: Optional("cnt"), name: "cnt", type: Int?, range: Range(1332..<1347), nameRange: Range(1332..<1335), isInout: false), CuckooGeneratorFramework.MethodParameter(label: Optional("unit"), name: "unit", type: String?, range: Range(1349..<1368), nameRange: Range(1349..<1353), isInout: false)], "name": "getWeatherForecast", "fullyQualifiedName": "getWeatherForecast(_: String, cnt: Int?, unit: String?) -> Single<WeatherForecastResponseEntity>", "returnSignature": "-> Single<WeatherForecastResponseEntity>", "attributes": [], "isOverriding": true, "stubFunction": "Cuckoo.ClassStubFunction", "parameterNames": "city, cnt, unit", "isInit": false, "isThrowing": false, "parameterSignature": "_ city: String, cnt: Int?, unit: String?", "accessibility": ""]
    
    
     override func getWeatherForecast(_ city: String, cnt: Int?, unit: String?) -> Single<WeatherForecastResponseEntity> {
        
    return cuckoo_manager.call("getWeatherForecast(_: String, cnt: Int?, unit: String?) -> Single<WeatherForecastResponseEntity>",
            parameters: (city, cnt, unit),
            escapingParameters: (city, cnt, unit),
            superclassCall:
                
                super.getWeatherForecast(city, cnt: cnt, unit: unit)
                ,
            defaultCall: __defaultImplStub!.getWeatherForecast(city, cnt: cnt, unit: unit))
        
    }
    
    
    // ["self": CuckooGeneratorFramework.ClassMethod(name: "download(endpoint:context:)", accessibility: CuckooGeneratorFramework.Accessibility.Internal, returnSignature: -> Single<T>, range: Range(1939..<2306), nameRange: Range(1944..<2018), parameters: [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: NetworkRouter, range: Range(1966..<1989), nameRange: Range(1966..<1974), isInout: false), CuckooGeneratorFramework.MethodParameter(label: Optional("context"), name: "context", type: MapContext?, range: Range(1991..<2017), nameRange: Range(1991..<1998), isInout: false)], bodyRange: Range(2033..<2305), attributes: [], genericParameters: [CuckooGeneratorFramework.GenericParameter(name: "T", range: Range(1953..<1964), inheritedType: Optional(CuckooGeneratorFramework.InheritanceDeclaration(name: "Mappable")))]), "hasClosureParams": false, "inputTypes": "NetworkRouter, MapContext?", "throwType": "", "genericParameters": "<T: Mappable>", "escapingParameterNames": "endpoint, context", "hasOptionalParams": true, "@type": "ClassMethod", "call": "endpoint: endpoint, context: context", "parameterSignatureWithoutNames": "endpoint: NetworkRouter, context: MapContext?", "argumentSignature": "NetworkRouter, MapContext?", "returnType": "Single<T>", "isOptional": false, "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: NetworkRouter, range: Range(1966..<1989), nameRange: Range(1966..<1974), isInout: false), CuckooGeneratorFramework.MethodParameter(label: Optional("context"), name: "context", type: MapContext?, range: Range(1991..<2017), nameRange: Range(1991..<1998), isInout: false)], "name": "download", "fullyQualifiedName": "download(endpoint: NetworkRouter, context: MapContext?) -> Single<T>", "returnSignature": "-> Single<T>", "attributes": [], "isOverriding": true, "stubFunction": "Cuckoo.ClassStubFunction", "parameterNames": "endpoint, context", "isInit": false, "isThrowing": false, "parameterSignature": "endpoint: NetworkRouter, context: MapContext?", "accessibility": ""]
    
    
     override func download<T: Mappable>(endpoint: NetworkRouter, context: MapContext?) -> Single<T> {
        
    return cuckoo_manager.call("download(endpoint: NetworkRouter, context: MapContext?) -> Single<T>",
            parameters: (endpoint, context),
            escapingParameters: (endpoint, context),
            superclassCall:
                
                super.download(endpoint: endpoint, context: context)
                ,
            defaultCall: __defaultImplStub!.download(endpoint: endpoint, context: context))
        
    }
    
    
    // ["self": CuckooGeneratorFramework.ClassMethod(name: "downloadJSON(endpoint:)", accessibility: CuckooGeneratorFramework.Accessibility.Internal, returnSignature: -> Single<JSON>, range: Range(2313..<2590), nameRange: Range(2318..<2355), parameters: [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: NetworkRouter, range: Range(2331..<2354), nameRange: Range(2331..<2339), isInout: false)], bodyRange: Range(2373..<2589), attributes: [], genericParameters: []), "hasClosureParams": false, "inputTypes": "NetworkRouter", "throwType": "", "genericParameters": "", "escapingParameterNames": "endpoint", "hasOptionalParams": false, "@type": "ClassMethod", "call": "endpoint: endpoint", "parameterSignatureWithoutNames": "endpoint: NetworkRouter", "argumentSignature": "NetworkRouter", "returnType": "Single<JSON>", "isOptional": false, "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: NetworkRouter, range: Range(2331..<2354), nameRange: Range(2331..<2339), isInout: false)], "name": "downloadJSON", "fullyQualifiedName": "downloadJSON(endpoint: NetworkRouter) -> Single<JSON>", "returnSignature": "-> Single<JSON>", "attributes": [], "isOverriding": true, "stubFunction": "Cuckoo.ClassStubFunction", "parameterNames": "endpoint", "isInit": false, "isThrowing": false, "parameterSignature": "endpoint: NetworkRouter", "accessibility": ""]
    
    
     override func downloadJSON(endpoint: NetworkRouter) -> Single<JSON> {
        
    return cuckoo_manager.call("downloadJSON(endpoint: NetworkRouter) -> Single<JSON>",
            parameters: (endpoint),
            escapingParameters: (endpoint),
            superclassCall:
                
                super.downloadJSON(endpoint: endpoint)
                ,
            defaultCall: __defaultImplStub!.downloadJSON(endpoint: endpoint))
        
    }
    

	 struct __StubbingProxy_NetworkService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var apiProvider: Cuckoo.ClassToBeStubbedProperty<MockNetworkService, APIProvider> {
	        return .init(manager: cuckoo_manager, name: "apiProvider")
	    }
	    
	    
	    func getWeatherForecast<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable>(_ city: M1, cnt: M2, unit: M3) -> Cuckoo.ClassStubFunction<(String, Int?, String?), Single<WeatherForecastResponseEntity>> where M1.MatchedType == String, M2.OptionalMatchedType == Int, M3.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int?, String?)>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: cnt) { $0.1 }, wrap(matchable: unit) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkService.self, method: "getWeatherForecast(_: String, cnt: Int?, unit: String?) -> Single<WeatherForecastResponseEntity>", parameterMatchers: matchers))
	    }
	    
	    func download<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, T: Mappable>(endpoint: M1, context: M2) -> Cuckoo.ClassStubFunction<(NetworkRouter, MapContext?), Single<T>> where M1.MatchedType == NetworkRouter, M2.OptionalMatchedType == MapContext {
	        let matchers: [Cuckoo.ParameterMatcher<(NetworkRouter, MapContext?)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: context) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkService.self, method: "download(endpoint: NetworkRouter, context: MapContext?) -> Single<T>", parameterMatchers: matchers))
	    }
	    
	    func downloadJSON<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.ClassStubFunction<(NetworkRouter), Single<JSON>> where M1.MatchedType == NetworkRouter {
	        let matchers: [Cuckoo.ParameterMatcher<(NetworkRouter)>] = [wrap(matchable: endpoint) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkService.self, method: "downloadJSON(endpoint: NetworkRouter) -> Single<JSON>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var apiProvider: Cuckoo.VerifyProperty<APIProvider> {
	        return .init(manager: cuckoo_manager, name: "apiProvider", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func getWeatherForecast<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable>(_ city: M1, cnt: M2, unit: M3) -> Cuckoo.__DoNotUse<(String, Int?, String?), Single<WeatherForecastResponseEntity>> where M1.MatchedType == String, M2.OptionalMatchedType == Int, M3.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int?, String?)>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: cnt) { $0.1 }, wrap(matchable: unit) { $0.2 }]
	        return cuckoo_manager.verify("getWeatherForecast(_: String, cnt: Int?, unit: String?) -> Single<WeatherForecastResponseEntity>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func download<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, T: Mappable>(endpoint: M1, context: M2) -> Cuckoo.__DoNotUse<(NetworkRouter, MapContext?), Single<T>> where M1.MatchedType == NetworkRouter, M2.OptionalMatchedType == MapContext {
	        let matchers: [Cuckoo.ParameterMatcher<(NetworkRouter, MapContext?)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: context) { $0.1 }]
	        return cuckoo_manager.verify("download(endpoint: NetworkRouter, context: MapContext?) -> Single<T>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func downloadJSON<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.__DoNotUse<(NetworkRouter), Single<JSON>> where M1.MatchedType == NetworkRouter {
	        let matchers: [Cuckoo.ParameterMatcher<(NetworkRouter)>] = [wrap(matchable: endpoint) { $0 }]
	        return cuckoo_manager.verify("downloadJSON(endpoint: NetworkRouter) -> Single<JSON>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkServiceStub: NetworkService {
    
    
     override var apiProvider: APIProvider {
        get {
            return DefaultValueRegistry.defaultValue(for: (APIProvider).self)
        }
        
        set { }
        
    }
    

    

    
     override func getWeatherForecast(_ city: String, cnt: Int?, unit: String?) -> Single<WeatherForecastResponseEntity>  {
        return DefaultValueRegistry.defaultValue(for: (Single<WeatherForecastResponseEntity>).self)
    }
    
     override func download<T: Mappable>(endpoint: NetworkRouter, context: MapContext?) -> Single<T>  {
        return DefaultValueRegistry.defaultValue(for: (Single<T>).self)
    }
    
     override func downloadJSON(endpoint: NetworkRouter) -> Single<JSON>  {
        return DefaultValueRegistry.defaultValue(for: (Single<JSON>).self)
    }
    
}

