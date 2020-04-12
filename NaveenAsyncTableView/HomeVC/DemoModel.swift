//
//  NaveenModel.swift
//  NaveenAsyncTableView
//
//  Created by Naveen Chandra on 09/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit

struct  DemoModel:Decodable {
    
    var title: String?
    var imgURL: String?
    var desc: String?
    
    
    init(title: String?,imgURL: String?, desc: String?) {
        self.title = title
        self.imgURL = imgURL
        self.desc = desc
    }
}
