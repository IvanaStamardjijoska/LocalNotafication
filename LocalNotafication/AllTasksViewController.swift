//
//  AllTasksViewController.swift
//  LocalNotafication
//
//  Created by CodeWell on 1/16/19.
//  Copyright © 2019 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class AllTasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTaskProtocol {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var createTaskViewController:ViewController?
    var allTask: [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as? TaskTableViewCell{
            let taskTitle = allTask[indexPath.row].title ?? "random title"
            cell.setUpCellWithTitle(title: taskTitle)
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewController{
            controller.delegate = self
        }
    }

    func addtask(task: Task) {
        print(task.title)
        allTask.append(task)
        tableView.reloadData()
        
    }

}
