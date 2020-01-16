//
//  TaskController.swift
//  Task31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: - Properties
    static let shared = TaskController()
    var tasks: [Task] {
        do {
            try fetchedResultsController.performFetch()
            guard let tasks = fetchedResultsController.fetchedObjects else {return []}
            return tasks
        } catch {
            print(error, error.localizedDescription)
            return []
        }
    }
    
    let fetchedResultsController: NSFetchedResultsController<Task> = {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        let isCompleteSortDescriptor = NSSortDescriptor(key: "isComplete", ascending: true)
        let dueSortDescriptor = NSSortDescriptor(key: "due", ascending: true)
        
        fetchRequest.sortDescriptors = [isCompleteSortDescriptor, dueSortDescriptor]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    
    // MARK: - CRUD Functions
    func add(taskWithName name: String, notes: String?, due: Date?) {
        _ = Task(name: name)
        saveToPersistence()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistence()
    }
    
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistence()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistence()
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
