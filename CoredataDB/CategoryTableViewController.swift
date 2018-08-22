//
//  CategoryTableViewController.swift
//  CoredataDB
//
//  Created by Raja Jawahar on 21/08/18.
//  Copyright © 2018 sedintechnologies. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var categoryList = [Category]()
    
    var itemArray = ["First","Second","Third"]
    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    func loadCategories(){
        
        let categoryRequest : NSFetchRequest<Category> = Category.fetchRequest()
        do{
            categoryList = try! context.fetch(categoryRequest)
        } catch {
            print("Error loading Categories \(error.localizedDescription)")
        }
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func createCategory(_ sender: UIBarButtonItem) {
        var inputField = UITextField()
        let alertView = UIAlertController(title: "Sdd Category", message: "Do you want to add a Category ?", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "ADD", style: .default) { (action) in
            let givenCategory = inputField.text
            let category = Category(context: self.context)
            category.name = givenCategory
            self.categoryList.append(category)
            self.tableView.reloadData()
        }
        alertView.addTextField { (textField) in
            textField.placeholder = "Add New Category"
            inputField = textField
        }
        alertView.addAction(addAction)
        present(alertView, animated: true, completion:nil)
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todocategorycell", for: indexPath)
        let category = categoryList[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    
    
    
}
