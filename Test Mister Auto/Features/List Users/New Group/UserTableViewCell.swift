//
//  UserTableViewCell.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/20/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with user: User)  {
        self.nameLabel.text = user.name
        self.mailLabel.text = user.email
    }
    
}
