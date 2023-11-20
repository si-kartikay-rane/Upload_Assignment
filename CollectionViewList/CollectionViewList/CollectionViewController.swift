//
//  CollectionViewController.swift
//  CollectionViewList
//
//  Created by Kartikay Rane on 12/10/23.
//

import UIKit

let dataSource = Array(1...100)

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell{
            customCell.configure(with: dataSource[indexPath.row])
            if indexPath.row % 2 == 0 {
                customCell.backgroundColor = UIColor.red
            }else{
                customCell.backgroundColor = UIColor.white
            }
            
            cell = customCell
        }
        return cell
    }

}
