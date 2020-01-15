//
//  TaskController.swift
//  Task31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation

class TaskController {
    
    // MARK: - Properties
    static let shared = TaskController()
    var tasks: [Task] = []
    
    
    // MARK: - CRUD Functions
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func saveToPersistence() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("error saving \(error.localizedDescription)")
        }
    }
}
