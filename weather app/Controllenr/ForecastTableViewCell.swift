//
//  ForecastTableViewCell.swift
//  weather app
//
//  Created by Mohammad Kiani on 2020-01-17.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var feelLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setForecast(forecast: ForecastData) {
        dateLbl.text = forecast.dateString
        timeLbl.text = forecast.hour
        highTempLbl.text = "\(forecast.highTemp)º"
        lowTempLbl.text = "\(forecast.lowTemp)º"
        tempLbl.text = "\(forecast.dayTemp)º"
        feelLbl.text = "\(forecast.feelTemp)º"
        
        loadImage(iconCode: forecast.iconCode)
    }
    
    func loadImage(iconCode: String) {
        if let iconUrl = WeatherURLManager.getWeatherIconURL(iconCode: iconCode) {
            let session = URLSession.shared
            let task = session.dataTask(with: iconUrl) { (data, response, error) in
                if data != nil {
                    DispatchQueue.main.async {
                        self.iconImg.image = UIImage(data: data!)
                    }
                }
            }
            task.resume()
        }
        
        
    }

}
