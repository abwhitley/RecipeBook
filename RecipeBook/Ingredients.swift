//
//  Ingredients.swift
//  RecipeBook
//
//  Created by Austins Work on 10/12/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import Foundation

enum TypesOfIngredient{
    enum Meat : String{
        case chicken = "Chicken"
        case steak = "Steak"
        case pork = "Pork"
        case turkey = "Turkey"
        case groundBeef = "Ground Beef"
    }
    enum Seafood : String{
        case fish = "Fish"
        case crab = "Crab"
        case shrimp = "Shrimp"
        case crawfish = "CrawFish"
        case lobster = "Lobster"
    }
    enum Fruit : String{
        case apple = "Apple"
        case banana = "Banana"
        case orange = "Orange"
        case watermellon = "Watermellon"
        case strawberry = "Strawberry"
    }
    enum Vegetable : String{
        case onion = "Onion"
        case greenPepper = "Green Pepper"
        case tomato = "Tomato"
        case lettuce = "Lettuce"
        case carrot = "Carrot"
    }
    enum DairyProduct : String{
        case cheese = "Cheese"
        case milk = "Milk"
        case butter = "Butter"
        case yogurt = "Yogurt"
    }
    enum StapleFood : String{
        case rice = "Rice"
        case bread = "Bread"
        case pasta = "Pasta"
        case beans = "Beans"
        case potatoe = "Potatoe"
    }

}

class Ingredients {
    var meats : [TypesOfIngredient.Meat.RawValue]
    var seafood : [TypesOfIngredient.Seafood.RawValue]
    var fruit : [TypesOfIngredient.Fruit.RawValue]
    var vegetable : [TypesOfIngredient.Vegetable.RawValue]
    var dairyProduct : [TypesOfIngredient.DairyProduct.RawValue]
    var stapleFood : [TypesOfIngredient.StapleFood.RawValue]
    
    init (meats : [TypesOfIngredient.Meat.RawValue],
          seafood : [TypesOfIngredient.Seafood.RawValue],
          fruit : [TypesOfIngredient.Fruit.RawValue],
          vegetable : [TypesOfIngredient.Vegetable.RawValue],
          dairyProduct : [TypesOfIngredient.DairyProduct.RawValue],
          stapleFood : [TypesOfIngredient.StapleFood.RawValue]){
        self.meats = meats
        self.seafood = seafood
        self.fruit = fruit
        self.vegetable = vegetable
        self.dairyProduct = dairyProduct
        self.stapleFood = stapleFood
    }
}
