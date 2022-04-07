//
//  classTask.swift
//  Composite
//
//  Created by Dmitry Belov on 05.04.2022.
//

import Foundation

class Task: TaskProtocol {
    
    var task: TaskProtocol?
    var subTask: [Task] = []
    var name: String
    
    init(name: String, task: TaskProtocol?) {
        self.name = name
        self.task = task
    }
    
    func add(sub: Task) {
        subTask.append(sub)
    }
}
