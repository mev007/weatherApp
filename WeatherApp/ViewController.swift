//
//  ViewController.swift
//  WeatherApp
//
//  Created by evgen on 20.01.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var weatherData:Model?
    var weatherTodayData:ModelToday?
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.register(UINib.init(nibName: "Cell1", bundle: nil), forCellReuseIdentifier: "Cell1")
        tableViewMain.register(UINib.init(nibName: "Cell2", bundle: nil), forCellReuseIdentifier: "Cell2")
        tableViewMain.register(UINib.init(nibName: "Cell3", bundle: nil), forCellReuseIdentifier: "Cell3")
        tableViewMain.separatorStyle = .none
        
        ResultJSONRequest.shared.getWeather5DayBy(latitude: 49.791161, longitude: 33.72258, success: { (model) in
            self.weatherData = model
            self.tableViewMain.reloadData()
        }, failure: nil)
    
        ResultJSONRequest.shared.getWeatherTodayBy(latitude: 49.791161, longitude: 33.72258, success: { (model) in
            self.weatherTodayData = model
            self.tableViewMain.reloadData()
            NotificationCenter.default.post(name: NSNotification.Name.init("Set the weather today"), object: self)  
        }, failure: nil)
    }

    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Cell1") as! Cell1
            cell.setData(weatherData)
            return cell
        case 1:
            let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Cell2") as! Cell2
            if let list = weatherData?.listWeather {
                cell.setData(list)
            }
            return cell
        case 2:
            let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Cell3") as! Cell3
            if let weatherTodayData = weatherTodayData {
                cell.setData(weatherTodayData)
            }
            return cell
        default:
            return UITableViewCell()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return (self.view.frame.height / 4)
        case 1:
            return WeatherItemCollectionViewCell.cellSize().height + 20
        default:
            return 300
        }
    }
}
