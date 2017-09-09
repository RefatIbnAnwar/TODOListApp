//
//  DoneTableViewCell.swift
//  TODOListApp
//
//  Created by Sium on 9/9/17.
//  Copyright © 2017 refat. All rights reserved.
//

import UIKit

class DoneTableViewCell: UITableViewCell {

    @IBOutlet weak var doneTaskLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        doneTaskLabelOutlet.layer.masksToBounds = true
        doneTaskLabelOutlet.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
