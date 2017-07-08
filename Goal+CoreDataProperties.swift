//
//  Goal+CoreDataProperties.swift
//  winner
//
//  Created by Dide van Berkel on 17/04/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal");
    }

    @NSManaged public var activity_id: Int16
    @NSManaged public var goal_id: Int16
    @NSManaged public var period: String?
    @NSManaged public var progress: Int16
    @NSManaged public var target: Int16

}
