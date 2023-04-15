//
//  PlansDM.swift
//  JiraClone
//
//  Created by user1 on 14/04/23.
//

import Foundation

class Plan {
    var name: String
    var status: [Status]
    
    init(name: String, status: [Status]) {
        self.name = name
        self.status = status
    }
}

//struct Plan {
//    var name: String = ""
//    var todo: [String] = []
//    var progres: [String] = []
//    var qa: [String] = []
//    var done: [String] = []
//
//    init(name: String, todo: [String], progres: [String], qa: [String], done: [String]) {
//        self.name = name
//        self.todo = todo
//        self.progres = progres
//        self.qa = qa
//        self.done = done
//    }
//
//    init(dictionaryData: [String : AnyObject]) {
//        self.name = (dictionaryData["name"] as? String) ?? ""
//        self.todo = (dictionaryData["todo"] as? [String]) ?? []
//        self.progres = (dictionaryData["progres"] as? [String]) ?? []
//        self.qa = (dictionaryData["qa"] as? [String]) ?? []
//        self.done = (dictionaryData["done"] as? [String]) ?? []
//    }
//
//}
