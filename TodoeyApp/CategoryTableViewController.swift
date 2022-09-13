//
//  CategoryViewControllerTableViewController.swift
//  TodoeyApp
//
//  Created by Usha Sai Chintha on 12/09/22.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryTableViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNames()
        // removing the line seperators on UI
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
            guard let navigationBar = navigationController?.navigationBar else {
                fatalError("No navigation controller")
            }
            navigationBar.backgroundColor = UIColor(hexString: "1D9BF6")
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories"
        let categoryColor = UIColor(hexString: categories?[indexPath.row].color ?? "1D9BF6")
        cell.backgroundColor = categoryColor
        cell.textLabel?.textColor = ContrastColorOf(categoryColor!, returnFlat: true)
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationViewController.selectedCategory = categories?[indexPath.row]
        }
        tableView.reloadData()
    }
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            newCategory.color = UIColor.randomFlat().hexValue()
            
            self.save(category: newCategory)
            self.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Data Manipulation Methods
    func save(category: Category){
        
        do{
            try realm.write{
                realm.add(category)
            }
        }catch{
            print(error)
        }
    }
    
    func loadNames(){
        categories = realm.objects(Category.self)
        tableView.reloadData() // this relead method does call all methods in TableView Datasources
    }
    
    // when we override function that lines inside the actual function wont be executed, only the overrided function lines would be getting executed
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForeDeletion = self.categories?[indexPath.row]{
            do{
                try self.realm.write{
                    try self.realm.delete(categoryForeDeletion)
                }
            }catch{
                print(error)
            }
            tableView.reloadData()
        }
    }
}
