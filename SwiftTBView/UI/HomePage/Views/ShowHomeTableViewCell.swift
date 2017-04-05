//
//  ShowHomeTableViewCell.swift
//  SwiftTBView
//
//  Created by kun shen on 2017/3/21.
//  Copyright © 2017年 kun shen. All rights reserved.
//

import UIKit

protocol ShowHomeTableViewCellDelegate {
    
    func doSelect(_ sender: Any)
}

class ShowHomeTableViewCell: UITableViewCell {
    
    @IBOutlet var showImageView: UIImageView?
    @IBOutlet var showNameLabel: UILabel?
    @IBOutlet var selectButton: UIButton?
    var delegate: ShowHomeTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectButton!.layer.cornerRadius = 15
        self.selectButton!.layer.masksToBounds = true
        self.selectButton!.backgroundColor = UIColor.blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func doSelect(_ sender: Any) {
        
        if delegate != nil {
            delegate!.doSelect(sender)
        }
    }
}
