//
//  TaskCell.swift
//  To-Do-App
//
//  Created by Timothy Van Ness on 10/11/16.
//  Copyright © 2016 Timothy Van Ness. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    let checkMarkView = UIImageView()//image: #imageLiteral(resourceName: "unchecked_checkbox"))
    let taskLabel = UILabel()
    let taskDetail = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        checkMarkView.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints     = false
        taskDetail.translatesAutoresizingMaskIntoConstraints     = false
        
        contentView.addSubview(checkMarkView)
        contentView.addSubview(taskLabel)
        contentView.addSubview(taskDetail)

        checkMarkView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor).isActive = true
        checkMarkView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true

        taskLabel.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 20).isActive = true
        
        taskDetail.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 20).isActive = true

    }
}
