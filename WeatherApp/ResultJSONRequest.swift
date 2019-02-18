//
//  ResultJSONRequest.swift
//  WeatherApp
//
//  Created by evgen on 21.01.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit
import Alamofire

class ResultJSONRequest: NSObject {

    static let shared = ResultJSONRequest()
    let appid = "528d9cb34a7a57d56465d8952b15c364"
    
    func getWeather5DayBy(latitude lat : Double, longitude lon : Double, success : ((Model) -> Void)?, failure : ((String) -> Void)? ) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast")
        Alamofire.request(url!, method: .get, parameters: ["lat":lat,
                                                           "lon":lon,
                                                           "appid": appid,
                                                           "units":"metric"],
                          encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                            switch response.result {
                            case .success:
                                success?(Model(json: response.value as! [String : Any]))
                                break
                            case .failure:
                                failure?("Error")
                                break
                            }
        }
    }
    
    func getWeatherTodayBy(latitude lat : Double, longitude lon : Double, success : ((ModelToday) -> Void)?, failure : ((String) -> Void)? ) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather")
        Alamofire.request(url!, method: .get, parameters: ["lat":lat,
                                                           "lon":lon,
                                                           "appid": appid,
                                                           "units":"metric",
                                                           "lang":"ua"],
                          encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                            switch response.result {
                            case .success:
                                success?(ModelToday(json: response.value as! [String:Any]))
                                break
                            case .failure:
                                failure?("Error")
                                break
                            }
        }
    }
    
    
}
