//
//  MainTableViewCell.swift
//  TableViewPrj
//
//  Created by 정주호 on 24/08/2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var movieNameLable: UILabel!
    
    @IBOutlet weak var discriptionLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
