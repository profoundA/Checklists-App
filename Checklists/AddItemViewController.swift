//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Andrey Lobanov on 08.10.2021.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func addItemViewControlledDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController {
    

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
    
    //MARK: - Delegate reference
    
    weak var delegate: AddItemViewControllerDelegate?
    
    //MARK: - Actions
    
    @IBAction func cancel() {
        delegate?.addItemViewControlledDidCancel(self)
    }
   
    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text ?? ""
        
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

//MARK: - TextField Delegate extension

extension AddItemViewController: UITextFieldDelegate {
    
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

