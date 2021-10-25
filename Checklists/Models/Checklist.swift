//
//  Checklist.swift
//  Checklists
//
//  Created by Andrey Lobanov on 19.10.2021.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
