//
//  Model.swift
//  WeatherApp
//
//  Created by evgen on 20.01.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit

struct Coordinate {
    var lat:Double
    var lon:Double
}

class Model: NSObject {
    
    var coord:Coordinate?   //координати
    var nameCountry:String?    //назва країни
    var nameCity:String?    //назва міста
    var idCity:Int?         //id міста
    
    var countList:Int?      //кількість елементів в списку
    
    var listWeather = [ModelItem]()       //погоди за різні моменти часу
    
    
    init(json: [String:Any]) {
        if let city = json["city"] as? [String:Any]{
            if let id = city["id"] as? Int {            //id міста
                idCity = id
            }
            if let country = city["country"] as? String {
                nameCountry = country                         //назва країни
            }
            if let name = city["name"] as? String {
                nameCity = name                         //назва міста
            }
            if let coord = city["coord"] as? [String:NSNumber] {         //координати
                if let lat = coord["lat"], let lon = coord["lon"] {
                    self.coord = Coordinate(lat: lat.doubleValue, lon: lon.doubleValue)
                }
            }
        }
        
        if let cnt = json["cnt"] as? Int {
            countList = cnt
        }
        
        if let list = json["list"] as? [[String:Any]] {
            for item in list {
                let modelItem = ModelItem(item: item)
                listWeather.append(modelItem)
            }
        }        
    }
    
}
