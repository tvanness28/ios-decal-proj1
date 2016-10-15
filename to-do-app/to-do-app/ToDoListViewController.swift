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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.register(TaskCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.lightGray
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTapped(_ sender: UIBarButtonItem) {
        let vc = ToDoListAddViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func statsTapped(_ sender: UIBarButtonItem) {
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView(frame: CGRect(x: screen.width/2 - 100, y: screen.height/2 - 100, width: screen.width, height: 50))
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
//        let cell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = tasks[indexPath.row].taskTitle
        cell.imageView?.image = #imageLiteral(resourceName: "empty-check")
        cell.detailTextLabel?.text = tasks[indexPath.row].taskDetail
//        cell.taskLabel.text = tasks[indexPath.row].taskTitle
//        cell.checkMarkView.image = UIImage(named: "empty-check")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tasks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("Delete")
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

