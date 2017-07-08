//
//  GoalDetailViewController.swift
//  winner
//
//  Created by Dide van Berkel on 26/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit
import CoreData

class GoalDetailViewController: UIViewController {
    
    var fetchedGoals = [Goal]()
    var goalId: Int!
    var activityId: Int!
    var period: String!
    var target: Int!
    var progress: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
