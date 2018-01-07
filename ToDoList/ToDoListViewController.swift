//  ViewController.swift
//  ToDoList
//
//  Created by Somya Biswal on 06/01/18.
//  Copyright © 2018 Somya Biswal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
    var iteamArray = ["Somya", "Ranjan", "Biswal"]
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            iteamArray = items
        }
        
    }


    //Mark - Table View DataSource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iteamArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoIteamCell", for: indexPath)
        cell.textLabel?.text = iteamArray[indexPath.row]
        return cell
    }
    
    //Mark - Table View Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(iteamArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new iteam
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Iteam", message: "", preferredStyle: .alert)
        
        let acttion = UIAlertAction(title: "Add Iteam", style: .default) { (action) in
            //What will happen when user click the add button
            
            print(textField.text)
            
            self.iteamArray.append(textField.text!)
            
            self.defaults.set(self.iteamArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a Iteam"
            textField = alertTextField
            
        }
        
        alert.addAction(acttion)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
