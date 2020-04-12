//
//  NaveenTableViewCell.swift
//  NaveenAsyncTableView
//
//  Created by Naveen Chandra on 09/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit

class NaveenTableViewCell: UITableViewCell {
    
    
    
    let nameLabel = UILabel()
    let detailLabel = UILabel()
    let contentImageView = UIImageView()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        
        
        // configure imageView
        self.contentView.addSubview(contentImageView)
        
  
        // configure titleLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.leadingAnchor.constraint(equalTo: .trailingAnchor).isActive = true
//        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        
        // configure authorLabel
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
//        detailLabel.leadingAnchor.constraint(equalTo: .trailingAnchor).isActive = true
//        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
//        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
//        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: "Avenir-Book", size: 12)
        detailLabel.textColor = UIColor.lightGray
        
      contentImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
               contentImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
               contentImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
               contentImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
               
              
               
               nameLabel.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
               nameLabel.leadingAnchor.constraint(equalTo:self.leadingAnchor).isActive = true
               nameLabel.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
               
               detailLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
               detailLabel.leadingAnchor.constraint(equalTo:self.leadingAnchor).isActive = true
               detailLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
               detailLabel.leadingAnchor.constraint(equalTo:self.leadingAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
