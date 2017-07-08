//
//  TitleCell.swift
//  winner
//
//  Created by Dide van Berkel on 25/05/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupTitleCell(bebasFont: Bool, size: Int, text: String, editable: Bool, center: Bool) {
        
        let strAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "BebasNeue", size: CGFloat(size))]
        let str = NSAttributedString(string: text, attributes: strAttributes)
        titleLabel.attributedText = str
        
        if center {
            titleLabel.textAlignment = .center
        } else {
            titleLabel.textAlignment = .left
        }
    }
    
}
