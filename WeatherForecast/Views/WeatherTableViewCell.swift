//
//  WeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/20/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.selectionStyle = .none
    }

    func configure(dataSource: WeatherDataSource) {
        self.dateLabel.text = dataSource.date
        self.temperatureLabel.text = dataSource.temperatureText
        self.pressureLabel.text = dataSource.pressureText
        self.humidityLabel.text = dataSource.humidityText
        self.descriptionLabel.text = dataSource.descriptionText
    }
}
