//
//  DashboardViewController.swift
//  winner
//
//  Created by Dide van Berkel on 25/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var dashboardTitleLbl: UILabel!
    
    @IBOutlet weak var settingsBtn: WinnerButton!
    @IBOutlet weak var activityBtn: WinnerButton!
    @IBOutlet weak var goalBtn: WinnerButton!
    @IBOutlet weak var goalBtnLbl: UILabel!
    @IBOutlet weak var activityBtnLbl: UILabel!
    @IBOutlet weak var settingsBtnLbl: UILabel!
    
    @IBOutlet weak var noGoalsAddedLbl: UILabel!
    @IBOutlet weak var addGoalBtn: WinnerButton!
    
    @IBOutlet weak var firstGoalLbl: UILabel!
    @IBOutlet weak var firstGoalProgressLbl: UILabel!
    @IBOutlet weak var secondGoalLbl: UILabel!
    @IBOutlet weak var secondGoalProgressLbl: UILabel!
    @IBOutlet weak var thirdGoalLbl: UILabel!
    @IBOutlet weak var thirdGoalProgressLbl: UILabel!
    
    var fetchedGoals = [Goal]()
    var goalId: Int!
    var activityId: Int!
    var period: String!
    var target: Int!
    var progress: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set title of dashboard
        dashboardTitleLbl.text = "dashboard_newest_goals".localized
        
        //Set buttons
        settingsBtn.typeOfButton = .SettingsButton
        activityBtn.typeOfButton = .ActivityButton
        goalBtn.typeOfButton = .GoalButton
        goalBtnLbl.text = "dashboard_your_goals".localized
        settingsBtnLbl.text = "dashboard_settings".localized
        activityBtnLbl.text = "dashboard_activities".localized
        
        //Setup three newest goals
        setupFirstGoal(hide: true)
        setupSecondGoal(hide: true)
        setupThirdGoal(hide: true)
        setupAddGoal(hide: true)
        noGoalsAddedLbl.text = "dashboard_no_goals".localized
        
        fetchedGoals = GoalModel.fetchGoal()
        if fetchedGoals.count > 0 {
            var x = 0
            while x < fetchedGoals.count {
                if x == 0 {
                    setupFirstGoal(hide: false)
                }
                if x == 1 {
                    setupSecondGoal(hide: false)
                }
                if x == 2 {
                    setupThirdGoal(hide: false)
                }
                x = x + 1
            }
        } else {
            setupAddGoal(hide: false)
            addGoalBtn.typeOfButton = .Blue
            addGoalBtn.setTitle("dashboard_add_goals".localized, for: .normal)
        }
        
    }
    
    func setupFirstGoal(hide: Bool) {
        firstGoalLbl.isHidden = hide
        firstGoalProgressLbl.isHidden = hide
    }
    
    func setupSecondGoal(hide: Bool) {
        secondGoalLbl.isHidden = hide
        secondGoalProgressLbl.isHidden = hide
    }
    
    func setupThirdGoal(hide: Bool) {
        thirdGoalLbl.isHidden = hide
        thirdGoalProgressLbl.isHidden = hide
    }
    
    func setupAddGoal(hide: Bool) {
        noGoalsAddedLbl.isHidden = hide
        addGoalBtn.isHidden = hide
    }
    
    
    @IBAction func addBtnPressed(_ sender: Any) {
        let vc = UIStoryboard.goalStoryboard().instantiateViewController(withIdentifier: "AddGoalViewController") as! AddGoalViewController
        self.present(vc, animated: true, completion: nil)
    }
    
}

