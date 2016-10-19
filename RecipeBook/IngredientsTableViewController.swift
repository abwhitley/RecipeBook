//
//  IngredientsTableViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/18/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    var recipes: [Recipe] = []
    var store: RecipeStore!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell",
                                                 for: indexPath) as! RecipeCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let recipe = recipes[(indexPath as NSIndexPath).row]
        
        cell.titleLabel.text = recipe.title

        
        return cell
    }
    
}
