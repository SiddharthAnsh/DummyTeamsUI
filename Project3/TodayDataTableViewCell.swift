//
//  TodayDataTableViewCell.swift
//  Project3
//
//  Created by Siddharth Ansh on 18/02/25.
//

import UIKit

class TodayDataTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topic : UILabel!
    @IBOutlet weak var header : UILabel!
    @IBOutlet weak var subHeader : UILabel!
    @IBOutlet weak var date : UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            setupRoundedCell()
        }

        private func setupRoundedCell() {
            containerView.layer.cornerRadius = 15
            containerView.layer.masksToBounds = true
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.lightGray.cgColor
            
            containerView.layer.shadowColor = UIColor.black.cgColor
            containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
            containerView.layer.shadowRadius = 4
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.masksToBounds = false
        }

}
