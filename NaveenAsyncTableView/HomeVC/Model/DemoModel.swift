//
//  NaveenModel.swift
//  NaveenAsyncTableView
//
//  Created by Naveen Chandra on 09/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit

struct  DemoModel:Codable {
    

        let assets: [Asset]
        let assetType: String?
        let displayName: String?
        let id: Int?
        let lastModified: Int?
        let sponsored: Bool?
        let url: String?
}
