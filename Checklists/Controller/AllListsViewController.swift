//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Andrey Lobanov on 19.10.2021.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    var lists = [Checklist]()
    
    let cellIdentifier = "ChecklistCell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var list = Checklist(name: "Birthdays")
          lists.append(list)
          list = Checklist(name: "Groceries")
          lists.append(list)
          list = Checklist(name: "Cool Apps")
          lists.append(list)
          list = Checklist(name: "To Do")
          lists.append(list)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as? Checklist
        }
    }

    // MARK: - TableView Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let checklist = lists[indexPath.row]
        
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
   
}
