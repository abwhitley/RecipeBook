//
//  IngredientTableViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/23/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController {
    var meats : [Meat] = [Meat.chicken, Meat.steak,Meat.pork,Meat.turkey, Meat.groundBeef]
    var seafoods : [Seafood] = [Seafood.fish,Seafood.crab,Seafood.shrimp,Seafood.crawfish,Seafood.lobster]
    var fruits : [Fruit] = [Fruit.apple,Fruit.banana, Fruit.orange, Fruit.strawberry, Fruit.watermellon]
    var vegetables : [Vegetable] = [Vegetable.carrot, Vegetable.lettuce,Vegetable.greenPepper, Vegetable.onion, Vegetable.tomato]
    var dairyProducts : [DairyProduct] = [DairyProduct.butter,DairyProduct.cheese,DairyProduct.milk,DairyProduct.yogurt]
    var stapleFoods : [StapleFood] = [StapleFood.beans,StapleFood.rice,StapleFood.bread,StapleFood.pasta,StapleFood.potatoe]
    var ingredientsArray : [String] = []
    var store = RecipeStore()
    var recipes : [Recipe] = []

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        let typesOfIngredient = [meats, seafoods, fruits,vegetables,dairyProducts,stapleFoods] as [Any]
        return typesOfIngredient.count
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName : String
        switch section {
        case 0:
            sectionName = "Meat"
        case 1:
            sectionName = "Seafood"
        case 2:
            sectionName = "Fruit"
        case 3:
            sectionName = "Vegetable"
        case 4:
            sectionName = "Dairy Product"
        case 5:
            sectionName = "Staple Food"
        default:
            sectionName = "Something Went Wrong"
        }
        return sectionName
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows : Int
        switch section {
        case 0:
            rows = meats.count
        case 1:
            rows = seafoods.count
        case 2:
            rows = fruits.count
        case 3:
            rows = vegetables.count
        case 4:
            rows = dairyProducts.count
        case 5:
            rows = stapleFoods.count
        default:
            rows = 0
        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell",
                                                 for: indexPath) as! IngredientCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        switch indexPath.section {
        case 0:
            let meat = self.meats[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = meat.rawValue
        case 1:
            let seafood = self.seafoods[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = seafood.rawValue
        case 2:
            let fruit = self.fruits[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = fruit.rawValue
        case 3:
            let vegetable = self.vegetables[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = vegetable.rawValue
        case 4:
            let dairyProduct = self.dairyProducts[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = dairyProduct.rawValue
        case 5:
            let stapleFood = self.stapleFoods[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = stapleFood.rawValue
        default:
            return cell
        }
        
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        ingredientsArray.append((cell?.textLabel?.text)!)
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
    }
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        for ingredients in ingredientsArray{
//            if let ingredients = cell?.textLabel?.text{
//                var ingredientLocation = ingredientsArray.index(of: ingredients)
//                ingredientsArray.remove(at: ingredientLocation!)
//                cell?.accessoryType = UITableViewCellAccessoryType.none
//                
//            }
//        }
//    }

    @IBAction func countineButton(_ sender: AnyObject) {
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
