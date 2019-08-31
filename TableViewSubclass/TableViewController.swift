//
//  TableViewController.swift
//  TableViewSubclass
//
//  Created by Gabriel on 31/08/19.
//  Copyright © 2019 gabrielrodrigues. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let itemArray = ["Learn Realm", "Learn Core Data", "Learn MySQL"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPressed(_ sender: Any) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.accessoryType = cell?.accessoryType == .checkmark ? .none : .checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
