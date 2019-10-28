//
//  ViewController.swift
//  TodoList
//
//  Created by Weng Liang Chong on 28/10/2019.
//  Copyright © 2019 Weng Liang Chong. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newItem = Item()
        newItem.title = "Todo1"
        itemArray.append(newItem)
        let newItem2 = Item()
        newItem2.title = "Todo2"
        itemArray.append(newItem2)
        let newItem3 = Item()
        newItem3.title = "Todo3"
        itemArray.append(newItem3)
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    
    //MARK: - TableView Datasource Methods
    
    //Return the number of rows needed
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //Create the specific row with names at indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    
    //MARK: - TableView Delegate Methods
    
    //Animation such as select/deselect and checkmark
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - Add new Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (Action) in
            //What will happens if user press add item button
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

