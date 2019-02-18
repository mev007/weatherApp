//
//  ModelToday.swift
//  WeatherApp
//
//  Created by evgen on 03.02.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit


class ModelToday: NSObject {

    var coord:Coordinate?   //координати
    
    var descriptionWeather:String?     //опис погоди
    var temp:Double?        //температура
    var pressure:Double?    //тиск
    var humidity:Double?    //вологість
    var tempMin:Double?
    var tempMax:Double?
    var windSpeed:Double?   //швидкість вітру
    var windDeg:Double?     //кут вітру
    var clouds:Double?      //Хмарність %
    var dateTime: Date?       //дата і час
    var sunrise: Date?        //схід сонця
    var sunset: Date?         //захід сонця
    //    var weatherIconURL:URL? //URL іконки з зображенням
    
 
    init(json: [String:Any]) {
        //визначення координат
        if let coord = json["coord"] as? [String:NSNumber]{
            if let lat = coord["lat"], let lon = coord["lon"] {
                self.coord = Coordinate(lat: lat.doubleValue, lon: lon.doubleValue)
            }
        }
        // визначення назви погоди і іконки зображення погоди
        if let weatherArray = json["weather"] as? [[String:Any]] {
            if let description = weatherArray.first!["description"] as? String {
                descriptionWeather = description
            }
//            if let icon = weatherArray.first!["icon"] {
//                if let nameIcon = (icon as? String) {
//                    if let url = URL(string: (urlIcon + nameIcon + ".png")) {
//                        weatherIconURL = url
//                        //print(weatherIconURL)
//                    }
//                }
//            }
        }
        
        if let main = json["main"] as? [String:NSNumber] {
            temp = main["temp"]?.doubleValue
            pressure = main["pressure"]?.doubleValue
            humidity = main["humidity"]?.doubleValue
            tempMin = main["temp_min"]?.doubleValue
            tempMax = main["temp_max"]?.doubleValue
        }
        
        if let wind = json["wind"] as? [String:NSNumber] {
            windSpeed = wind["speed"]?.doubleValue
            windDeg = wind["deg"]?.doubleValue
        }
        
        if let clouds = json["clouds"] as? [String:NSNumber] {
            self.clouds = clouds["all"]?.doubleValue
        }
        
        if let clouds = json["clouds"] as? [String:NSNumber] {
            self.clouds = clouds["all"]?.doubleValue
        }
        
        if let dt = json["dt"] as? Double {
            dateTime = Date(timeIntervalSince1970: dt)          //дата і чаc
        }
        
        if let sys = json["sys"] as? [String:Any] {
            if let sunrise = sys["sunrise"] {
                self.sunrise = Date(timeIntervalSince1970: sunrise as! TimeInterval)
            }
            if let sunset = sys["sunset"] {
                self.sunset = Date(timeIntervalSince1970: sunset as! TimeInterval)
            }
        }
    }
    
}
