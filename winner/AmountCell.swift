//
//  AmountCell.swift
//  winner
//
//  Created by Dide van Berkel on 13/05/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit

class AmountCell: UITableViewCell {

    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupAmountCell(bebasFont: Bool, size: Int, text: String, editable: Bool, center: Bool) {
        
        let strAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "BebasNeue", size: CGFloat(size))]
        let str = NSAttributedString(string: text, attributes: strAttributes)
        amountLabel.attributedText = str
        
    }
    @IBAction func minusButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
    }
    
}
