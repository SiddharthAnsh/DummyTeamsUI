//
//  WorkingTodayTableViewCellVC.swift
//  Project3
//
//  Created by Siddharth Ansh on 20/02/25.
//

import UIKit

class WorkingTodayTableViewCellVC: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellStyle()
    }

    private func setupCellStyle() {
            contentView.layer.masksToBounds = true
            contentView.layer.cornerRadius = 12
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.lightGray.cgColor
            
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.1
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowRadius = 4
            layer.masksToBounds = false
            layer.cornerRadius = 12
            
            let paddingView = UIView(frame: CGRect(x: 10, y: 5, width: contentView.frame.width - 20, height: contentView.frame.height - 10))
            paddingView.backgroundColor = .white
            paddingView.layer.cornerRadius = 12
            contentView.addSubview(paddingView)
            contentView.sendSubviewToBack(paddingView)
        }
    
}
