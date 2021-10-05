//
//  NytSearchModel.swift
//  NYTTImesByTeja
//
//  Created by TejaDanasvi on 3/10/21.
//

import Foundation

struct NytSearchModel: Decodable {
    let status: String?
    let copyright: String?
    let response: NYTResponse?
}

struct NYTResponse: Decodable {
    let docs: [NYTNewFeed]?
}
struct NYTNewFeed: Decodable {
    let abstract: String?
    let source: String?
    let word_count: Int?
    let headline: NYTNewsHeadLine?
    let keywords: [NYTNewsKeywords]?
    let byline: NYTBYline?
    
    var fullName: String {
        if let person = byline?.person,
           person.count > 0 {
            return "Written By:- \((person[0].firstname ?? "")) \((person[0].lastname ?? "" ))"
        } else {
            return ""
        }
    }
}

struct NYTNewsHeadLine: Decodable {
    let main: String?
}

struct NYTNewsKeywords: Decodable {
    let name: String?
    let value: String?
}

struct NYTBYline: Decodable {
    let original: String?
    let person: [NYTPerson]?
}

struct NYTPerson: Decodable {
    let firstname: String?
    let lastname: String?
}

