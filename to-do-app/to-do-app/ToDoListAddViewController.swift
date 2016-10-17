//
//  ToDoListAddViewController.swift
//  To-Do-App
//
//  Created by Timothy Van Ness on 10/11/16.
//  Copyright © 2016 Timothy Van Ness. All rights reserved.
//

import UIKit

class ToDoListAddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView: UITableView = UITableView()
    var taskLabelView: UITextField = UITextField()
    var taskDetailView: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        navigationItem.title = "New Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(doneTapped))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        taskLabelView.placeholder = "New Task"
        taskLabelView.borderStyle = UITextBorderStyle.none
        taskLabelView.translatesAutoresizingMaskIntoConstraints = false

        taskDetailView.placeholder = "Task Details"
        taskDetailView.borderStyle = UITextBorderStyle.none
        taskDetailView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    func doneTapped(_ selector: UIBarButtonItem) {
        if let label = taskLabelView.text {
            if label != "" {
                var detail = taskDetailView.text
                if detail == "" {
                    detail = nil
                }
                tasks.append(Task(label, detail))
                let vc = ToDoListViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        switch indexPath.row {
        case 0:
            cell.addSubview(taskLabelView)
            taskLabelView.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
            taskLabelView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 25).isActive = true
            taskLabelView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        default:
            cell.addSubview(taskDetailView)
            taskDetailView.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
            taskDetailView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 25).isActive = true
            taskDetailView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        }
    
        
        return cell
    }
}
