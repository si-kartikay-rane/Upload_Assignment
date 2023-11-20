//
//  MatchTableViewCell.swift
//  APICalls
//
//  Created by Kartikay Rane on 09/11/23.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    
        @IBOutlet weak var teamHomeLabel: UILabel!
        @IBOutlet weak var teamAwayLabel: UILabel!
        @IBOutlet weak var matchStatusLabel: UILabel!
        
    @IBOutlet weak var venue: UILabel!
    
    @IBOutlet weak var tourName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
