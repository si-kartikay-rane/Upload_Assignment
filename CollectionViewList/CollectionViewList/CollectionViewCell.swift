//
//  CollectionViewCell.swift
//  CollectionViewList
//
//  Created by Kartikay Rane on 12/10/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    func configure(with numberCount: Int){
        numberLabel.text = String(numberCount)
    }
}
