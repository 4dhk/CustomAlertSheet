//
//  CustomTableViewCell.swift
//  输入框
//
//  Created by quandemacbook on 2016/12/28.
//  Copyright © 2016年 daquan xu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var contextLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func  setContent(){
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
