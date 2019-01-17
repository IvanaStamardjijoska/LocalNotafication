//
//  TaskTableViewCell.swift
//  LocalNotafication
//
//  Created by CodeWell on 1/16/19.
//  Copyright © 2019 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCellWithTitle(title:String) {
        taskTitleLabel.text = title
    }

}
