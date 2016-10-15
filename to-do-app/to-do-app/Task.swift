//
//  Task.swift
//  To-Do-App
//
//  Created by Timothy Van Ness on 10/13/16.
//  Copyright © 2016 Timothy Van Ness. All rights reserved.
//

import UIKit

class Task {
    static var complete: Int = 0
    var taskTitle: String
    var taskDetail: String
    var taskComplete: Bool
    var timeComplete: NSDate?
    var taskImage: UIImage = #imageLiteral(resourceName: "unchecked_checkbox")
    
    init(_ title: String, _ detail: String) {
        self.taskTitle = title
        self.taskDetail = detail
        self.taskComplete = false
        self.timeComplete = nil
    }
    
    func markComplete() {
        switch self.taskImage {
        case #imageLiteral(resourceName: "checked_checkbox"):
            self.taskImage = #imageLiteral(resourceName: "unchecked_checkbox")
            self.taskComplete = false
            self.timeComplete = nil
            Task.complete -= 1
        default:
            self.taskImage = #imageLiteral(resourceName: "checked_checkbox")
            self.taskComplete = true
            self.timeComplete = NSDate()
            Task.complete += 1
        }
    }
    
    func releaseTask() {
        if self.taskComplete {
            Task.complete -= 1
        }
    }
    
    class func tasksComplete() -> Int {
        return complete
    }
}

var tasks = [Task]()


