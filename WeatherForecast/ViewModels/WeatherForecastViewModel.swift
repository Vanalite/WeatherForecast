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
    private let disposeBag: DisposeBag
    private let realm: Realm

    init(realm: Realm = RealmManager.shared.mainThreadRealm) {
        self.realm = realm
        self.disposeBag = DisposeBag()
    }

    func transform(input: Input) -> Output {
        let reloadData = input.searchTrigger.map { searchText in

        }
        return Output(reloadData: reloadData)
    }
}


extension WeatherForecastViewModel {
    struct Input {
        let searchTrigger: Driver<String>
    }

    struct Output {
        let reloadData: Driver<Void>
    }
}
