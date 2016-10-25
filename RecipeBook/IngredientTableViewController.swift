//
//  IngredientTableViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/23/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController {
    var meats : [Meat] = [.chicken, Meat.steak,Meat.pork,Meat.turkey, Meat.groundBeef]
    var seafoods : [Seafood] = [Seafood.fish,Seafood.crab,Seafood.shrimp,Seafood.crawfish,Seafood.lobster]
    var fruits : [Fruit] = [Fruit.apple,Fruit.banana, Fruit.orange, Fruit.strawberry, Fruit.watermellon]
    var vegetables : [Vegetable] = [Vegetable.carrot, Vegetable.lettuce,Vegetable.greenPepper, Vegetable.onion, Vegetable.tomato]
    var dairyProducts : [DairyProduct] = [DairyProduct.butter,DairyProduct.cheese,DairyProduct.milk,DairyProduct.yogurt]
    var stapleFoods : [StapleFood] = [StapleFood.beans,StapleFood.rice,StapleFood.bread,StapleFood.pasta,StapleFood.potatoe]
    var ingredientsArray : [String] = []
    var store = RecipeStore()
    var recipes : [Recipe] = []

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        let typesOfIngredient = [meats, seafoods, fruits,vegetables,dairyProducts,stapleFoods] as [Any]
        return typesOfIngredient.count
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var sectionNames : [String] = getHeader(ingredient: ingredient)
//        
//        for header in sectionNames{
//            sectionName = header
//        }
        var sectionName : String
        
        switch section {
        case 0:
            sectionName = "Meat"
        case 1:
            sectionName = "Seafood"
        case 2:
            sectionName = "Fruit"
        case 3:
            sectionName = "Vegetable"
        case 4:
            sectionName = "Dairy Product"
        case 5:
            sectionName = "Staple Food"
        default:
            sectionName = "Something Went Wrong"
        }
        return sectionName
    }
    
//    overide func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        switch section {
//        case 0 :
//            <#code#>
//        case 1 :
//            <#code#>
//        case 2 :
//            <#code#>
//        case 3 :
//            <#code#>
//        case 4 :
//            <#code#>
//        case 5 :
//            <#code#>
//        default:
//            <#code#>
//        }
//    }



    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
//        let statusBarHeight = UIApplication.shared.statusBarFrame.height
//        
//        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
//        tableView.contentInset = insets
//        tableView.scrollIndicatorInsets = insets
//        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 65
//        
//        navigationItem.rightBarButtonItem?.title = "Continue"
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.init(red: 0, green: 128/255, blue: 128/255, alpha: 1)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows : Int
        switch section {
        case 0:
            rows = meats.count
        case 1:
            rows = seafoods.count
        case 2:
            rows = fruits.count
        case 3:
            rows = vegetables.count
        case 4:
            rows = dairyProducts.count
        case 5:
            rows = stapleFoods.count
        default:
            rows = 0
        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell",
                                                 for: indexPath) as! IngredientCell
        
        cell.backgroundColor = UIColor.init(red: 180/255, green: 216/255, blue: 231/255, alpha: 1)

        
        switch indexPath.section {
        case 0:
            let meat = self.meats[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = meat.rawValue
            if ingredientsArray.contains(meat.rawValue){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        case 1:
            let seafood = self.seafoods[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = seafood.rawValue
            if ingredientsArray.contains(seafood.rawValue){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        case 2:
            let fruit = self.fruits[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = fruit.rawValue
            if ingredientsArray.contains(fruit.rawValue){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        case 3:
            let vegetable = self.vegetables[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = vegetable.rawValue
            if ingredientsArray.contains(vegetable.rawValue){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        case 4:
            let dairyProduct = self.dairyProducts[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = dairyProduct.rawValue
            if ingredientsArray.contains(dairyProduct.rawValue){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        case 5:
            let stapleFood = self.stapleFoods[(indexPath as NSIndexPath).row]
            cell.ingredientLabel.text = stapleFood.rawValue
            if ingredientsArray.contains(stapleFood.rawValue){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        default:
            return cell
        }
        
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if !ingredientsArray.contains((cell?.textLabel?.text)!){
            ingredientsArray.append((cell?.textLabel?.text)!)
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            var ingredientLocation = ingredientsArray.index(of: (cell?.textLabel?.text)!)
            ingredientsArray.remove(at: ingredientLocation!)
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        for ingredients in ingredientsArray{
//            if let ingredients = cell?.textLabel?.text{
//                var ingredientLocation = ingredientsArray.index(of: ingredients)
//                ingredientsArray.remove(at: ingredientLocation!)
//                cell?.accessoryType = UITableViewCellAccessoryType.none
//                
//            }
//        }
//    }

    @IBAction func countineButton(_ sender: AnyObject) {
        OperationQueue.main.addOperation {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tableViewController = storyboard.instantiateViewController(withIdentifier: "PreviewIngredientsTableViewController") as! PreviewIngredientsTableViewController
            tableViewController.recipes = self.recipes
            tableViewController.store = self.store
            tableViewController.ingredientsArray = self.ingredientsArray
            self.show(tableViewController, sender: self)
            
        }
        
    }
    

    
}
