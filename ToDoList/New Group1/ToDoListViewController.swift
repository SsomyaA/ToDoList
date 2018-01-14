//  ViewController.swift
//  ToDoList
//
//  Created by Somya Biswal on 06/01/18.
//  Copyright © 2018 Somya Biswal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
    var iteamArray = [Iteam]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Iteams.plist")
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        
        let newIteam = Iteam()
        newIteam.title = "Somya"
        iteamArray.append(newIteam)
        
        let newIteam2 = Iteam()
        newIteam2.title = "Biswal"
        iteamArray.append(newIteam2)
        
        let newIteam3 = Iteam()
        newIteam3.title = "Ranjan"
        iteamArray.append(newIteam3)
        
        
//        if let items = defaults.array(forKey: "ToDoListArray") as? [Iteam] {
//            iteamArray = items
//        }
        
    }


    //Mark - Table View DataSource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iteamArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoIteamCell", for: indexPath)
        
        
        let iteam = iteamArray[indexPath.row]
        
        cell.textLabel?.text = iteam.title
   
//      Tenary Operator (Format- value = condition ? valueIfTure : valueIfFalse)
        
        cell.accessoryType = iteam.done ? .checkmark : .none
        
//        if iteam.done == true {
//            cell.accessoryType = .checkmark
//        }
//        else {
//            cell.accessoryType = .none
//        }
        
        
        return cell
    }
    
    //Mark - Table View Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(iteamArray[indexPath.row])

//        Small if version
        iteamArray[indexPath.row].done = !iteamArray[indexPath.row].done
        
//                lengthy if version
//        if iteamArray[indexPath.row].done == false {
//            iteamArray[indexPath.row].done = true
//        }
//        else {
//            iteamArray[indexPath.row].done = false
//        }
        
        
        
        saveIteam()
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//
//        else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new iteam
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Iteam", message: "", preferredStyle: .alert)
        
        let acttion = UIAlertAction(title: "Add Iteam", style: .default) { (action) in
            //What will happen when user click the add button
            
            let newIteam = Iteam()
            newIteam.title = textField.text!
            self.iteamArray.append(newIteam)
            
            self.saveIteam()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a Iteam"
            textField = alertTextField
            
        }
        
        alert.addAction(acttion)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK - Save data method
    
    func saveIteam() {
     
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(iteamArray)
            try data.write(to: dataFilePath!)
        }
        catch {
            print("Error Encoding IteamArray \(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
}
