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
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
