//
//  InstructionCell.swift
//  RecipeBook
//
//  Created by Austins Work on 10/23/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class InstructionCell: UITableViewCell {
    @IBOutlet var instructionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateWithInstruction(nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        updateWithInstruction(nil)
    }
    func updateWithInstruction(_ instruction: String?) {
        if let instructionToDisplay = instruction {
            instructionLabel.text = instructionToDisplay
        }
        else {
            instructionLabel.text = nil
        }
    }


}
