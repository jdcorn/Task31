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
    var tasks: Task?
    var dueDateValue: Date?

    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dateTextField.inputView = dueDatePicker
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let task = tasks {
            let due = tasks?.due
            guard let name = nameTextField.text else {return}
            TaskController.shared.update(task: task, name: name, notes: notesTextView.text, due: due)
        } else {
            let due = dueDatePicker.date
            guard let name = nameTextField.text,
            let notes = notesTextView.text else {return}
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        dateTextField.text = dueDatePicker.date.stringValue()
    }
    
    @IBAction func tapGestureTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
        dateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let task = tasks,
            let due = tasks?.due,
            isViewLoaded
            else {return}
        nameTextField.text = task.name
        notesTextView.text = task.notes
        dateTextField.text = due.stringValue()
    }
}
