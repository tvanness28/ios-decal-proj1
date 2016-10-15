//
//  ToDoListStatsViewController.swift
//  To-Do-App
//
//  Created by Timothy Van Ness on 10/15/16.
//  Copyright © 2016 Timothy Van Ness. All rights reserved.
//

import UIKit

class ToDoListStatsViewController: UIViewController {
    
    var statsLabel = UILabel()
    var statsNum = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        statsLabel.text = "Tasks Completed"
        statsLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
        self.view.addSubview(statsLabel)
        statsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statsLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
//        statsLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        statsLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        statsNum.text = String(Task.tasksComplete())
        statsNum.font = UIFont.boldSystemFont(ofSize: 42.0)
        self.view.addSubview(statsNum)
        statsNum.translatesAutoresizingMaskIntoConstraints = false
        
        statsNum.topAnchor.constraint(equalTo: statsLabel.bottomAnchor, constant: 25).isActive = true
//        statsNum.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        statsNum.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
