//
//  TaskDetailTableViewController.swift
//  Task31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    var tasks: Task? {
        didSet {
            updateViews()
        }
    }
    var dueDateValue: Date?

    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.inputView = dueDatePicker
        
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, let notes = notesTextView.text, let due = dueDateValue
            else { return }
        
        if let task = tasks {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        
        } else {
            
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        dateTextField.text = dueDatePicker.date.stringValue()
        self.dueDateValue = dueDatePicker.date
    }
    
    @IBAction func tapGestureTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
        dateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    // MARK: - Functions
    func updateViews() {
        loadViewIfNeeded()
        guard let task = tasks else {return}
            nameTextField.text = task.name
            notesTextView.text = task.notes
//        }
//        if let due = tasks?.due {
            dateTextField.text = task.due?.stringValue()
            print("test")
        
    }
}
