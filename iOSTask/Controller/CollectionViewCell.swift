//
//  CollectionViewCell.swift
//  iOSTask
//
//  Created by Omar on 11/09/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var item: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 15
        contentView.layer.cornerRadius = 15
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2))
        contentView.layer.masksToBounds = true
    }
    

}
