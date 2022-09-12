//
//  ViewController.swift
//  TodoeyApp
//
//  Created by Usha Sai Chintha on 12/09/22.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    // creating an array of items which is empty currently
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Mike1"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Mike2"
        itemArray.append(newItem3)
        
        //        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
        //            itemArray = items
        //        }
    }
    
    //MARK - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        // reusable cells means the cells are reused. let say there is cell 1 to 20 and per screen only 8 cells are displayed. Then when we scroll down and cell 1 goes of the view on screen, it get reused at bottom like at like 9 or 10
        // In such cases, whatever action we do, in this case the checkmark added will be reused and appearing for cell 9 or 10
        // another way of creating cells is having a new cell object (as shown in below line).. but the disadvantage of it is once the cell goes of the screen, it gets destrooyed and a new cell would be formed and the actions like adding checkmark will be disappeared on cell and we cant see checkmark
        // let cell = UITableViewCell(style: .default, reuseIdentifier: "TodoItemCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = item.title
        
        // ternary operatory
        // value = condtion? true : false
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//        if itemArray[indexPath.row].done == false{
//            itemArray[indexPath.row].done = true
//        }else{
//            itemArray[indexPath.row].done = false
//        }
        
        // it forces table view to call data source methods again
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new items
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        // below code adds a text field in alert popup
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        alert.addAction(action)
        
        // below code helps in displaying the alert
        present(alert, animated: true, completion: nil)
    }
}

