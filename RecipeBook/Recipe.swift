//
//  Recipe.swift
//  RecipeBook
//
//  Created by Austins Work on 10/12/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import Foundation

class Recipe {
    var id : Int
    var title : String
    var image : String
    var imageType : String
    var usedIngredientCount : Int
    var missedIngredientCount : Int
    var likes : Int
    
    init (id : Int,
          title : String,
          image : String,
          imageType : String,
          usedIngredientCount : Int,
          missedIngredientCount : Int,
          likes : Int){
        self.id = id
        self.title = title
        self.image = image
        self.imageType = imageType
        self.usedIngredientCount = usedIngredientCount
        self.missedIngredientCount = missedIngredientCount
        self.likes = likes
    }
}
