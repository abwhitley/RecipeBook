//
//  IngredientsViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/10/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

//public class IngredientsViewController: UIViewController {
//    
//    var ingredients = Ingredients(typesOfIngredient: [])
//    var store = RecipeStore()
//    var recipes : [Recipe] = []
//    
//    
//    @IBAction func chickenButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("chicken")
//    }
//    @IBAction func steakButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("steak")
//    }
//    @IBAction func porkButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("pork")
//    }
//    @IBAction func fishButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("fish")
//    }
//    @IBAction func crabButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("crab")
//    }
//    @IBAction func shrimpButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("shrimp")
//    }
//    @IBAction func cheeseButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("cheese")
//    }
//    @IBAction func butterButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("butter")
//    }
//    @IBAction func sourCreamButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("sour cream")
//    }
//    @IBAction func appleButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("apple")
//    }
//    @IBAction func pineappleButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("pineapple")
//    }
//    @IBAction func orangeButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("orange")
//    }
//    @IBAction func onionButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("onion")
//    }
//    @IBAction func carrotButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("carrot")
//    }
//    @IBAction func greenPepperButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("green pepper")
//    }
//    @IBAction func riceButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("rice")
//    }
//    @IBAction func breadButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("bread")
//    }
//    @IBAction func pastaButton(_ sender: AnyObject) {
//        ingredients.ingredientList.append("pasta")
//    }
//    
//    
//    
//    @IBAction func doneButton(_ sender: AnyObject) {
//        print("Your Ingredient List Contains: \(ingredients.ingredientList.joined(separator: ", "))")
//        store.fetchRecipes(ingredientList: ingredients.ingredientList) {
//            (RecipeResult) -> Void in
//            
//            OperationQueue.main.addOperation {
//                
//                switch RecipeResult {
//                case let .success(RecipeResult):
//                    print("Successfully found \(RecipeResult.count) recipes.")
//                    for recipe in RecipeResult{
//                        self.recipes.append(recipe)
//                        print(recipe.id, recipe.title)
//                    }
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let tableViewController = storyboard.instantiateViewController(withIdentifier: "IngredientsTableViewController") as! IngredientsTableViewController
//                    tableViewController.recipes = self.recipes
//                    tableViewController.store = self.store
//                    tableViewController.instructionStore = InstructionStore()
//                    self.show(tableViewController, sender: self)
//                case let .failure(error):
//                    print("Error fetching recipes: \(error)")
//                }
//                
//            }
//            
//        }
//        
//    }
//    
//}
//








