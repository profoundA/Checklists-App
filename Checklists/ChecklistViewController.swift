//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Andrey Lobanov on 01.10.2021.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //MARK: TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            switch cell.accessoryType {
            case .none:
                cell.accessoryType = .checkmark
            default:
                cell.accessoryType = .none
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    //MARK: TableView Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1) as! UILabel
        
        if indexPath.row % 5 == 0 {
          label.text = "Walk the dog"
        } else if indexPath.row % 5 == 1 {
          label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
          label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 {
          label.text = "Soccer practice"
        } else if indexPath.row % 5 == 4 {
          label.text = "Eat ice cream"
        }
        
        return cell
    }

}

