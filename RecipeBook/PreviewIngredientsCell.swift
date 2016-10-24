//
//  PreviewIngredientsCell.swift
//  RecipeBook
//
//  Created by Austins Work on 10/24/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class PreviewIngredientsCell: UITableViewCell {
    @IBOutlet var previewIngredientLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateWithPreviewIngredient(nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        updateWithPreviewIngredient(nil)
    }
    func updateWithPreviewIngredient(_ ingredient: String?) {
        if let previewIngredientToDisplay = ingredient {
            previewIngredientLabel.text = previewIngredientToDisplay
        }
        else {
            previewIngredientLabel.text = nil
        }
    }
    
}
