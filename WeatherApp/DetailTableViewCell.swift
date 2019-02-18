//
//  DetailTableViewCell.swift
//  WeatherApp
//
//  Created by evgen on 04.02.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var razdelitelLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = UIColor(red: 205/255, green: 217/255, blue: 254/255, alpha: 1)
        razdelitelLabel.textColor = UIColor(red:205/255, green:217/255, blue:254/255, alpha:1)
        valueLabel.textColor = UIColor(red: 205/255, green: 217/255, blue: 254/255, alpha: 1)
        titleLabel.text = ""
        razdelitelLabel.text = ""
        valueLabel.text = ""
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func cellSize() -> CGFloat {
        return 23
    }
    
    // повертаэ кылькысть майбутных рядкыв
    static func setCountCell() -> Int {
        return 10
    }
    
    func setData(_ data: ModelToday, cellForItemAt index: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+2:00")
        
        switch index {
        case 0:
            if let dateTime = data.dateTime {
                titleLabel.text = "Поточний час"
                razdelitelLabel.text = ":"
                valueLabel.text = dateFormatter.string(from: dateTime)
            }
        case 1:
            if let descriptionWeather = data.descriptionWeather {
                titleLabel.text = "Сьогодні"
                razdelitelLabel.text = ":"
                valueLabel.text = descriptionWeather
            }
        case 2:
            if let sunrise = data.sunrise {
                titleLabel.text = "Схід сонця"
                razdelitelLabel.text = ":"
                valueLabel.text = dateFormatter.string(from: sunrise)
            }
        case 3:
            if let sunset = data.sunset {
                titleLabel.text = "Захід сонця"
                razdelitelLabel.text = ":"
                valueLabel.text = dateFormatter.string(from: sunset)
            }
        case 4:
            if let pressure = data.pressure {
                titleLabel.text = "Тиск"
                razdelitelLabel.text = ":"
                valueLabel.text = "\(pressure) гПа"
            }
        case 5:
            if let humidity = data.humidity {
                titleLabel.text = "Вологість"
                razdelitelLabel.text = ":"
                valueLabel.text = "\(humidity)%"
            }
        case 6:
            if let windSpeed = data.windSpeed {
                titleLabel.text = "Швидкість вітру"
                razdelitelLabel.text = ":"
                valueLabel.text = "\(windSpeed)м/с"
            }
        case 7:
            if let clouds = data.clouds {
                titleLabel.text = "Хмарність"
                razdelitelLabel.text = ":"
                valueLabel.text = "\(clouds)%"
            }
        case 8:
            if let tempMin = data.tempMin {
                titleLabel.text = "Мін.температура"
                razdelitelLabel.text = ":"
                valueLabel.text = "\(tempMin)ºC"
            }
        case 9:
            if let tempMax = data.tempMax {
                titleLabel.text = "Макс.температура"
                razdelitelLabel.text = ":"
                valueLabel.text = "\(tempMax)ºC"
            }
        //var coord:Coordinate?   //координати
        //var windDeg:Double?     //кут вітру
        default: break
        }
    }
}












