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
        view.backgroundColor = UIColor.init(red: 180/255, green: 216/255, blue: 231/255, alpha: 1)
        
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
        cell.backgroundColor = UIColor.init(red: 180/255, green: 216/255, blue: 231/255, alpha: 1)
        
        return cell
    }
    
    

}
