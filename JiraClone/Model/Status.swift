//
//  Status.swift
//  JiraClone
//
//  Created by user1 on 15/04/23.
//

import Foundation

class Status: Codable {
    
    var title: String
    var items: [String]
    
    init(title: String, items: [String]) {
        self.title = title
        self.items = items
    }
}
