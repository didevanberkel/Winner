//
//  WinnerButton.swift
//  winner
//
//  Created by Dide van Berkel on 25/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit

enum ButtonType {
    case Blue
    case Beige
    case ActivityButton
    case SettingsButton
    case GoalButton
}

class WinnerButton : UIButton {
    var typeOfButton : ButtonType = .Blue
    
    override func draw(_ rect: CGRect) {
        switch self.typeOfButton {
        case ButtonType.Blue:
            self.backgroundColor = BaseColors.lightBlue()
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .normal)
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .disabled)
            /*self.layer.shadowColor = BaseColors.beige().cgColor
            self.layer.shadowOpacity = 0.8
            self.layer.shadowRadius = 5.0
            self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)*/
            break
        case ButtonType.Beige:
            self.backgroundColor = BaseColors.beige()
            break
        case ButtonType.SettingsButton:
            self.backgroundColor = BaseColors.lightBlue()
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .normal)
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .disabled)
            let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
            view.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
            view.image = UIImage(named: "settings")
            self.addSubview(view)
            break
        case ButtonType.ActivityButton:
            self.backgroundColor = BaseColors.lightBlue()
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .normal)
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .disabled)
            let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            view.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
            view.image = UIImage(named: "activity")
            self.addSubview(view)
            break
        case ButtonType.GoalButton:
            self.backgroundColor = BaseColors.lightBlue()
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .normal)
            self.setBackgroundImage(ImageColors.lightBlueImage(), for: .disabled)
            let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            view.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
            view.image = UIImage(named: "goal")
            self.addSubview(view)
            break
        }
        
        self.layer.cornerRadius = self.frame.size.height / 2//0.5 * self.bounds.size.width
        self.clipsToBounds = true
    }
}

