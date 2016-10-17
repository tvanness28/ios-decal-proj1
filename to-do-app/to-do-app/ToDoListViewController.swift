//
//  ToDoListViewController.swift
//  To-Do-App
//
//  Created by Timothy Van Ness on 10/11/16.
//  Copyright © 2016 Timothy Van Ness. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = UITableView()
//    let screen = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "To-do List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Stats", style: UIBarButtonItemStyle.plain, target: self, action: #selector(statsTapped))
        
        self.view.backgroundColor = UIColor.lightGray
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TaskCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.lightGray
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        checkCompletedTimes()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkCompletedTimes()
        tableView.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkCompletedTimes() {
        if tasks.count > 0 {
            for i in 0...(tasks.count-1) {
                if let initTime = tasks[i].timeComplete {
                    if NSDate().timeIntervalSince(initTime as Date) >= 3600 {
                        tasks[i].releaseTask()
                        tasks.remove(at: i)
                    }
                }
            }
        }
    }
    
    func addTapped(_ sender: UIBarButtonItem) {
        let vc = ToDoListAddViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func statsTapped(_ sender: UIBarButtonItem) {
        let vc = ToDoListStatsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.taskLabel.text = tasks[indexPath.row].taskTitle
        if let detail = tasks[indexPath.row].taskDetail {
            cell.taskLabel.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.5).isActive = true
            cell.taskLabel.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            cell.taskDetail.text = detail
            cell.taskDetail.topAnchor.constraint(equalTo: cell.taskLabel.bottomAnchor).isActive = true
            cell.taskDetail.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.5).isActive = true
        } else {
            cell.taskLabel.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
        }
        cell.checkMarkView.image = tasks[indexPath.row].taskImage

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasks[indexPath.row].markComplete()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            tasks[indexPath.row].releaseTask()
            tasks.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        delete.backgroundColor = UIColor.red
        return [delete]
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // Implemented to allow swipe actions
    }

}

