//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Andrey Lobanov on 08.10.2021.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - Actions
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
    
}
