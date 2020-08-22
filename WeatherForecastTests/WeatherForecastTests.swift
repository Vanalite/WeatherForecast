//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

@testable import WeatherForecast
import XCTest
import Nimble
import Cuckoo
import RxSwift
import RxTest

class WeatherForecastViewModelTests: RealmTestCase {

    let stubFileName = "weatherforecase-response"
    let validCity = "A City"
    var testScheduler: TestScheduler!
    var bag: DisposeBag!

    var sut: WeatherForecastViewModel!
    var weatherForecastResponse: WeatherForecastResponseEntity!
    var networkRouter: MockNetworkService!

    override func setUp() {
        super.setUp()
        testScheduler = TestScheduler(initialClock: 0)
        bag = DisposeBag()
        weatherForecastResponse = MockJSONAdapter.createMockModel(fromData: stubFileName, forType: WeatherForecastResponseEntity.self)

        networkRouter = MockNetworkService()
        stub(networkRouter) { mock in
            when(mock.getWeatherForecast(validCity, cnt: any(), unit: any())).thenReturn(.just(weatherForecastResponse))
            when(mock.getWeatherForecast("invalid", cnt: any(), unit: any())).thenReturn(.just(WeatherForecastResponseEntity()))
        }

        sut = WeatherForecastViewModel(netWorkService: networkRouter,
                                       realm: realm)
    }

    override func tearDown() {
        sut = nil
        testScheduler = nil
        weatherForecastResponse = nil
        networkRouter = nil
        bag = nil
        super.tearDown()
    }

    func testPerformSearchWithValidCity() {
        let  input = WeatherForecastViewModel.Input()
        let output = sut.transform(input: input)

        let testObserver = testScheduler.createObserver([WeatherEntity].self)
        output.items.bind(to: testObserver).disposed(by: bag)

        sut.searchText.value = validCity
        expect(testObserver.events.count).toEventually(equal(1), timeout: 10)

        let responseObj = testObserver.events.first?.value.element

        expect(responseObj).notTo(beNil())
        expect(responseObj?.count) == 7
    }

    func testPerformSearchWithInvalidCity() {
        let  input = WeatherForecastViewModel.Input()
        let output = sut.transform(input: input)

        let testObserver = testScheduler.createObserver([WeatherEntity].self)
        output.items.bind(to: testObserver).disposed(by: bag)

        sut.searchText.value = "invalid"
        expect(testObserver.events.count).toEventually(equal(1), timeout: 10)

        let responseObj = testObserver.events.first?.value.element

        expect(responseObj).notTo(beNil())
        expect(responseObj?.count) == 0
    }

    func testWeatherDataSource() {
        let  input = WeatherForecastViewModel.Input()
        let output = sut.transform(input: input)

        let testObserver = testScheduler.createObserver([WeatherEntity].self)
        output.items.bind(to: testObserver).disposed(by: bag)
        sut.searchText.value = validCity
        expect(testObserver.events.count).toEventually(equal(1), timeout: 10)
        let item = sut.weatherDataSource(at: 0)
        expect(item.temperature) == 304.19
        expect(item.humidity) == 56
        expect(item.pressure) == 1007
        expect(item.date) == "Sat, 22 Aug 2020"
        expect(item.descriptionText) == "light rain"
    }
}
