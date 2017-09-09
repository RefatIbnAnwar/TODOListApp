//
//  PendingTableViewCell.swift
//  TODOListApp
//
//  Created by Sium on 9/9/17.
//  Copyright © 2017 refat. All rights reserved.
//

import UIKit

class PendingTableViewCell: UITableViewCell {
    @IBOutlet weak var pendingTaskLabelOutlet: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //for corner
        pendingTaskLabelOutlet.layer.masksToBounds = true
        pendingTaskLabelOutlet.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
