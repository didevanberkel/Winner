//
//  GoalModel.swift
//  winner
//
//  Created by Dide van Berkel on 26/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GoalModel: NSObject {
    
    class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func storeGoal(goalId: Int16, activityId: Int16, target: Int16, period: String, progress: Int16) {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Goal", in: context)
        let object = Goal(entity: entity!, insertInto: context)
        
        object.goal_id = goalId
        object.activity_id = activityId
        object.target = target
        object.period = period
        object.progress = progress
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error)")
        } catch {
            
        }
        
    }
    
    class func updateGoal(goalId: Int16, activityId: Int16, target: Int16, period: String, progress: Int16) {
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        request.predicate = NSPredicate.init(format: "goal_id == \(goalId)")
        let context = getContext()
        do {
            let searchResults = try context.fetch(request)
            if searchResults.count > 0 {
                for search in searchResults {
                    search.goal_id = goalId
                    search.activity_id = activityId
                    search.target = target
                    search.period = period
                    search.progress = progress
                }
                
            }
            
            do {
                try context.save()
            } catch let error as NSError  {
                print("Could not save \(error)")
            } catch {
                
            }
            
        } catch {
            
        }
    }
    
    class func fetchGoal() -> [Goal] {
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            
            if searchResults.count > 0 {
                return searchResults
            } else {
                return []
            }
        } catch {
            return []
        }
    }
    
    class func deleteGoal(goalId: Int) {
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        request.predicate = NSPredicate.init(format: "goal_id == \(goalId)")
        let context = getContext()
        do {
            let searchResults = try context.fetch(request)
            for result in searchResults {
                context.delete(result)
            }
        } catch {
            
        }
        
    }
    
}
