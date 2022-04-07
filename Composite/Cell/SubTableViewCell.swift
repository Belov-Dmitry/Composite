//
//  SubTableViewCell.swift
//  Composite
//
//  Created by Dmitry Belov on 06.04.2022.
//

import UIKit

class SubTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var subTaskCounterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configurater(taskNameLabel: String, subTaskCounterLabel: Int) {
        self.taskNameLabel.text = taskNameLabel
        self.subTaskCounterLabel.text = String("\(subTaskCounterLabel)")
    }
}
