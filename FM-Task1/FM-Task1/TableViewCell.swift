//
//  TableViewCell.swift
//  FM-Task1
//
//  Created by SoiriYuichi on 2022/07/29.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var offImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        
    }
}
