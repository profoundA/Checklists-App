//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Andrey Lobanov on 01.10.2021.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items = [ChecklistItem]()
   
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1) as! UILabel
        label.text = item.text 
    }
    
    func numberReturn(_ num: Int) -> Int { num * 2 }
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "I'm a new row"
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.text = "IOS App"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Greet someone"
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Make coffee"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Read a book"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Take caffeine"
        items.append(item5)
        
        let item6 = ChecklistItem()
        item6.text = "bla bla bla"
        items.append(item6)
    }
    
    
    //MARK: - TableView Delegate
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {

            let item = items[indexPath.row]

            item.checked.toggle()

            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - TableView Data Source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}

