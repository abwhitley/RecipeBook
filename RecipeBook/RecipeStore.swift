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
        
        return SpoonacularAPI.recipesFromJSONData(jsonData)
    }
    
     //Fuction for URL Request
    func fetchRecipes(ingredientList: [String], completion: @escaping (RecipeResult) -> Void) {
        let x = SpoonacularAPI()
        let url = SpoonacularAPI.request(input: ingredientList)
        var urlrequest = URLRequest(url: url as URL)
        urlrequest.httpMethod = "GET"
        urlrequest.addValue(getAPIKey(), forHTTPHeaderField: "X-Mashape-Key")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: urlrequest, completionHandler: {
            (data, response, error) -> Void in
            
            let result = self.processRecipeRequest(data: data, error: error as NSError?)
            completion(result)
            if data != nil {
                
                let jsonData = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String: AnyObject]]
                
                let recipeData = try! jsonData[0] as! [String: AnyObject]
                
                print("🔥🔥🔥\n We got Recipes Bitches\n🔥🔥🔥")
                print("🔥🔥🔥\n\n\n\n ID is \(recipeData)🔥🔥🔥")
                                    
            }

        })
        task.resume()
    }
}
