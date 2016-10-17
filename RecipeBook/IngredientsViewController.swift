//
//  IngredientsViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/10/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

public class IngredientsViewController: UIViewController {
    
    var ingredients = Ingredients(ingredientList: [])
    var store = RecipeStore()
    
    public func arrayToString() -> String{
        let ingredientToSend = ingredients.ingredientList.joined(separator: "%2C")
        return ingredientToSend
    }
    
    
    @IBAction func chickenButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("chicken")
    }
    @IBAction func steakButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("steak")
    }
    @IBAction func porkButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("pork")
    }
    @IBAction func fishButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("fish")
    }
    @IBAction func crabButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("crab")
    }
    @IBAction func shrimpButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("shrimp")
    }
    @IBAction func cheeseButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("cheese")
    }
    @IBAction func butterButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("butter")
    }
    @IBAction func sourCreamButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("sour cream")
    }
    @IBAction func appleButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("apple")
    }
    @IBAction func pineappleButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("pineapple")
    }
    @IBAction func orangeButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("orange")
    }
    @IBAction func onionButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("onion")
    }
    @IBAction func carrotButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("carrot")
    }
    @IBAction func greenPepperButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("green pepper")
    }
    @IBAction func riceButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("rice")
    }
    @IBAction func breadButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("bread")
    }
    @IBAction func pastaButton(_ sender: AnyObject) {
        ingredients.ingredientList.append("pasta")
    }
    
    
    
    @IBAction func doneButton(_ sender: AnyObject) {
        print("Your Ingredient List Contains: \(ingredients.ingredientList.joined(separator: ", "))")
        var ingredientString = arrayToString()
        let session = URLSession.shared
        
        var api = SpoonacularAPI()
        
        
        let url: URL = api.spoonacularURL(method: .findByIngredient).appendingPathComponent(ingredientString)
        var urlrequest: URLRequest = URLRequest.init(url: url)
        urlrequest.httpMethod = "GET"
        urlrequest.addValue(getAPIKey(), forHTTPHeaderField: "X-Mashape-Key")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do{
                let task = session.dataTask(with: urlrequest)  { (data: Data?, response: URLResponse?, error: Error?) in
                
                
                if data != nil {
                    
                    let jsonData = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String: AnyObject]]
                    
                    let recipeData = try! jsonData
                    
                    print("🔥🔥🔥\n\n\n\n We got \(data)\n\n\n\n🔥🔥🔥")
                    print("🔥🔥🔥\n\n\n\n ID is \(recipeData)🔥🔥🔥")
                    
                }
                
            }
            task.resume()
        }catch{
            print("🔥🔥🔥somthing went wrong🔥🔥🔥")
        }
        
        
        
//        store.fetchRecipes() {
//            (RecipeResult) -> Void in
//            
//            switch RecipeResult {
//            case let .success(RecipeResult):
//                print("Successfully found \(RecipeResult.count) recipes.")
//                for recipe in RecipeResult{
//                    print(recipe.id, recipe.title)
//                }
//                
//            case let .failure(error):
//                print("Error fetching recipes: \(error)")
//            }
//            
//        }


    }
}




