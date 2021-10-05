//
//  PublicSearchModel.swift
//  NYTTImesByTeja
//
//  Created by TejaDanasvi on 4/10/21.
//

import Foundation
struct PublicSearchModel: Decodable {
    let count: Int?
    let entries:[PublicEntries]?
}
struct PublicEntries: Decodable {
    let API:String?
    let Description:String?
    let Category: String?
}
