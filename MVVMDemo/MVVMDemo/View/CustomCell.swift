//
//  CustomCell.swift
//  MVVMDemo
//
//  Created by Divyam on 08/06/21.
//

import Foundation
import UIKit
import SDWebImage

class CustomCell:UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
    }
    
}
