//
//  CityTableViewCell.swift
//  weather app
//
//  Created by Mohammad Kiani on 2020-01-17.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cityIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCity(city: String) {
        cityLbl.text = city
        if let weatherUrl = WeatherURLManager.getCityWeatherURL(city: city) {
            // create a session
            let session = URLSession.shared
            // create a task
            let task = session.dataTask(with: weatherUrl) { (data, response, error) in
                if data != nil {
                    // load the temp
                    if let weatherData = try? JSON(data: data!) {
                        print(weatherData)
                        let tempValue = weatherData["main"]["temp"].intValue
                        self.loadIcon(weatherData: weatherData)
                        // UI is in main thread
                        DispatchQueue.main.async {
                            self.tempLbl.text = "\(tempValue)"
                        }
                    }
                }
            }
            // start the task
            task.resume()
        }
    }
    
    func loadIcon(weatherData: JSON) {
        let weatherArray = weatherData["weather"].arrayValue
        let iconCode = weatherArray[0]["icon"].stringValue
        if let iconUrl = WeatherURLManager.getWeatherIconURL(iconCode: iconCode) {
            let session = URLSession.shared
            let task = session.dataTask(with: iconUrl) { (data, response, error) in
                if let iconData = data {
                    // update the UI
                    DispatchQueue.main.async {
                        self.cityIcon.image = UIImage(data: iconData)
                    }
                }
            }
        }
    }

}
