//
//  ModelItem.swift
//  WeatherApp
//
//  Created by evgen on 23.01.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit

class ModelItem: NSObject {

    var dateTime: Date?         //дата і час
    var temp: Double?           //температура
    var pressure: Double?       //тиск на рівні моря
    var humidity: Double?       //вологість %
    var weatherId: Int?         //код погоди
    var weatherName: String?    //назва погоди
    var weatherIconURL: URL?    //URL іконки з погодою
    var clouds: Double?         //хмарність %
    var windSpeed: Double?      //швидкість вітру м/с
    var windDeg: Double?        //напрямок вітру - градуси
    var rain: Double?           //Об'єм дощу за останні 3 години, мм
    var snow: Double?           //Обсяг снігу за останні 3 години
    
    
    private let urlIcon = "http://openweathermap.org/img/w/"
    
    init(item: [String:Any]) {
        if let dt = item["dt"] as? Double {
            dateTime = Date(timeIntervalSince1970: dt)          //дата і час
//            let date = Date(timeIntervalSince1970: dt)
//            let dateFormatter = DateFormatter()
//            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
//            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
//            dateFormatter.timeZone = TimeZone(identifier: "GMT")
//            let localDate = dateFormatter.string(from: date)
        }
        if let main = item["main"] as? [String: Double] {
            temp = main["temp"]                         //температура
            pressure = main["pressure"]                 //тиск на рівні моря
            humidity = main["humidity"]                 //вологість %
        }
        if let weather = item["weather"] as? [[String: Any]] {
            if let weatherFirst = weather.first {
                weatherId = weatherFirst["id"] as? Int              //код погоди
                weatherName = weatherFirst["main"] as? String       //назва погоди
                if let nameIcon = weatherFirst["icon"] as? String {
                    if let url = URL(string: (urlIcon + nameIcon + ".png")) {
                        weatherIconURL = url                        //URL іконки з погодою
                    }
                }
            }
        }
        if let clouds = item["clouds"] as? [String: Double] {
            self.clouds = clouds["all"]                     //хмарність %
        }
        if let wind = item["wind"] as? [String: Double] {
            windSpeed = wind["speed"]                       //швидкість вітру м/с
            windDeg = wind["deg"]                           //напрямок вітру - градуси
        }
        if let rain = item["rain"] as? [String: Double] {
            self.rain = rain["3h"]                          //Об'єм дощу за останні 3 години, мм
        }
        if let snow = item["snow"] as? [String: Double] {
            self.snow = snow["3h"]                          //Обсяг снігу за останні 3 години
        }
    }
    
}
