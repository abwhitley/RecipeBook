//
//  RecipeBookTests.swift
//  RecipeBookTests
//
//  Created by Austins Work on 10/10/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import XCTest
@testable import RecipeBook

class RecipeBookTests: XCTestCase {
    
    func testEndpointMaker(){
        let expected = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients")
        let result : URL = URL(string : SpoonacularAPI.createEndpoint(method: .findByIngredient))!
        XCTAssertEqual(expected, result)
        
    }
    
}
