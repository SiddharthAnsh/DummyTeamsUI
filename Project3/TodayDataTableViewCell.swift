//
//  TodayDataTableViewCell.swift
//  Project3
//
//  Created by Siddharth Ansh on 18/02/25.
//

import UIKit

class TodayDataTableViewCell: UITableViewCell {

    @IBOutlet weak var topic : UILabel!
    @IBOutlet weak var header : UILabel!
    @IBOutlet weak var subHeader : UILabel!
    @IBOutlet weak var date : UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            setupRoundedCell()
        }

        private func setupRoundedCell() {
            contentView.layer.cornerRadius = 15
            contentView.layer.masksToBounds = true
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.lightGray.cgColor
            
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowRadius = 4
            layer.shadowOpacity = 0.2
            layer.masksToBounds = false
        }

}
