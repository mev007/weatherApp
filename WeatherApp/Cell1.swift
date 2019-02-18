//
//  Cell1.swift
//  WeatherApp
//
//  Created by evgen on 24.01.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit

class Cell1: UITableViewCell {

    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var znakLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameCityLabel.textColor = UIColor.white
        tempLabel.textColor = UIColor.white
        znakLabel.textColor = UIColor.white
        nameCityLabel.text = ""
        tempLabel.text = ""
        znakLabel.text = ""
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ data: Model?){
        nameCityLabel.text = data?.nameCity
        if let temp = data?.listWeather.first?.temp {
            tempLabel.text = "\(Int(temp))"
            znakLabel.text = "º"
        } else {
            tempLabel.text = ""
        }
        
    }
    
    

}
