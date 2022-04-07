//
//  SubTableViewController.swift
//  Composite
//
//  Created by Dmitry Belov on 04.04.2022.
//

import UIKit

class SubTableViewController: UITableViewController {

    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = task?.name
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task?.subTask.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath) as? SubTableViewCell else {return UITableViewCell()}
        
        let taskNameLabel = String("\(task?.subTask[indexPath.row].name ?? "")")
        let subTaskCounterLabel = task?.subTask[indexPath.row].subTask.count ?? 0
        
        cell.configurater(taskNameLabel: taskNameLabel, subTaskCounterLabel: subTaskCounterLabel)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task?.subTask.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SubTaskSegue", let cell = (sender as? UITableViewCell) {
            guard let destination = segue.destination as? SubTableViewController else {return}
            if let indexPath = tableView.indexPath(for: cell) {
                
                destination.task = task?.subTask[indexPath.row]
            }
        }
    }
    
    // MARK: - Action
    
    @IBAction func addTask(_ sender: Any) {
        
        let textAlert = UIAlertController(title: "Add task", message: "Enter new task name", preferredStyle: .alert)
        
        textAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { action in
            if let taskName = textAlert.textFields?.first?.text {
                self.task?.add(sub: Task(name: "\(taskName)", task: self.task))
            }
            
            self.tableView.reloadData()
        }))
        
        textAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        textAlert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter new task name" })
  
        present(textAlert, animated: true, completion: nil)
    }
}
