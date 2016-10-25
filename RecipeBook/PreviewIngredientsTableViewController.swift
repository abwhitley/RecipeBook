//
//  PreviewIngredientsTableViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/24/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class PreviewIngredientsTableViewController: UITableViewController {
    
    var ingredientsArray : [String] = []
    var recipes: [Recipe] = []
    var store: RecipeStore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 180/255, green: 216/255, blue: 231/255, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.init(red: 0, green: 128/255, blue: 128/255, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsArray.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewIngredientsCell",
                                                 for: indexPath) as! PreviewIngredientsCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let ingredient = ingredientsArray[(indexPath as NSIndexPath).row]
        
        cell.previewIngredientLabel.text = ingredient
        cell.backgroundColor = UIColor.init(red: 180/255, green: 216/255, blue: 231/255, alpha: 1)

        
        return cell
    }
    
    
    
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        let item = ingredientsArray[(indexPath as NSIndexPath).row]
        
        
        let title = "Delete \(item)?"
        let message = "Are you sure you want to delete this item?"
        
        let ac = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                         handler: { (action) -> Void in
                                            // Remove the item from the store
                                            var ingredientLocation = self.ingredientsArray.index(of: item)
                                            self.ingredientsArray.remove(at: ingredientLocation!)
                                            
                                            // Also remove that row from the table view with an animation
                                            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        })
        ac.addAction(deleteAction)
        
        // Present the alert controller
        present(ac, animated: true, completion: nil)
     }
    

    }
    
    
    @IBAction func continueButton(_ sender: AnyObject) {
        print(ingredientsArray)
        print("Your Ingredient List Contains: \(ingredientsArray.joined(separator: ", "))")
        store.fetchRecipes(ingredientList: ingredientsArray) {
            (RecipeResult) -> Void in
            
            OperationQueue.main.addOperation {
                
                switch RecipeResult {
                case let .success(RecipeResult):
                    print("Successfully found \(RecipeResult.count) recipes.")
                    for recipe in RecipeResult{
                        self.recipes.append(recipe)
                        print(recipe.id, recipe.title)
                    }
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let tableViewController = storyboard.instantiateViewController(withIdentifier: "IngredientsTableViewController") as! IngredientsTableViewController
                    tableViewController.recipes = self.recipes
                    tableViewController.store = self.store
                    tableViewController.instructionStore = InstructionStore()
                    self.show(tableViewController, sender: self)
                case let .failure(error):
                    print("Error fetching recipes: \(error)")
                }
                
            }
            
        }
        
    }
    
    
    
    
    
}
