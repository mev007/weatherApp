//
//  Cell2.swift
//  WeatherApp
//
//  Created by evgen on 25.01.19.
//  Copyright © 2019 evgen. All rights reserved.
//

import UIKit

class Cell2: UITableViewCell {

    var item = [ModelItem]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib.init(nibName: "WeatherItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WeatherItemCollectionViewCell")
        collectionView.register(UINib.init(nibName: "TitleItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TitleItemCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ data: [ModelItem]) {
        item = data
        collectionView.reloadData()
    }
}

extension Cell2: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleItemCollectionViewCell", for: indexPath) as! TitleItemCollectionViewCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherItemCollectionViewCell", for: indexPath) as! WeatherItemCollectionViewCell
            cell.setData(item, cellForItemAt: indexPath.row - 1)
            return cell
        }
    }
}

extension Cell2: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return TitleItemCollectionViewCell.cellSize()
        default:
            return WeatherItemCollectionViewCell.cellSize()
        }
    }
}








