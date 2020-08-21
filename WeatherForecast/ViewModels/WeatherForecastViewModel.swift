//
//  WeatherForecastViewModel.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import RxSwift
import RxCocoa
import RealmSwift
import RxRealm

final class WeatherForecastViewModel: ViewModelType {
    var searchText = Variable<String>("")
    private var rxWeatherItems: Observable<(Array<WeatherEntity>, RealmChangeset?)> = Observable.empty()

    private let netWorkService : NetworkService
    private let realm: Realm

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
                return self.netWorkService.getWeatherForecast(text).map {
                    guard let city = $0.city else { return [] }
                    return Array(city.weatherList)
                }
        }
        return Output(reloadData: Driver<Void>.just(()),
                      items: reload)
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
