//
//  API.swift
//  RecipeBook
//
//  Created by Austins Work on 10/17/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import Foundation

struct SpoonacularAPIConfiguration {
    let baseURL : String
    let apiKey : String
    
    init() {
        let bundle = Bundle.main
        guard let plistURL = bundle.url(forResource: "RecipeConfig", withExtension: "plist"), let plistData = try? Data.init(contentsOf: plistURL), let plistAny = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil), let plist = plistAny as? [String: Any] else {
            fatalError("Could not load MeetupConfig.plist")
        }
        self.apiKey = plist["APIKey"] as! String
        self.baseURL = plist["BaseURL"] as! String
    }
}
enum Method : String {
    case findByIngredient = "/recipes/findByIngredients"
}

enum SpoonacularError : Error{
    case invalidJSONData
    case invalidURL
}

enum RecipeResult {
    case success([Recipe])
    case failure(Error)
    
}

public func getBaseURL() -> String {
    let baseURLConfig = SpoonacularAPIConfiguration()
    let baseURL = baseURLConfig.baseURL
    return baseURL
}

public func getAPIKey() -> String {
    let apiKeyConfig = SpoonacularAPIConfiguration()
    let apiKey = apiKeyConfig.apiKey
    return apiKey
}

public func createRecipeInformationMethod(id: Int) -> String {
    let method = "/recipes/{\(id)}/information"
    return method
}

public func createAnalyzedRecipeInstructionMethod(id: Int) -> String  {
    let method = "/recipes/{\(id)}/analyzedInstructions"
    return method
}


class SpoonacularAPI {
    
     func spoonacularURL(method: Method) -> URL {
        let baseURLString = getBaseURL()
        let apiKey = getAPIKey()
        let x = IngredientsViewController()
        var components = URLComponents(string : baseURLString + Method.findByIngredient.rawValue)!
        var queryItems = [URLQueryItem]()
        let paramInfo = ["ingredients": x.arrayToString(),
                         "X-Mashape-Key": apiKey]
        for (key, value) in paramInfo{
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        components.queryItems = queryItems
        return components.url!
    }
    
    class func recipeFromJSONData(_ data: Data) -> RecipeResult {
        do {
            let jsonObject: Any = try JSONSerialization.jsonObject(with: data, options: [])
            guard let
                jsonDictionary = jsonObject as? [String: AnyObject],
                let recipeArray = jsonDictionary["results"] as? [[String:AnyObject]] else{
                    // The JSON structure doesn't match our expectations
                    return .failure(SpoonacularError.invalidJSONData)
            }
            //
            var finalRecipe = [Recipe]()
            for recipeJSON in recipeArray {
                if let recipe = recipeFromJSONObject(recipeJSON) {
                    finalRecipe.append(recipe)
                }
            }
            
            if finalRecipe.count == 0  {
                // We weren't able to parse any of the photos.
                // Maybe the JSON format for photos has changed.
                return .failure(SpoonacularError.invalidJSONData)
            }
            return .success(finalRecipe)
        }
        catch let error {
            return .failure(error)
        }
    }
    
    //Defines the City Object
    class func recipeFromJSONObject(_ json: [String : AnyObject]) -> Recipe? {
        guard let
            id = json["id"] as? Int,
            let title = json["title"] as? String,
            let image = json["image"] as? String,
            let imageType = json["imageType"] as? String,
            let usedIngredientCount = json["usedIngredientCount"] as? Int,
            let missedIngredientCount = json["missedIngredientCount"] as? Int,
            let likes = json["likes"] as? Int else{
                
                // Don't have enough information to construct a User
                return nil
        }
        
        return Recipe(id: id, title: title, image: image, imageType: imageType, usedIngredientCount : usedIngredientCount, missedIngredientCount: missedIngredientCount, likes:likes)
    }
}










