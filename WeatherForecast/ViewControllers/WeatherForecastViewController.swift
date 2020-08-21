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

    private struct Constants {
        static let WeatherTableViewCellIndentifier = "WeatherTableViewCellIndentifier"
        static let WeatherTableViewCellHeight: CGFloat = 150
    }

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
        configureTableView()
    }

    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: WeatherTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: Constants.WeatherTableViewCellIndentifier)
        tableView.allowsSelection = false
        tableView.rowHeight = Constants.WeatherTableViewCellHeight
    }

    private func bindViewModel() {
        viewModel = WeatherForecastViewModel()
        let input = buildViewModelInput()
        let output = viewModel.transform(input: input)
        output.reloadData.debug().drive({ [weak self] (_) in
            self?.tableView.reloadData()
        })
        output.items.debug().bind(to: tableView.rx.items) { [weak self] (tableView, row, element) in
            let indexPath = IndexPath(row: row, section: .zero)
            guard let self = self,
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.WeatherTableViewCellIndentifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
            cell.configure(dataSource: self.viewModel.weatherDataSource(at: row))
            return cell
        }.disposed(by: disposeBag)
    }

    private func buildViewModelInput() -> WeatherForecastViewModel.Input {
        searchBar.rx.text.orEmpty.bind(to: viewModel.searchText).disposed(by: disposeBag)
        searchBar.rx.cancelButtonClicked.asDriver().drive(onNext: { _ in
            self.searchBar.resignFirstResponder()
        }).disposed(by: disposeBag)
        return WeatherForecastViewModel.Input()
    }

}

//extension WeatherForecastViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//}

