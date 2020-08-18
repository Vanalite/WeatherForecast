//
//  ViewController.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherForecastViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var viewModel: WeatherForecastViewModel!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        bindViewModel()
    }

    private func configureUI() {
        title = "Weather Forecast"
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func bindViewModel() {
        let input = buildViewModelInput()
        let output = viewModel.transform(input: input)
        output.reloadData.do(onNext: { [weak self] (_) in
            self?.tableView.reloadData()
        })
    }

    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        searchBar.resignFirstResponder()
    }

    private func buildViewModelInput() -> WeatherForecastViewModel.Input {
        searchBar.rx.text.orEmpty.bind(to: viewModel.searchText)
        return WeatherForecastViewModel.Input()
//        let searchTrigger = searchBar.rx.text.changed.distinctUntilChanged().filter({ text -> Bool in
//            if let text = text, text.count > 3 {
//                return true
//            }
//            return false
//        }).asDriver(onErrorDriveWith: Driver<ControlEvent<String>>("")))
//        return WeatherForecastViewModel.Input(searchTrigger: searchTrigger)
//        return WeatherForecastViewModel.Input(searchTrigger: searchBar.rx.text.distinctUntilChanged().filter({ text -> Bool in
//            if let text = text, text.count > 3 {
//                return true
//            }
//            return false
//        }).asDriver(onErrorJustReturn: Observable<ControlProperty<String?>.E>.E)(""))
    }

}

extension WeatherForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

