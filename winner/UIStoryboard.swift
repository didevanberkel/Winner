//
//  UIStoryboard.swift
//  winner
//
//  Created by Dide van Berkel on 09/05/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func activityStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Activity", bundle: Bundle.main)
    }
    
    class func goalStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Goal", bundle: Bundle.main)
    }
    
    class func settingsStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Settings", bundle: Bundle.main)
    }

}

