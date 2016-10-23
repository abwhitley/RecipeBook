//
//  InstructionsViewController.swift
//  RecipeBook
//
//  Created by Austins Work on 10/20/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class InstuctionTableViewController : UITableViewController{
    var steps : [Steps] = []
    
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
        return steps.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionCell",
                                                 for: indexPath) as! InstructionCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let step = steps[(indexPath as NSIndexPath).row]
        
        cell.instructionLabel.text = step.step
        
        
        return cell
    }
    
    

}
