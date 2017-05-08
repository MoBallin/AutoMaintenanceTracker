//
//  Car.swift
//  AutoMaintenanceTracker
//
//  Created by Aaron Whaley on 4/11/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import Foundation
import CoreData

@objc(Car)
class Car: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var model: String
    @NSManaged var year: String
    @NSManaged var make: String
    @NSManaged var image: String?
    @NSManaged var oilDate: Date?
}
