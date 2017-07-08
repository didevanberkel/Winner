//
//  ActivityModel.swift
//  winner
//
//  Created by Dide van Berkel on 26/03/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ActivityModel: NSObject {
    
    
    class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    class func storeActivity(activityId: Int16, title: String, desc: String) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Activity", in: context)
        let object = Activity(entity: entity!, insertInto: context)
        
        object.activity_id = activityId
        object.title = title
        object.desc = desc
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error)")
        } catch {
            
        }
    }
    
    
    class func updateActivity(activityId: Int16, title: String, desc: String) {
        let request = NSFetchRequest<Activity>(entityName: "Activity")
        request.predicate = NSPredicate.init(format: "activity_id == \(activityId)")
        let context = getContext()
        do {
            let searchResults = try context.fetch(request)
            if searchResults.count > 0 {
                for search in searchResults {
                    search.activity_id = activityId
                    search.title = title
                    search.desc = desc
                    
                    do {
                        try context.save()
                    } catch let error as NSError  {
                        print("Could not save \(error)")
                    } catch {
                        
                    }
                }
            }
        } catch {
            
        }
    }
    
    
    class func fetchActivities() -> [Activity] {
        let fetchRequest = NSFetchRequest<Activity>(entityName: "Activity")
        
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
    
    
    class func fetchSingleActivity(activityId: Int) -> Activity {
        let fetchRequest = NSFetchRequest<Activity>(entityName: "Activity")
        fetchRequest.predicate = NSPredicate.init(format: "activity_id == \(activityId)")
        
        var results : Activity!
        
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            if searchResults.count > 0 {
                results = searchResults[0]
            }
        } catch {
            
        }
        
        return results
    }
    
    
    class func deleteActivity(activityId: Int) {
        let request = NSFetchRequest<Activity>(entityName: "Activity")
        request.predicate = NSPredicate.init(format: "activity_id == \(activityId)")
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
