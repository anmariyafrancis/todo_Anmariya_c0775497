//
//  MoveTodoViewController.swift
//  todo_Anmariya_c0775497
//
//  Created by user176498 on 6/29/20.
//  Copyright © 2020 user176498. All rights reserved.
//

import UIKit
import CoreData

class MoveTodoViewController: UIViewController {

        var categories = [Category]()
        var selectedTodo: [Todo]? {
            didSet {
                loadCategories()
            }
        }
        @IBOutlet weak var tableView: UITableView!
        
        let moveTodoContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
        }

        @IBAction func cancelButtonTapped(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
    }



    //MARK: core data methods implemented
    extension MoveTodoViewController {
        
        func loadCategories() {
            let request: NSFetchRequest<Category> = Category.fetchRequest()
            let categoryPredicate = NSPredicate(format: "NOT name MATCHES %@", selectedTodo?[0].parentFolder?.name ?? "")
            request.predicate = categoryPredicate
            
            do {
                categories = try moveTodoContext.fetch(request)
            } catch {
                print("Error fetching data \(error.localizedDescription)")
            }
        }

    }




    //MARK: table view methods implemented
    extension MoveTodoViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categories.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "")
            cell.textLabel?.text = categories[indexPath.row].name
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
                for todo in self.selectedTodo! {
                    todo.parentFolder = self.categories[indexPath.row]
                }
                self.performSegue(withIdentifier: "goBackToTaskList", sender: self)
            
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
