//
//  RecipeStore.swift
//  RecipeBook
//
//  Created by Austins Work on 10/12/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

//MARK: Class RecipeStore
class RecipeStore {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration:config)
    }()
    
    // Func to check if we get data from JSON
    func processRecipeRequest(data: Data?, error: NSError?) -> RecipeResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return SpoonacularAPI.recipeFromJSONData(jsonData)
    }
    
    // Fuction for URL Request
    func fetchRecipes(completion: @escaping (RecipeResult) -> Void) {
        let x = SpoonacularAPI()
        let url = x.spoonacularURL(method:Method.findByIngredient)
        let request = URLRequest(url: url as URL)
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            
            let result = self.processRecipeRequest(data: data, error: error as NSError?)
            completion(result)
        })
        task.resume()
    }
}
