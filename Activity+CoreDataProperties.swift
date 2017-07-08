//
//  Activity+CoreDataProperties.swift
//  winner
//
//  Created by Dide van Berkel on 17/04/2017.
//  Copyright © 2017 Dide van Berkel. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity");
    }

    @NSManaged public var activity_id: Int16
    @NSManaged public var desc: String?
    @NSManaged public var title: String?

}
