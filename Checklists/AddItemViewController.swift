//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Andrey Lobanov on 08.10.2021.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    //MARK: - Actions
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func done() {
        
        print("context of tf is \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //MARK: - TextField Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
