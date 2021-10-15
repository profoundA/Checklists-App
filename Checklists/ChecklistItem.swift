//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Andrey Lobanov on 06.10.2021.
//

import Foundation


//MARK: - Data model

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
}
