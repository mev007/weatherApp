//
//  WeatherItemCollectionViewCell.swift
//  WeatherApp
//
//  Created by evgen on 26.01.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit
import AlamofireImage

class WeatherItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ data: [ModelItem], cellForItemAt index: Int) {
        let item = data[index]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+2:00")
        //dateFormatter.timeZone = TimeZone(identifier: "GMT")
        if let dateTime = item.dateTime {
            let localTime = dateFormatter.string(from: dateTime)
            timeLabel.text = localTime
            timeLabel.textColor = UIColor.white
            //-------
            let df = DateFormatter()
            df.dateFormat = "dd.MM.yyyy HH:mm"
            print(df.string(from: dateTime))
            //------
        }
        if let weatherIconURL = item.weatherIconURL {
            weatherIconImage.af_setImage(withURL: weatherIconURL)
        }
        if let temp = item.temp {
            if Int(temp) >= 0 {
                self.tempLabel.textColor = UIColor.init(red: 247/255, green: 89/255, blue: 0, alpha: 1)
            } else {
                self.tempLabel.textColor = UIColor.init(red: 111/255, green: 215/255, blue: 247/255, alpha: 1)
            }
            tempLabel.text = "\(Int(temp))"
        }
        if let pressure = item.pressure {
            pressureLabel.textColor = UIColor.white
            pressureLabel.text = "\(Int(pressure*0.75006375541921))"
        }
        if let windSpeed = item.windSpeed {
            windSpeedLabel.textColor = UIColor.white
            windSpeedLabel.text = "\(Int(windSpeed))"
        }
        if let humidity = item.humidity {
            humidityLabel.text = "\(Int(humidity))"
            humidityLabel.textColor = UIColor.init(red: 247/255, green: 89/255, blue: 0, alpha: 1)
        }
    }
    
    static func cellSize() -> CGSize {
        return CGSize(width: 50, height: 187)
    }
    
    

}
