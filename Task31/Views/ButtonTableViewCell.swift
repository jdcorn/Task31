//
//  ButtonTableViewCell.swift
//  Task31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    // Properties
    var delegate: ButtonTableViewCellDelegate?

    // MARK: - Outlets
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    // MARK: - Actions
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.ButtonCellButtonTapped(self)
    }
    
    // MARK: - Functions
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else {
            completeButton.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        }
    }
}

extension ButtonTableViewCell {
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func ButtonCellButtonTapped(_ sender: ButtonTableViewCell)
}
