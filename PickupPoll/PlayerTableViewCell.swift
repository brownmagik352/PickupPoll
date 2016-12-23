//
//  PlayerTableViewCell.swift
//  PickupPoll
//
//  Created by Apurv Suman on 12/23/16.
//  Copyright © 2016 Apurv Suman. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playingSwitch: UISwitch!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
