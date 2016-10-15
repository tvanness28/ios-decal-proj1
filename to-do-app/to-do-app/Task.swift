//
//  Task.swift
//  To-Do-App
//
//  Created by Timothy Van Ness on 10/13/16.
//  Copyright © 2016 Timothy Van Ness. All rights reserved.
//

import Foundation

class Task {
    var taskTitle: String
    var taskDetail: String
    var taskComplete: Bool
    var timeComplete: Int
    
    init(_ title: String, _ detail: String) {
        self.taskTitle = title
        self.taskDetail = detail
        self.taskComplete = false
        self.timeComplete = 0
    }
}

var tasks = [Task]()


