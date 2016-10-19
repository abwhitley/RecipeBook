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
    
    
    public static func arrayToString(_ input: [String]) -> String{
        
        let ingredientToSend = input.joined(separator: ",")
       return ingredientToSend
        
    }
    
    static func createEndpoint(method: Method) -> String{
        let baseURL = getBaseURL()
        let endpoint =  baseURL + Method.findByIngredient.rawValue
        return endpoint
    }
    
    static func request(input: [String]) -> URL {
        let urlWithEndpoint = createEndpoint(method: .findByIngredient)
        var components = URLComponents (string :urlWithEndpoint)!
        var queryItems = [URLQueryItem]()
        let paramInfo = ["ingredients": arrayToString(input)]
        for (key, value) in paramInfo{
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        components.queryItems = queryItems
        return components.url!
        
    }
    
    class func recipesFromJSONData(_ data: Data) -> RecipeResult {
        do {
            let jsonObject: Any = try JSONSerialization.jsonObject(with: data, options: []) 

            var jsonDictionary = jsonObject as? [[String: AnyObject]]
            
            var finalRecipes = [Recipe]()
            for recipeJSON in jsonDictionary! {
                if let recipe = recipeFromJSONObject(recipeJSON) {
                    finalRecipes.append(recipe)
                }
            }
            
            if finalRecipes.count == 0  {
                // We weren't able to parse any of the photos.
                // Maybe the JSON format for photos has changed.
                return .failure(SpoonacularError.invalidJSONData)
            }
            return .success(finalRecipes)
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
                
                // Don't have enough information to construct a City
                return nil
        }
        
        return Recipe(id: id, title: title, image: image, imageType: imageType, usedIngredientCount: usedIngredientCount, missedIngredientCount: missedIngredientCount, likes: likes)
    }


}










