//
//  WinnerColor.swift
//  winner
//
//  Created by Dide van Berkel on 25/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit

class BaseColors {
    class func lightBlue() -> UIColor { return UIColor(red: 63/255, green: 176/255, blue: 172/255, alpha: 1) }
    class func darkBlue() -> UIColor { return UIColor(red: 23/255, green: 62/255, blue: 67/255, alpha: 1) }
    class func beige() -> UIColor { return UIColor(red: 221/255, green: 223/255, blue: 212/255, alpha: 1) }
    class func yellow() -> UIColor { return UIColor(red: 250/255, green: 229/255, blue: 150/255, alpha: 1) }
}

class ImageColors {
    class func lightBlueImage() -> UIImage { return getColoredImage(color: BaseColors.lightBlue()) }
    class func darkBlueImage() -> UIImage { return getColoredImage(color: BaseColors.darkBlue()) }
    class func beigeImage() -> UIImage { return getColoredImage(color: BaseColors.beige()) }
    class func yellowImage() -> UIImage { return getColoredImage(color: BaseColors.yellow()) }
}

func getColoredImage(color : UIColor) -> UIImage {
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
    UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return colorImage!
}
