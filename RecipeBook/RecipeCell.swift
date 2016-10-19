//
//  RecipeCell.swift
//  RecipeBook
//
//  Created by Austins Work on 10/18/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell{
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateWithTitle(nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        updateWithTitle(nil)
    }
    
    func updateWithTitle(_ title: String?) {
        if let recipeToDisplay = title {
            spinner.stopAnimating()
            titleLabel.text = recipeToDisplay
        }
        else {
            spinner.startAnimating()
            titleLabel.text = nil
        }
    }

}
