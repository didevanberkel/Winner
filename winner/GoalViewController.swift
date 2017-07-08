//
//  GoalViewController.swift
//  winner
//
//  Created by Dide van Berkel on 25/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit
import CoreData

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var fetchedGoals = [Goal]()
    var fetchedActivities = [Activity]()
    
    var goalId: Int!
    var activityId: Int!
    var period: String!
    var target: Int!
    var progress: Int!
    var activityTitle: String!
    var activityDesc: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchedGoals = GoalModel.fetchGoal()
        self.fetchedGoals = self.fetchedGoals.sorted(by: { $0.goal_id < $1.goal_id })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCell", for: indexPath) as! SelectCell
        let activityId = ((fetchedGoals[indexPath.row]) as AnyObject).value(forKey: "activity_id")
        let fetchedSingleActivity = ActivityModel.fetchSingleActivity(activityId: activityId as! Int)
        let activityTitle = (fetchedSingleActivity as AnyObject).value(forKey: "title")
        
        cell.tag = indexPath.row
        
        if fetchedGoals.count > 0 && activityTitle != nil {
            //Hier zorgen dat lijst met goals zichtbaar wordt
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchedGoals.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

}
