//
//  AssetModel.swift
//  NaveenAsyncTableView
//
//  Created by Naveen Chandra on 12/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit

struct Asset: Codable {
    let acceptComments: Bool
    let assetType: String?
    let authors: [Author]?
    let byLine: String
    let categories: [Category]?
    let companies: [Company]?
    let headline: String
    let id: Int
    let indexHeadline: String?
    let lastModified: Int?
    let legalStatus: String?
    let numberOfComments: Int?
    let onTime: Int?
    let overrides: Override?
    let relatedAssets: [RelatedAsset]?
    let relatedImages: [RelatedImage]
    let signPost: String?
    let sources: [Source]?
    let sponsored: Bool
    let tabletHeadline: String?
    let theAbstract: String
    let timeStamp: Date
    let url: String?
}
