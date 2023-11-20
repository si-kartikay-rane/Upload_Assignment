//
//  MyCollectionViewCell.swift
//  TableViewCellWithCollectionView
//
//  Created by Kartikay Rane on 02/11/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView : UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with model: Model) {
            self.myLabel.text = model.text

            if let url = URL(string: model.imageName) {
                // Load image asynchronously (you might want to use a library like SDWebImage for better performance)
                URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        self?.myImageView.image = UIImage(data: data)
                        self?.myImageView.contentMode = .scaleAspectFill
                    }
                }.resume()
            }
        }

}
