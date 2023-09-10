//
//  TableViewCell.swift
//  iOSTask
//
//  Created by Omar on 11/09/2023.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var item: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        item.layer.cornerRadius = item.frame.size.height / 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
