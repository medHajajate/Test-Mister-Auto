//
//  UserTableViewCell.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/20/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with user: User)  {
        self.titleLabel.text = user.name
        self.subTitleLabel.text = user.email
    }
    
    func update(with task: Task) {
        self.titleLabel.text = task.title
        self.subTitleLabel.text = task.completed ? "completed" : " not completed"
        self.subTitleLabel.textColor = task.completed ? .green : .red
    }
}
