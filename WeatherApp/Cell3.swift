//
//  Cell3.swift
//  WeatherApp
//
//  Created by evgen on 03.02.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit

class Cell3: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    var item : ModelToday?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.register(UINib.init(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        NotificationCenter.default.addObserver(forName: NSNotification.Name.init("Set the weather today"), object: nil, queue: nil)   {    (notofication) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }        // Отримуємо повідомлення   «Set the weather today»   і виконуємо дію
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ data: ModelToday){
        item = data
    }
    
}

extension Cell3: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DetailTableViewCell.cellSize()
    }
}

extension Cell3: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailTableViewCell.setCountCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell") as! DetailTableViewCell
        if let item = item {
            cell.setData(item, cellForItemAt: indexPath.row)
        }
        return cell
    }
}














