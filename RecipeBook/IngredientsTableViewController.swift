//
//  IngredientsTableViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/18/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    var recipes: [Recipe] = []
    var store: RecipeStore!
    var instructionStore : InstructionStore!
    var steps: [Steps] = []
    var recipeTitle : String = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 180/255, green: 216/255, blue: 231/255, alpha: 1)
        
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell",
                                                 for: indexPath) as! RecipeCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let recipe = recipes[(indexPath as NSIndexPath).row]
        
        cell.titleLabel.text = recipe.title
        cell.backgroundColor = UIColor.init(red: 180/255, green: 216/255, blue: 231/255, alpha: 1)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for recipe in recipes{
            if recipe.title == tableView.cellForRow(at: indexPath)?.textLabel?.text{
                var id = recipe.id
                instructionStore.fetchInstructions(id: id){
                    (AnalyzedInstructionResult) -> Void in
                    OperationQueue.main.addOperation {
                    switch AnalyzedInstructionResult{
                    case let .success(AnalyzedInstructionResult):
                        print("Successfully found \(AnalyzedInstructionResult.count) recipes.")
                        for step in AnalyzedInstructionResult{
                            self.steps.append(step)
                            print(step.step)
                        }
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let recipeInstructionViewController = storyboard.instantiateViewController(withIdentifier: "InstructionTableViewController") as! InstuctionTableViewController
                        recipeInstructionViewController.steps = self.steps
                        self.show(recipeInstructionViewController, sender: self)
                    case let .failure(error):
                        print("Error fetching steps: \(error)")
                        }
                    }
                }
            }else {
                print("🔥🔥🔥Not The Recipe You Are Looking For🔥🔥🔥")
            }
            print("🔥🔥🔥Finished IF Statement🔥🔥🔥")
        }
        print("🔥🔥🔥\(tableView.cellForRow(at: indexPath)?.textLabel?.text)🔥🔥🔥")
    
    }
    
}
