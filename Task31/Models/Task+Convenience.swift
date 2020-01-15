//
//  Task+Convenience.swift
//  Task31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, notes: String, due: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
    }
}
