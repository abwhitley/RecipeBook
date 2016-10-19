//
//  RecipeStore.swift
//  RecipeBook
//
//  Created by Austins Work on 10/12/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit


//MARK: Class RecipeStore
public class RecipeStore {
    var recipes: [Recipe] = []

    
    public  var idArray : [AnyObject] = []
    public  var titleArray : [AnyObject] = []
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration:config)
    }()
    
    // Func to check if we get data from JSON
    func processRecipeRequest(data: Data?, error: NSError?) -> RecipeResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return SpoonacularAPI.recipesFromJSONData(jsonData)
    }
    
     //Fuction for URL Request
    func fetchRecipes(ingredientList: [String], completion: @escaping (RecipeResult) -> Void) {
        let url = SpoonacularAPI.request(input: ingredientList)
        var urlrequest = URLRequest(url: url as URL)
        urlrequest.httpMethod = "GET"
        urlrequest.addValue(getAPIKey(), forHTTPHeaderField: "X-Mashape-Key")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: urlrequest, completionHandler: {
            (data, response, error) -> Void in
            
            let result = self.processRecipeRequest(data: data, error: error as NSError?)
            completion(result)
            
        })
        task.resume()
    }
    
    func fetchTitleForRecipe(_ recipe: Recipe) -> String{
        
        let recipeTitle = recipe.title
        return recipeTitle
        
    }
    

    
    public  func returnIDArray() -> [AnyObject] {
        print("\(idArray)")
        return idArray
    }
    public func returnTitleArray() -> [AnyObject]{
        print("\(titleArray)")
        return titleArray
    }
    
}
