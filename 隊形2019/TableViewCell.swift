//
//  TableViewCell.swift
//  隊形2019
//
//  Created by 野崎絵未里 on 2019/05/13.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var saveTitleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
