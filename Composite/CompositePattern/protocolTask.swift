//
//  Task.swift
//  Composite
//
//  Created by Dmitry Belov on 05.04.2022.
//

import Foundation

protocol TaskProtocol {
    
    var task: TaskProtocol? { get }
    var subTask: [Task] { get set }
    var name: String { get }
    
    func add(sub: Task)
}
