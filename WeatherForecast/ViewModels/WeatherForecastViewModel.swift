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
    private let disposeBag: DisposeBag
    private let realm: Realm

    init(realm: Realm = RealmManager.shared.mainThreadRealm) {
        self.realm = realm
        self.disposeBag = DisposeBag()
    }

    func transform(input: Input) -> Output {
        let reload = searchText.asObservable().filter{ $0.count > 3 }
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map { _ -> Driver<Void> in
                return .just(())
        }
//        }.asDriver(onErrorDriveWith: .empty())
        return Output(reloadData: .empty())
    }
}


extension WeatherForecastViewModel {
    struct Input {
//        let searchTrigger: Driver<String>
    }

    struct Output {
        let reloadData: Driver<Void>
//        let items: Driver<[Weath]>
    }
}
