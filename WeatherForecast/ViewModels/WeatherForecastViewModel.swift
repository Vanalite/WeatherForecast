//
//  WeatherForecastViewModel.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift
import RxRealm

final class WeatherForecastViewModel: ViewModelType {
    var searchText = Variable<String>("")
    private var rxWeatherItems: Observable<(Array<WeatherEntity>, RealmChangeset?)> = Observable.empty()

    private let netWorkService : NetworkService
    private let realm: Realm
    private var weatherItems: [WeatherEntity] = []

    private let disposeBag: DisposeBag

    init(netWorkService: NetworkService = NetworkService(),
        realm: Realm = RealmManager.shared.mainThreadRealm) {
        self.netWorkService = netWorkService
        self.realm = realm
        self.disposeBag = DisposeBag()
    }

    func transform(input: Input) -> Output {
        let reload = searchText.asObservable().filter{
                $0.count > 2
        }.debug()
            .debounce(1, scheduler: MainScheduler.instance)
            .flatMap { [weak self] text -> Single<[WeatherEntity]> in
                guard let self = self else { return .just([]) }
                return self.netWorkService.getWeatherForecast(text)
                    .catchErrorJustReturn(WeatherForecastResponseEntity())
                    .map { [weak self] in
                        guard let self = self,
                            let city = $0.city else { return [] }
                        let weatherArray = Array(city.weatherList)
                        self.weatherItems = weatherArray
                        return weatherArray
                }
        }
        return Output(reloadData: Driver<Void>.just(()),
                      items: reload)
    }

    func weatherDataSource(at index: Int) -> WeatherDataSource {
        guard 0 <= index && index < weatherItems.count else { return WeatherDataSource() }
        return WeatherDataSource(withWeatherItem: weatherItems[index])
    }
}


extension WeatherForecastViewModel {
    struct Input {
//        let searchTrigger: Driver<String>
    }

    struct Output {
        let reloadData: Driver<Void>
        let items: Observable<[WeatherEntity]>
    }
}
