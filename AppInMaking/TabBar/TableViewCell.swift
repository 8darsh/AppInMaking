//
//  TableViewCell.swift
//  TabBar
//
//  Created by Adarsh Singh on 31/08/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet var tt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
