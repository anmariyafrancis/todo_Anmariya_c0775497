//
//  pCellTableViewCell.swift
//  todo_Anmariya_c0775497
//
//  Created by user176498 on 6/29/20.
//  Copyright © 2020 user176498. All rights reserved.
//

import UIKit

class pCellTableViewCell: UITableViewCell {

       @IBOutlet weak var priority: UILabel!
       @IBOutlet weak var task: UILabel!

       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }


}
