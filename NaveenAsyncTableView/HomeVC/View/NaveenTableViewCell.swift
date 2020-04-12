//
//  NaveenTableViewCell.swift
//  NaveenAsyncTableView
//
//  Created by Naveen Chandra on 09/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    

  
    // MARK: - Private Variables
    
     let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.brown
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textAlignment = .left
        return lbl
    }()
    
   
    
     let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.brown
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
  
       
    
     let contentImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "tempImage"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.layer.borderWidth = 1.0
        imgView.layer.borderColor = UIColor.black.cgColor
        return imgView
    }()
    
    // MARK: - initilization
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(contentImage)

        /// Setting up constraints for the rowImage
               setupRowImage()
        
        /// Setting up constraints for the rowImage
        setupRowImage()
        
        
        /// Setting up constraints for the titleLabel
        setupTitleLabel()
        
        /// Setting up constraints for the descriptionLabel
        setupDescriptionLabel()
        
    }
    
    // MARK: - Private Functions
    
    private func setupRowImage() {
        contentImage.addAnchor(top: nil,
                        left: leftAnchor,
                        bottom: nil,
                        right: titleLabel.leftAnchor,
                        paddingTop: 5,
                        paddingLeft: 5,
                        paddingBottom: 5,
                        paddingRight: 10,
                        width: 90,
                        height: 90,
                        enableInsets: false)
        let imageCenterY = NSLayoutConstraint(item: self,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: contentImage,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0.0)
        imageCenterY.isActive  = true
    }
    
    private func setupTitleLabel() {
        titleLabel.addAnchor(top: topAnchor,
                             left: contentImage.rightAnchor,
                             bottom: descriptionLabel.topAnchor,
                             right: rightAnchor,
                             paddingTop: 10,
                             paddingLeft: 10,
                             paddingBottom: 0,
                             paddingRight: 20,
                             width: 0,
                             height: 0,
                             enableInsets: false)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.addAnchor(top: titleLabel.bottomAnchor,
                                   left: contentImage.rightAnchor,
                                   bottom: bottomAnchor,
                                   right: rightAnchor,
                                   paddingTop: 0,
                                   paddingLeft: 10,
                                   paddingBottom: 10,
                                   paddingRight: 20,
                                   width: 0,
                                   height: 0,
                                   enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
