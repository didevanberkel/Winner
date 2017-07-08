//
//  AddGoalViewController.swift
//  winner
//
//  Created by Dide van Berkel on 25/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cancelBtn: UIBarButtonItem!

    @IBOutlet weak var tableview: UITableView!
    
    let addGoalArr : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toolbar.tintColor = UIColor.white
        
        tableview.register(UINib(nibName: "SelectCell", bundle: nil), forCellReuseIdentifier: "SelectCell")
        tableview.register(UINib(nibName: "AmountCell", bundle: nil), forCellReuseIdentifier: "AmountCell")
        tableview.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        
        addGoalArr.add(["type" : "title", "text" : "goal_set_title".localized, "size" : 12, "rowHeight" : 60, "editable" : false, "center" : true])
        addGoalArr.add(["type" : "title", "text" : "goal_activity".localized, "size" : 16, "rowHeight" : 40, "editable" : false, "center" : true])
        addGoalArr.add(["type" : "select", "text" : "Set activity", "size" : 14, "rowHeight" : 40, "editable" : true, "center" : true])
        addGoalArr.add(["type" : "amount", "text" : "1", "size" : 0, "rowHeight" : 40, "editable" : true, "center" : true])
        addGoalArr.add(["type" : "title", "text" : "goal_times".localized, "size" : 14, "rowHeight" : 40, "editable" : false, "center" : true])
        addGoalArr.add(["type" : "title", "text" : "goal_per".localized, "size" : 14, "rowHeight" : 40, "editable" : false, "center" : true])
        addGoalArr.add(["type" : "select", "text" : "day".localized, "size" : 14, "rowHeight" : 40, "editable" : true, "center" : true])
        addGoalArr.add(["type" : "select", "text" : "week".localized, "size" : 14, "rowHeight" : 40, "editable" : true, "center" : true])
        addGoalArr.add(["type" : "select", "text" : "month".localized, "size" : 14, "rowHeight" : 40, "editable" : true, "center" : true])
        
        tableview.backgroundColor = BaseColors.darkBlue()
        self.view.backgroundColor = BaseColors.darkBlue()
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dictForRow = (self.addGoalArr.object(at: indexPath.row))
        
        let text = (dictForRow as AnyObject).value(forKey: "text") as? String
        let size = (dictForRow as AnyObject).value(forKey: "size") as? Int
        let editable = (dictForRow as AnyObject).value(forKey: "editable") as? Bool
        let center = (dictForRow as AnyObject).value(forKey: "center") as? Bool
        
        if (((dictForRow as AnyObject).value(forKey: "type") as AnyObject).isEqual("title")) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.setupTitleCell(bebasFont: true, size: size!, text: text!, editable: editable!, center: center!)
            cell.backgroundColor = BaseColors.darkBlue()
            return cell
        } else if (((dictForRow as AnyObject).value(forKey: "type") as AnyObject).isEqual("select")) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCell", for: indexPath) as! SelectCell
            cell.setupSelectCell(bebasFont: true, size: size!, text: text!, editable: editable!, center: center!)
            cell.backgroundColor = BaseColors.darkBlue()
            return cell
        } else if (((dictForRow as AnyObject).value(forKey: "type") as AnyObject).isEqual("amount")) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AmountCell", for: indexPath) as! AmountCell
            cell.setupAmountCell(bebasFont: true, size: size!, text: text!, editable: editable!, center: center!)
            cell.backgroundColor = BaseColors.darkBlue()
            return cell
        }
    
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dictForRow = (self.addGoalArr.object(at: indexPath.row))
        if let rowHeight = ((dictForRow as AnyObject).value(forKey: "rowHeight") as? CGFloat) {
            return rowHeight
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictForRow = (self.addGoalArr.object(at: indexPath.row))
        if ((dictForRow as AnyObject).value(forKey: "editable") as! Bool) == true {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .checkmark
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let dictForRow = (self.addGoalArr.object(at: indexPath.row))
        if ((dictForRow as AnyObject).value(forKey: "editable") as! Bool) == true {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .none
                
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
}
