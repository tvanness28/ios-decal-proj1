//
//  TaskCell.swift
//  To-Do-App
//
//  Created by Timothy Van Ness on 10/11/16.
//  Copyright © 2016 Timothy Van Ness. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    let checkMarkView = UIImageView(image: UIImage(named: "empty-check"))
    let taskLabel = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        checkMarkView.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints     = false

//        checkMarkView.backgroundColor = UIColor.darkGray
//        checkMarkView.image = UIImage(named: "empty-check")
        
        contentView.addSubview(checkMarkView)
        contentView.addSubview(taskLabel)

        checkMarkView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        checkMarkView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 2).isActive = true
        checkMarkView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true

        taskLabel.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 8).isActive = true
        taskLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 2).isActive = true
        taskLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75).isActive = true
        
    }
}
