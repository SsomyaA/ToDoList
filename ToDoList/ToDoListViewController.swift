//  ViewController.swift
//  ToDoList
//
//  Created by Somya Biswal on 06/01/18.
//  Copyright © 2018 Somya Biswal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
    let iteamArray = ["Somya", "Ranjan", "Biswal"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
}
